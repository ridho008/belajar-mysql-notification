
# membuat table membaca pesan
create table notification_read(
   id int not null auto_increment,
   is_read boolean not null,
   notification_id int not null,
   user_id varchar(100) not null,
   primary key (id)
) engine = innodb;

alter table notification_read
add constraint fk_notification_read_notification
foreign key (notification_id) references notification (id);

alter table notification_read
add constraint fk_notification_read_user
foreign key (user_id) references user (id);

select * from notification;

insert into notification_read (is_read, notification_id, user_id)
values (true, 2, 'ridho');

insert into notification_read (is_read, notification_id, user_id)
values (true, 2, 'harun');

select * from notification_read;

# melihat user apakah telah membaca notif atau belum.
# jadi user_id (tb_notification) dan user_id (tb_notification_read) saling keterkaitan, karena menggunakan INNER JOIN
select * from notification n 
   join category c on (n.category_id = c.id)
   join notification_read nr on (nr.notification_id = n.id)
where (n.user_id = 'harun' or n.user_id is null) 
and (nr.user_id = 'harun')
order by n.create_at desc;

# menampilkan user yang telah membaca pesan
# counter yang belum di read
select * from notification n 
   join category c on (n.category_id = c.id)
   left join notification_read nr on (nr.notification_id = n.id)
where (n.user_id = 'harun' or n.user_id is null)
and (nr.user_id = 'harun' or nr.user_id is null)
order by n.create_at desc;

insert into notification(title, detail, category_id, user_id, create_at)
values ('Contoh Pesanan Lagi', 'Detail Pesanan Lagi', 'INFO', 'harun', CURRENT_TIMESTAMP);

insert into notification(title, detail, category_id, user_id, create_at)
values ('Contoh Promo Lagi', 'Detail Promo Lagi', 'PROMO', null, CURRENT_TIMESTAMP);