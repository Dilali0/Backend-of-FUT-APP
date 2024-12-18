use  FUT ;
CREATE TABLE Club(
club_id int primary key ,
club_nom varchar(50) unique not null ,
club_logo varchar(1000) 
);

CREATE TABLE Nationality(
Nat_id int primary key ,
Nat_nom varchar(50) unique not null ,
Nat_flag varchar(500) not null unique ,
);

CREATE TABLE Player (
    id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(100) NOT NULL UNIQUE,
    Photo varchar(500) NOt NUll Unique,
    positionn varchar(100),
    rating int,
    statu varchar(10) CHECK (statu IN ('in', 'subs') OR statu IS NULL),
    club_id int,
    nat_id int,
    diving_pace int NOT NULL,
    handling_shooting int NOT NULL,
    kicking_passing int NOT NULL,
    reflexes_dribbling int NOT NULL,
    speed_defending int NOT NULL,
    positioning_physical int NOT NULL,
    deleted_at date,
    FOREIGN KEY (club_id) REFERENCES Club(club_id),
    FOREIGN KEY (nat_id) REFERENCES Nationality(Nat_id)
);


INSERT INTO Club (club_id,club_nom, club_logo) VALUES
(1, 'Inter Miami', 'https://cdn.sofifa.net/meta/team/239235/120.png'),
(2, 'Al Nassr', 'https://cdn.sofifa.net/meta/team/2506/120.png'),
(3, 'Manchester City', 'https://cdn.sofifa.net/meta/team/9/120.png'),
(4, 'Real Madrid', 'https://cdn.sofifa.net/meta/team/3468/120.png'),
(5, 'Liverpool', 'https://cdn.sofifa.net/meta/team/8/120.png'),
(6, 'Al-Hilal', 'https://cdn.sofifa.net/meta/team/7011/120.png'),
(7, 'Bayern Munich', 'https://cdn.sofifa.net/meta/team/503/120.png'),
(8, 'Atletico Madrid', 'https://cdn.sofifa.net/meta/team/7980/120.png'),
(9, 'Al-Ittihad', 'https://cdn.sofifa.net/meta/team/476/120.png'),
(10, 'Manchester United', 'https://cdn.sofifa.net/meta/team/14/120.png'),
(11, 'Paris Saint-Germain', 'https://cdn.sofifa.net/meta/team/591/120.png'),
(12, 'Fenerbahçe', 'https://cdn.sofifa.net/meta/team/88/120.png'),
(13, 'PSV', 'https://cdn.sofifa.net/meta/team/682/120.png');

INSERT INTO Nationality (Nat_id,Nat_nom,Nat_flag) VALUES
(1, 'Argentina', 'https://cdn.sofifa.net/flags/ar.png'),
(2, 'Portugal', 'https://cdn.sofifa.net/flags/pt.png'),
(3, 'Belgium', 'https://cdn.sofifa.net/flags/be.png'),
(4, 'France', 'https://cdn.sofifa.net/flags/fr.png'),
(5, 'Netherlands', 'https://cdn.sofifa.net/flags/nl.png'),
(6, 'Germany', 'https://cdn.sofifa.net/flags/de.png'),
(7, 'Brazil', 'https://cdn.sofifa.net/flags/br.png'),
(8, 'Egypt', 'https://cdn.sofifa.net/flags/eg.png'),
(9, 'Slovenia', 'https://cdn.sofifa.net/flags/si.png'),
(10, 'Croatia', 'https://cdn.sofifa.net/flags/hr.png'),
(11, 'Morocco', 'https://cdn.sofifa.net/flags/ma.png'),
(12, 'Norway', 'https://cdn.sofifa.net/flags/no.png'),
(13, 'Canada', 'https://cdn.sofifa.net/flags/ca.png'),
(14, 'England', 'https://cdn.sofifa.net/flags/gb-eng.png'),
(15, 'Italy', 'https://cdn.sofifa.net/flags/it.png');

INSERT INTO Player (photo, nom, positionn, statu, rating, club_id, nat_id, diving_pace, handling_shooting, kicking_passing, reflexes_dribbling, speed_defending, positioning_physical, deleted_at) VALUES
('https://cdn.sofifa.net/players/158/023/25_120.png', 'Lionel Messi', 'RW', NULL, 93, 1, 1, 85, 92, 91, 95, 35, 65, NULL),
('https://cdn.sofifa.net/players/020/801/25_120.png', 'Cristiano Ronaldo', 'ST', NULL, 91, 2, 2, 84, 94, 82, 87, 34, 77, NULL),
('https://cdn.sofifa.net/players/192/985/25_120.png', 'Kevin De Bruyne', 'CM', NULL, 91, 3, 3, 74, 86, 93, 88, 64, 78, NULL),
('https://cdn.sofifa.net/players/231/747/25_120.png', 'Kylian Mbappé', 'ST', NULL, 92, 4, 4, 97, 89, 80, 92, 39, 77, NULL),
('https://cdn.sofifa.net/players/203/376/25_120.png', 'Virgil van Dijk', 'CB', NULL, 90, 5, 5, 75, 60, 70, 72, 92, 86, NULL),
('https://cdn.sofifa.net/players/205/452/25_120.png', 'Antonio Rudiger', 'CB', NULL, 88, 4, 6, 82, 55, 73, 70, 86, 86, NULL),
('https://cdn.sofifa.net/players/190/871/25_120.png', 'Neymar Jr', 'LW', NULL, 90, 6, 7, 91, 83, 86, 94, 37, 61, NULL),
('https://cdn.sofifa.net/players/209/331/25_60.png', 'Mohamed Salah', 'RW', NULL, 89, 5, 8, 93, 87, 81, 90, 45, 75, NULL),
('https://cdn.sofifa.net/players/212/622/25_120.png', 'Joshua Kimmich', 'CM', NULL, 89, 7, 6, 70, 75, 88, 84, 84, 81, NULL),
('https://cdn.sofifa.net/players/200/389/25_120.png', 'Jan Oblak', 'GK', NULL, 91, 8, 9, 89, 90, 78, 92, 50, 88, NULL),
('https://cdn.sofifa.net/players/177/003/25_120.png', 'Luka Modrić', 'CM', NULL, 88, 4, 10, 74, 78, 89, 90, 72, 65, NULL),
('https://cdn.sofifa.net/players/238/794/25_120.png', 'Vinicius Junior', 'LW', NULL, 89, 4, 7, 91, 88, 85, 94, 39, 61, NULL),
('https://cdn.sofifa.net/players/231/410/25_120.png', 'Brahim Diáz', 'LW', NULL, 82, 4, 11, 85, 74, 78, 85, 31, 56, NULL),
('https://cdn.sofifa.net/players/165/153/25_120.png', 'Karim Benzema', 'ST', NULL, 90, 9, 4, 77, 90, 83, 88, 40, 78, NULL),
('https://cdn.sofifa.net/players/239/085/25_120.png', 'Erling Haaland', 'ST', NULL, 91, 3, 12, 89, 94, 65, 80, 45, 88, NULL),
('https://cdn.sofifa.net/players/215/914/25_120.png', 'N Golo Kanté', 'CDM', NULL, 87, 9, 4, 77, 66, 75, 82, 88, 82, NULL),
('https://cdn.sofifa.net/players/234/396/25_120.png', 'Alphonso Davies', 'LB', NULL, 84, 7, 13, 96, 68, 77, 82, 76, 77, NULL),
('https://cdn.sofifa.net/players/209/981/25_120.png', 'Yassine Bounou', 'GK', NULL, 84, 6, 11, 81, 82, 77, 86, 38, 83, NULL),
('https://cdn.sofifa.net/players/212/198/25_120.png', 'Bruno Fernandes', 'CM', NULL, 88, 10, 2, 75, 85, 89, 84, 69, 77, NULL),
('https://cdn.sofifa.net/players/233/049/25_120.png', 'Jadon Sancho', 'LW', NULL, 84, 10, 14, 85, 74, 78, 88, 34, 63, NULL),
('https://cdn.sofifa.net/players/231/281/25_120.png', 'Trent Alexander-Arnold', 'RB', NULL, 87, 5, 14, 76, 66, 89, 80, 79, 71, NULL),
('https://cdn.sofifa.net/players/235/212/25_120.png', 'Achraf Hakimi', 'RB', NULL, 84, 11, 11, 91, 76, 80, 80, 75, 78, NULL),
('https://cdn.sofifa.net/players/235/410/25_120.png', 'Youssef En-Nesyri', 'ST', NULL, 83, 12, 11, 82, 82, 63, 77, 36, 80, NULL),
('https://cdn.sofifa.net/players/236/401/25_120.png', 'Noussair Mazraoui', 'LB', NULL, 81, 10, 11, 78, 66, 77, 83, 77, 71, NULL),
('https://cdn.sofifa.net/players/259/480/25_120.png', 'Ismael Saibari', 'CM', NULL, 83, 13, 11, 89, 78, 80, 86, 55, 84, NULL),
('https://cdn.sofifa.net/players/230/621/25_120.png', 'Gianluigi Donnarumma', 'GK', NULL, 89, 11, 15, 88, 84, 75, 90, 50, 85, NULL);

select * from `Nationality` ;
select * from `Club` ;
SELECT * from `Player`;

SELECT *
from `Player` 
Join `Club` on `Club`.club_id = `Player`.club_id
Join  `Nationality` on `Nationality`.`Nat_id` = `Player`.nat_id


SELECT COUNT(*) AS table_count
FROM `Player`


SELECT "Players Numbers"  as title, COUNT(*) AS Clubs_count FROM Club 
UNION
SELECT "Players jvugjv"  as title , COUNT(*) AS Players_count FROM Player 
UNION
SELECT "Players bbigy" as title , COUNT(*) AS Natio_count FROM Nationality  ;

INSERT INTO Club (club_id, club_nom, club_logo) VALUES
(14, 'Arsenal', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/1.png?fm=png&ixlib=java-2.1.0&w=256&s=0f5f1b415788c03a743b0d898ccba3af'),
(15, 'Aston Villa', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/2.png?fm=png&ixlib=java-2.1.0&w=256&s=54cd239ece2af92d9f792165557828f9'),
(16, 'Blackburn Rovers', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/3.png?fm=png&ixlib=java-2.1.0&w=256&s=3e2d273b2499c550e9d583fbdf31d292'),
(17, 'Bolton', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/4.png?fm=png&ixlib=java-2.1.0&w=256&s=6ce74535221fdb0a796f6330e7c67952'),
(18, 'Chelsea', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/5.png?fm=png&ixlib=java-2.1.0&w=256&s=a95904bd7ea09c4e68243f801a89bf88'),
(19, 'Everton', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/7.png?fm=png&ixlib=java-2.1.0&w=256&s=5be082478286830c241325fb15a9585d'),
(20, 'Leeds United', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/8.png?fm=png&ixlib=java-2.1.0&w=256&s=e2a3b22680a46bcdae71f8e650b7200f'),
(21, 'Manchester Utd', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/11.png?fm=png&ixlib=java-2.1.0&w=256&s=d634f823d355069c2550a1af0508d0b6'),
(22, 'Middlesbrough', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/12.png?fm=png&ixlib=java-2.1.0&w=256&s=eb3c0797374a7c91fad6d492d2a44cf9'),
(23, 'Newcastle Utd', 'https://cdn3.futbin.com/content/fifa25/img/clubs/dark/13.png?fm=png&ixlib=java-2.1.0&w=256&s=1f2dcb5e475d9c0f535238c247f734f9');


INSERT INTO Nationality (Nat_id, Nat_nom, Nat_flag) VALUES
(16, 'Albania', 'https://cdn3.futbin.com/content/fifa25/img/nation/1.png?fm=png&ixlib=java-2.1.0&w=70&s=ce1db703cc5b9de2b805cc762e2a8138'),
(17, 'Andorra', 'https://cdn3.futbin.com/content/fifa25/img/nation/2.png?fm=png&ixlib=java-2.1.0&w=70&s=2a169ecf3646756f8783e865b071fca6'),
(18, 'Armenia', 'https://cdn3.futbin.com/content/fifa25/img/nation/3.png?fm=png&ixlib=java-2.1.0&w=70&s=a461afa64ca2eb9617aa5bf26d6a1884'),
(19, 'Austria', 'g/https://cdn3.futbin.com/content/fifa25/imnation/4.png?fm=png&ixlib=java-2.1.0&w=70&s=52ad03993bf1e35ade66e9c247e1381f'),
(20, 'Azerbaijan', 'https://cdn3.futbin.com/content/fifa25/img/nation/5.png?fm=png&ixlib=java-2.1.0&w=70&s=7c374619b1c46840beeda108376f3ae3'),
(21, 'Belarus', 'https://cdn3.futbin.com/content/fifa25/img/nation/6.png?fm=png&ixlib=java-2.1.0&w=70&s=687dab32e6dba660572444111ae58ba6'),
(22, 'Bosnia and Herzegovina', 'https://cdn3.futbin.com/content/fifa25/img/nation/8.png?fm=png&ixlib=java-2.1.0&w=70&s=dcba2cd65aefcef1b99edb359c1a545e'),
(23, 'Bulgaria', 'https://cdn3.futbin.com/content/fifa25/img/nation/9.png?fm=png&ixlib=java-2.1.0&w=70&s=684d740793dccaf3e5494a325d0fbdc9'),
(24, 'Cyprus', 'https://cdn3.futbin.com/content/fifa25/img/nation/11.png?fm=png&ixlib=java-2.1.0&w=70&s=dbc1d4887adf6cb6cb80459d1848d344'),
(25, 'Czechia', 'https://cdn3.futbin.com/content/fifa25/img/nation/12.png?fm=png&ixlib=java-2.1.0&w=70&s=56da71628c184c7c43ed1f3bcbfcedee');



select * FROM `Club`;
SELECT * from `Nationality` ;
