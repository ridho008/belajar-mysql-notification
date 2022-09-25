# counter = total pesan yang belum dibaca
# counter yang telah di read
select count(*) from notification n 
   join category c on (n.category_id = c.id)
   left join notification_read nr on (nr.notification_id = n.id)
where (n.user_id = 'harun' or n.user_id is null)
and (nr.user_id is null)
order by n.create_at desc;

select * from notification;

insert into notification_read (is_read, notification_id, user_id)
values (true, 4, 'harun');

insert into notification_read (is_read, notification_id, user_id)
values (true, 5, 'harun');

insert into notification_read (is_read, notification_id, user_id)
values (true, 1, 'harun');

insert into notification_read (is_read, notification_id, user_id)
values (true, 3, 'harun');