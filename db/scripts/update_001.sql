create table if not exists bodyType
(
    id serial primary key ,
    name text not null
);

create table if not exists brand
(
    id serial primary key,
    name text not null
);

create table if not exists car(
    id serial primary key,
    brand_id int not null references brand(id),
    body_id int not null references bodyType(id)
);

create table if not exists users(
    id serial primary key,
    name text,
    email text unique,
    password text
);

create table if not exists post(
    id serial primary key,
    description text,
    car_id int not null references car(id),
    user_id int not null references users(id),
    photo byte[],
    isSold boolean
);


create table history_owner(
    id serial primary key,
    user_id int not null references users(id),
    car_id int not null references car(id)
);

