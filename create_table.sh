create database belajar_mysql_notification;

use belajar_mysql_notification;

# User
create table user(
   id varchar(100) not null,
   name varchar(100) not null,
   primary key(id)
) engine = innodb;

show tables;

insert into user (id, name) values ('ridho', 'Ridho Surya'),
                                    ('harun', 'Harun Saputra');

select * from user;

# Notification
create table notification(
   id int not null auto_increment,
   title varchar(100) not null,
   detail text not null,
   create_at timestamp not null,
   user_id varchar(100),
   primary key(id)
) engine = innodb;

# Relation one to many (user banyak notification)
alter table notification
add constraint fk_notification_user
foreign key (user_id) references user (id);

desc notification;

# bila user_idnya ada, untuk kategori promo semua pengguna
insert into notification(title, detail, create_at, user_id)
values ('Contoh Pesanan', 'Detail Pesanan', CURRENT_TIMESTAMP(), 'ridho');

# null, untuk kategori global (promo)
insert into notification(title, detail, create_at, user_id)
values ('Contoh Promo', 'Detail Promo', CURRENT_TIMESTAMP(), null);

insert into notification(title, detail, create_at, user_id)
values ('Contoh Pembayaran', 'Detail Pembayaran', CURRENT_TIMESTAMP(), 'harun');

select * from notification where (user_id = 'ridho' or user_id is null) order by create_at desc;
select * from notification where (user_id = 'harun' or user_id is null) order by create_at desc;