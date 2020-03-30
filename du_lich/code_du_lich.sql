create database du_lich;
use du_lich;
create table diem_den_du_lich (
id int not null,
ten_diem_den varchar(100) not null,
mo_ta text not null,
gia_trung_binh double not null,
thanh_pho_id int,
primary key(id),
foreign key (thanh_pho_id) references city(id)
);

create table city(
id int not null primary key,
ten_thanh_pho varchar(50) not null
);

create table khach_hang_dat_tour(
id int not null primary key,
ten_khach_hang varchar(50) not null,
so_can_cuoc int not null,
nam_sinh date,
thanh_pho_id int,
foreign key (thanh_pho_id) references city(id)
);

create table tour(
id int not null,
tour_id int not null,
loai_tour_id int,
gia_diem_den_du_lich double not null,
ngay_bat_dau date not null,
ngay_ket_thuc date not null,
primary key(id),
foreign key(loai_tour_id) references loai_tour(id)
);

create table loai_tour(
id int not null primary key,
ma_loai int not null,
ten_loai varchar(50) not null
);

create table hoa_don_dat_tour(
id int primary key not null,
tour_id int,
khach_hang_id int,
trang_thai text,
foreign key(khach_hang_id) references khach_hang_dat_tour(id),
foreign key(tour_id) references tour(id)
);

select * from city;
select * from tour;
insert into diem_den_du_lich values(1,'abc','fsd',1000000,1);
insert into diem_den_du_lich values(2,'abc','fsd',1000000,2);
insert into diem_den_du_lich values(3,'abc','fsd',1000000,3);
insert into diem_den_du_lich values(4,'abc','fsd',1000000,4);
insert into diem_den_du_lich values(5,'abc','fsd',1000000,5);
insert into diem_den_du_lich values(6,'abc','fsd',1000000,1);
insert into diem_den_du_lich values(7,'abc','fsd',1000000,2);
insert into diem_den_du_lich values(8,'abc','fsd',1000000,3);
insert into diem_den_du_lich values(9,'abc','fsd',1000000,4);
insert into diem_den_du_lich values(10,'abc','fsd',1000000,5);

select city.ten_thanh_pho,count(ten_thanh_pho) from tour 
join diem_den_du_lich on tour.id = diem_den_du_lich.thanh_pho_id
join city on tour.id = city.id 
group by ten_thanh_pho;
select count(id) from tour where ngay_bat_dau between '2020-03-01' and '2020-03-31';
select count(id) from tour where ngay_ket_thuc between '2020-04-01' and '2020-04-30';