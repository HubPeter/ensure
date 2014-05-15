--backup
mysqldump ensure -u -p > ensure.sql

--restore
drop ensure;
CREATE DATABASE ensure DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
mysql -u -p ensure < ensure.sql
