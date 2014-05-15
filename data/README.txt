--backup
mysqldump ensure -u -p > ensure.sql
--restore
mysqladmin -u root -p drop ensure
mysqladmin -u root -p create ensure
mysql -u -p ensure < ensure.sql
