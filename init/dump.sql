CREATE DATABASE sorgente;
USE sorgente;

CREATE TABLE `tranche_s` (
  `id_riga` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `portafoglio` varchar(50) DEFAULT NULL,
  PRIMARY KEY(id_riga)
); 

CREATE TABLE `tranche_s_target` (
  `id_riga` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `portafoglio` varchar(50) DEFAULT NULL
);

INSERT INTO `tranche_s` (`id_riga`, `start_date`, `end_date`, `portafoglio`) VALUES
(1, '2021-11-30', '2022-08-14', 'svg'),
(2, '2021-11-30', '2022-09-14', 'salute'),
(3, '2021-11-30', '2022-07-14', 'vita'),
(4, '2021-11-30', '2022-06-14', 'svg'),
(5, '2021-11-30', '2022-08-15', 'vita'),
(6, '2021-11-30', '2022-10-14', 'sipo'),
(7, '2021-11-30', '2022-12-14', 'vita'),
(8, '2021-11-30', '2023-09-14', 'vita'),
(9, '2021-11-30', '2025-09-14', 'vita'),
(10, '2021-11-30', '2024-09-14', 'salute'),
(11, '2021-11-30', '2023-09-14', 'vita'),
(12, '2021-11-30', '2022-09-14', 'vita'),
(13, '2021-11-30', '2022-09-14', 'vita'),
(14, '2021-11-30', '2022-09-14', 'vita'),
(15, '2021-11-30', '2022-09-14', 'vita'),
(16, '2021-11-30', '2022-09-14', 'vita'),
(17, '2021-11-30', '2022-09-14', 'vita'),
(18, '2021-11-30', '2022-09-14', 'vita'),
(19, '2021-11-30', '2022-09-14', 'vita'),
(20, '2021-11-30', '2022-09-14', 'vita'),
(21, '2021-11-30', '2022-09-14', 'vita');