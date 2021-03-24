## Patient-PHP-v1

### Below is the script to create the database and the  table used here

```sql
create database patient;
use patient;

CREATE TABLE `tb_patient` (
  `id_patient` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_patient`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
` (`lastname` ASC, `firstname` ASC) VISIBLE;

```
