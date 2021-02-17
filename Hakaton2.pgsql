create table telefon_kivano(                                             
    id serial primary key,
    name varchar(255),
    price integer,
    nalichie varchar(50),
    country varchar(50),
    data DATE);

COPY telefon_kivano from '/home/sezim/pars/rabota/Kivano_tel_hak1.csv' delimiter ',' CSV HEADER;

create table nout_kivano(                                             
    id1 serial primary key,
    name1 varchar(255),
    price1 integer,
    nalichie varchar(50),
    country varchar(50),
    data DATE);

COPY nout_kivano from '/home/sezim/pars/rabota/Kivano_nout_hak1.csv' delimiter ',' CSV HEADER;

create table nout_sulpak(                                             
    id serial primary key,
    name varchar(255),
    price integer,
    nalichie varchar(50),
    country varchar(50),
    data DATE);

COPY nout_sulpak from '/home/sezim/pars/rabota/sulpak_comps1.csv' delimiter ',' CSV HEADER;

create table telefon_sulpak(                                             
    id serial primary key,
    name varchar(255),
    price integer,
    nalichie varchar(50),
    country varchar(50),
    data DATE);

COPY telefon_sulpak from '/home/sezim/pars/rabota/sulpak_smartfoniy1.csv' delimiter ',' CSV HEADER;


--4 ПАРСИНГ и пренести в SQL # 4. Выведите все китайские продукты.
select * from nout_sulpak where country = 'China';

--SQL # 5. Напишите запрос, который выводит продукты любого магазина в порядке их добавления.
select * from telefon_sulpak order by data;

--ПАРСИНГ SQL # 9. Найдите китайские товары из kivano, которые в названии содержат "k".
select *  from nout_kivano where country = 'China' and name like '%k%';

--Найдите товары, которые есть и в kivano u sulpak.
select id1,name1,id,name from nout_kivano n inner join nout_sulpak on name1=name;

-- Нужно объеденить 2 магазина по product_name и вывести на экран имя продукта и его цену из обоих магазинов, однако не факт что в обоих магазинах будут одинаковые товары, поэтому нужно joinить по полной.
select name1, price1, name, price from nout_kivano full outer join nout_sulpak on name1=name;

