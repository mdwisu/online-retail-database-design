-- ! membuat database

create database online_retail

use online_retail

-- ! membuat tabel

create table category (
	id int primary key not null auto_increment,
	name VARCHAR(25)
);

create table product (
	id int primary key not null auto_increment,
	name VARCHAR(50),
	description varchar(255),
	price int,
	category_id int,
	FOREIGN KEY (category_id) REFERENCES category(id)
); 

create table member (
	id int primary key not null auto_increment,
	email varchar(50) unique,
	password varchar(50),
	fullname varchar(50),
	address varchar(255),
	phone varchar(20),
	gender enum('male','female'),
	birthdate date
)

create table cart (
	id int primary key not null auto_increment,
	member_id int,
	product_id int,
	quantity int,
	foreign key (member_id) references member(id),
	foreign key (product_id) references product(id)
)

create table transaction (
	id int primary key not null auto_increment,
	member_id int,
	product_id int,
	quantity int,
	approval_status int(1),
	foreign key (member_id) references member(id),
	foreign key (product_id) references product(id)
)

alter table transaction 
change approval_status approval_status_id int(1);

alter table transaction
add date_transaction date

create table approval_status (
	id int primary key not null auto_increment,
	name varchar(20)
)

alter table transaction
add foreign key (approval_status_id)
references approval_status(id);


create table rating (
	id int primary key not null auto_increment,
	member_id int,
	product_id int,
	value int(1),
	foreign key (member_id) references member(id),
	foreign key (product_id) references product(id)
)

create table comment (
	id int primary key not null auto_increment,
	member_id int,
	product_id int,
	message varchar(255),
	foreign key (member_id) references member(id),
	foreign key (product_id) references product(id)
)

-- ! mengisi data ke table

insert into category (name) VALUES
("buku"), 
("dapur"), 
("elektronik"),
("fashion"),
("musik"),
("gaming"),
("handphone"),
("kamera"),
("kecantikan"),
("kesehatan"),
("olahraga");

insert into product (name, description, price, category_id) VALUES
("juz amma", "ini adalah juz amma", 101150, 1), 
("the shadow and bone", "ini buku terbagus", 554000, 1), 
("spatula silicon", "ini spatula awet", 22000, 2),
("talenan kayu", "talenan kayu estetik", 70000, 2),
("lampu bohlam led", "bohlam awet", 3500, 3),
("kompor induksi", "kompor listrik terhemat", 791010, 3),
("kostum anak batman", "kostum cartoon pahlawan batman", 85000, 4),
("kaos polos cotton", "kaos polos pria", 31500, 4),
("mic holder mikrofon", "mic untuk nyanyi", 85000, 5),
("soundtech 2.1 usb condenser", "sound tech condenser", 499000, 5),
("redragon gaming backpack", "tas gaming keren", 390000, 6),
("stick controller xbox 360", "stick xbox gaming", 97500, 6),
("baseus kabel data iphone cafule", "kabel iphone cafule", 45000, 7),
("power bank baseus 20w", "power bank paling awet", 249500, 7),
("tripod hitam 3120 black edition", "tripod black keren", 36000, 8),
("charger baterai for brica", "charger beterai camera", 95000, 8),
("miniso cermin lipat", "cermin aestetik miniso bundar", 39900, 9),
("biore pore pack black 4s", "biore untuk menghilangkan komedo", 12000, 9),
("imboost kids tablet", "imboost kesehatan immune", 29120, 10),
("habbasyifa serbuk", "serbuk alami", 38000, 10),
("pompa sepeda rockbros", "pompa sepeda awet", 36000, 11),
("gantungan kunci obeng plus minus", "gantungan kunci serbaguna", 888, 11);

insert into member (email, password, fullname, address, phone, gender, birthdate) VALUES
("dwi@gmail.com", "dwi", "muhammad dwi susanto", "jl rulita bogor selatan bogor", "08123123123", "male", "2001-10-08"),
("john@gmail.com", "john", "jhon cena", "jl john jaharta selatan jakarta", "08182348243", "male", "1980-12-17"),
("doe@gmail.com", "doe", "doe loe", "jl doe doe selatan doe", "08182348243", "male", "1980-12-17"),
("suca@gmail.com", "suca", "febrila sucia", "jl raya padang", "083457234533", "female", "2002-02-15"),
("member_5@gmail.com", "member 5", "member 5", "jl doe doe selatan doe", "08182348243", "male", "1980-12-17"),
("member_6@gmail.com", "member 6", "member 6", "jl doe doe selatan doe", "08182348243", "male", "1980-12-17"),
("member_7@gmail.com", "member 7", "member 7", "jl doe doe selatan doe", "08182348243", "male", "1980-12-17"),
("member_8@gmail.com", "member 8", "member 8", "jl doe doe selatan doe", "08182348243", "male", "1980-12-17"),
("member_9@gmail.com", "member 9", "member 9", "jl doe doe selatan doe", "08182348243", "male", "1980-12-17"),
("member_10@gmail.com", "member 10", "member 10", "jl doe doe selatan doe", "08182348243", "male", "1980-12-17");

insert into approval_status (name) values
('pending'),
('approved'),
('rejected'),
('Reassigned'),
('canceled'),
('skipped');

insert into transaction (member_id, product_id, quantity, approval_status_id, date_transaction) values
(1,4,1,2,'2022-11-5'),
(1,3,1,2,'2022-11-5'),
(4,1,1,2,'2022-11-5'),
(4,2,1,5,'2022-11-5'),
(3,5,1,2,'2022-11-5'),
(3,6,1,2,'2022-11-5'),
(4,7,1,5,'2022-11-5'),
(4,8,1,2,'2022-11-5'),
(2,9,1,5,'2022-11-5'),
(2,10,1,2,'2022-11-5'),
(1,11,1,2,'2022-8-5'),
(2,12,1,2,'2022-8-5'),
(3,13,1,2,'2022-8-5'),
(4,14,1,2,'2022-8-5');

insert into rating (member_id, product_id, value) values
(1,5,5),
(1,1,5),
(1,11,5),
(4,8,5),
(4,4,5),
(4,9,5),
(4,2,5),
(1,3,5),
(2,6,5),
(2,7,5);

insert into comment (member_id, product_id, message) values
(1,5,"brangnya bagus"),
(1,1,"brangnya mantap"),
(1,11,"brangnya bagus bagus"),
(4,8,"brangnya mantap mantap"),
(4,4,"brangnya bagus bagus bagus bagus"),
(4,9,"brangnya mantap mantap mantap"),
(4,2,"barang sesuai descripsi"),
(1,3,"barang sesuai descripsi"),
(2,6,"bagus untuk harga segini"),
(2,7,"mahal bangetttt");

-- ! mengambil data dari tabel

select * from category

select * from product

select * from member

select * from cart

select * from approval_status

select * from transaction

select * from rating

select * from comment

-- ? mengambil 3 produk paling sering dibeli pelanggan
select product.name, sum(transaction.quantity) as banyak_barang_dibeli, count(transaction.id) as jumlah_transaksi  
from transaction inner join product 
on transaction.product_id = product.id 
group by product.name 
order by sum(transaction.quantity) desc limit 3

-- ? melihat kategori barang yang paling banyak barangnya
select category.name, count(product.id) as jumlah_product 
from product inner join category on product.category_id = category.id 
group by category.name order by count(product.id) desc

-- ?
select product.name, transaction.quantity*product.price as total_sales, date_transaction as last_transaction 
from `transaction`inner join product on transaction.product_id = product.id 

-- ? melihat rata-rata transaksi dalam 1 bulan terakhir
select transaction.date_transaction, AVG(transaction.quantity*product.price) as average_sales
FROM transaction inner join product
on transaction.product_id = product.id 
GROUP BY YEAR(transaction.date_transaction), MONTH(transaction.date_transaction) desc limit 1;

-- ?
select transaction.date_transaction, AVG(transaction.quantity*product.price) as average_sales
FROM transaction inner join product
on transaction.product_id = product.id 
GROUP BY YEAR(transaction.date_transaction), MONTH(transaction.date_transaction)
HAVING COUNT(transaction.date_transaction) = DAY(LAST_DAY(transaction.date_transaction));

-- ! update tabel

select comment.id, member.fullname, product.name, comment.message
from comment inner join member on comment.member_id = member.id
inner join product on comment.product_id = product.id
where comment.id = 1

update comment 
set message = 'barangnya bagus banget nget nget'
where id = 1

select comment.id, member.fullname, product.name, comment.message
from comment inner join member on comment.member_id = member.id
inner join product on comment.product_id = product.id
where comment.id = 1

-- ! menghapus data di tabel

delete from comment
where id = 1;

delete from comment
order by id desc
LIMIT 3;

delete from comment

-- ! menghapus tabel

drop table comment

drop table rating

drop table transaction

drop table approval_status 

drop table cart

drop table member

drop table product 

drop table category


