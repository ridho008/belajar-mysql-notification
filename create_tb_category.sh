create table category(
   id varchar(100) not null ,
   name varchar(100) not null,
   primary key(id)
) engine = innodb;

# menambahkan foregin key category_id di tb_notification
alter table notification
add column category_id varchar(100);

alter table notification
add constraint fk_notification_category
foreign key (category_id) references category(id);

select * from notification;

insert into category (id, name) values ('INFO', 'Info');
insert into category (id, name) values ('PROMO', 'Promo');

update notification set category_id = 'INFO' where id = 1; # user_id != null
update notification set category_id = 'PROMO' where id = 2; # user_id == null
update notification set category_id = 'INFO' where id = 3; # user_id != null

select * from notification n join category c on (n.category_id = c.id)
where (n.user_id = 'ridho' or n.user_id is null)
order by n.create_at desc;

select * from notification n join category c on (n.category_id = c.id)
where (n.user_id = 'harun' or n.user_id is null) and n.category_id = 'PROMO'
order by n.create_at desc;