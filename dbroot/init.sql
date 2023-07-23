create table users
(
    id           serial      not null
        constraint users_pk
            primary key,
    phone_number varchar(32) not null,
    name         varchar(32) not null
);

INSERT INTO public.users (id, phone_number, name) VALUES (1, '+79532819045', 'Alex');

create table works
(
    id   serial       not null
        constraint works_pk
            primary key,
    name varchar(128) not null
);

INSERT INTO public.works (id, name) VALUES (1, 'Присмотр за домашним хозяйством');
INSERT INTO public.works (id, name) VALUES (2, 'Нянька для детей');
INSERT INTO public.works (id, name) VALUES (3, 'Спортсмен');
INSERT INTO public.works (id, name) VALUES (4, 'Секретарь');
INSERT INTO public.works (id, name) VALUES (5, 'Извозчик');

create table injuries
(
    id   serial       not null
        constraint injuries_pk
            primary key,
    name varchar(128) not null
);

INSERT INTO public.injuries (id, name) VALUES (1, 'Без травм');
INSERT INTO public.injuries (id, name) VALUES (2, 'Без уха');
INSERT INTO public.injuries (id, name) VALUES (3, 'Глухой');
INSERT INTO public.injuries (id, name) VALUES (4, 'Немой');
INSERT INTO public.injuries (id, name) VALUES (5, 'Слепой');
INSERT INTO public.injuries (id, name) VALUES (6, 'Без глаза');
INSERT INTO public.injuries (id, name) VALUES (7, 'Без руки');
INSERT INTO public.injuries (id, name) VALUES (8, 'Без ноги');
INSERT INTO public.injuries (id, name) VALUES (9, 'Без мозгов');

create table announcements
(
    id           serial        not null
        constraint announcements_pk
            primary key,
    name         varchar(32)   not null,
    age          integer       not null,
    gender       integer       not null,
    weight       integer       not null,
    height       integer       not null,
    description  varchar(2048) not null,
    picture_path varchar(1024) not null,
    price        integer       not null,
    phone_number varchar(32)   not null,
    user_id      integer       not null
        constraint announcements_users_id_fk
            references users
            on update restrict on delete restrict,
    is_active    boolean       not null
);

INSERT INTO public.announcements (id, name, age, gender, weight, height, description, picture_path, price, phone_number, user_id, is_active) VALUES (2, 'Виктория', 24, 0, 50, 170, 'Привет мальчики принимаю в своей уютной квартире а также работаю на выезд за доп услуги по телефону буду рада подарить вам море ярких и бурных эмоций ', 'http://localhost/images/vika.jpg', 2380000, '+79993215476', 1, true);
INSERT INTO public.announcements (id, name, age, gender, weight, height, description, picture_path, price, phone_number, user_id, is_active) VALUES (1, 'Белла', 21, 1, 60, 168, 'A young sex black girl , call me for good sex . I love sex', 'http://localhost/images/bella.jpeg', 5370000, '+79991234567', 1, true);
INSERT INTO public.announcements (id, name, age, gender, weight, height, description, picture_path, price, phone_number, user_id, is_active) VALUES (3, 'Amanda', 20, 0, 52, 168, 'A young sexy attractive girl , love of sex . Good in sucking duck , my best sport is sex . Call me for a memorable time', 'http://localhost/images/amanda.jpeg', 4800000, '+79119991234', 1, true);

create table announcements_injuries
(
    announcement_id integer not null
        constraint announcements_injuries_announcements_id_fk
            references announcements
            on update restrict on delete restrict,
    injury_id       integer not null
        constraint announcements_injuries_injuries_id_fk
            references injuries
            on update restrict on delete restrict,
    constraint announcements_injuries_pk
        primary key (announcement_id, injury_id)
);

INSERT INTO public.announcements_injuries (announcement_id, injury_id) VALUES (1, 9);

create table announcements_works
(
    announcement_id integer not null
        constraint announcements_works_announcements_id_fk
            references announcements
            on update restrict on delete restrict,
    work_id         integer not null
        constraint announcements_works_works_id_fk
            references works
            on update restrict on delete restrict,
    experience      integer not null,
    constraint announcements_works_pk
        primary key (announcement_id, work_id)
);

INSERT INTO public.announcements_works (announcement_id, work_id, experience) VALUES (1, 2, 3);
INSERT INTO public.announcements_works (announcement_id, work_id, experience) VALUES (1, 4, 1);

create table comments
(
    id              serial        not null
        constraint comments_pk
            primary key,
    author_name     varchar(128)  not null,
    content         varchar(2048) not null,
    announcement_id integer       not null
        constraint comments_announcements_id_fk
            references announcements
            on update restrict on delete restrict
);

INSERT INTO public.comments (id, author_name, content, announcement_id) VALUES (1, 'Анонист', 'Не говорит по-русски. Минус в карму.', 1);