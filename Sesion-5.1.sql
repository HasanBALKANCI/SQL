*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*------------------------------------------------------------------------------------------
/*  CREATE TABLE
/*------------------------------------------------------------------------------------------
	
/*personel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
age(INT) ve hire_date (Date) sutunuları bulunmalıdır.	*/



CREATE TABLE personel ( 
first_name TEXT,
last_name TEXT,
age INT,
hire_date DATE
);

/* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir. Bu hatayı
almamak için IF NOT EXISTS keywordu kullanılabilir */

CREATE TABLE IF NOT EXISTS personel ( 
first_name TEXT,
last_name TEXT,
age INT,
hire_date DATE
);
/*Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  Sutun isimleri
place_id, country, hotel_name, employee_id, vacation_length,budget 	*/

CREATE TABLE IF NOT EXISTS vacation_plan (
 place_id  INT,
 country NVARCHAR(50),
 hotel_name NVARCHAR(50),
 employee_id INT PRIMARY KEY,
 vacation_length INT,
 budget REAL
) ;
/*------------------------------------------------------------------------------------------
/*  DROP TABLE
/*------------------------------------------------------------------------------------------
/* personel tablosunu siliniz */

DROP TABLE IF EXISTS Personel;


INSERT INTO vacation_plan VALUES (  34, 'TURKEY' , 'HOTEL ISTANBUL' , 1, 7, 4000  ); 

CREATE TABLE workers (
	id INT PRIMARY KEY ,
	id_num TEXT not NULL UNIQUE,
	name TEXT DEFAULT 'NO NAME',
	salary REAL NOT NULL) ;

	
	INSERT INTO workers VALUES (1, '12345678911', 'CAN CANAN',  12000);
	INSERT INTO workers VALUES (2,'23455678911', 'HASAN HÅKÅN', 9000);
	INSERT INTO workers VALUES (3, '54323456777', NULL, 11000);
	INSERT INTO workers (id, id_num, salary) VALUES (4, '12345678', 43000);
	
	SELECT * FROM workers;
	
	CREATE TABLE vacation_plan_2 (
		place_id  INT,
		country NVARCHAR(50),
		hotel_name NVARCHAR(50),
		employee_id INT ,
		vacation_length INT,
		budget REAL,
		PRIMARY KEY (place_id),
		FOREIGN KEY (employee_id) REFERENCES  employees (EmployeeId) ) ;
		
		SELECT * from vacation_plan_2;
		
		
		
		INSERT INTO vacation_plan_2  VALUES (34, 'Turkey', 'Happy nation', 1, 5, 5000)
	
	
/* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) olan kişi için bir tatil planı giriniz.*/

-- INSERT INTO vacation_plan_2 VALUES (35, 'TURKEY', "ALA", 9, 4, 9000) ;   HATA VERECEKTIR

/*JOIN işlemi ile 2 tablodan veri çekme*/
 /* FirstName, LastName, vacation_length, hotel_name*/ 
 
 SELECT e.FirstName, e.LastName, v.vacation_length, v.hotel_name
 FROM employees e
 LEFT JOIN vacation_plan2 v
 --INNER JOIN vacation_plan2 v
 ON e.EmployeeId = v.employee_id;
 
 /*------------------------------------------------------------------------------------------
/*  ALTER TABLE (ADD, RENAME TO, DROP)
/*  SQLITE MODIFY VE DELETE KOMUTLARINI DOĞRUDAN DESTEKLENMEZ
/*------------------------------------------------------------------------------------------
	
/*vacation_plan2 tablosuna name adında ve DEFAULT değeri noname olan 
yeni bir sutun ekleyelim */

ALTER TABLE vacation_plan_2
ADD name TEXT DEFAULT 'NO NAME';

SELECT * FROM vacation_plan_2;

ALTER TABLE vacation_plan_2
DROP COLUMN name;


SELECT * FROM vacation_plan_2;

ALTER TABLE vacation_plan_2
RENAME TO people ;

SELECT * FROM people;

ALTER TABLE people   
RENAME TO vacation_plan_2;
 
 
 
 *------------------------------------------------------------------------------------------
/*  UPDATE,DELETE
-- SYNTAX
----------
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE koşul;
		
--DELETE tablo_adı
--WHERE koşul;
/*-----------------------------------------------------------------------------------------*/
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydini  hotel_name'ini Komagene Hotel olarak
güncelleyiniz.*/
   
UPDATE vacation_plan2
SET hotel_name = 'Komagene Hotel'
WHERE employee_id = 1;
   
/* people tablosunda salary sutunu 7000 'den az olanların salary(maaşına)
%10 zam yapacak sorguyu yazınız*/ 
   
UPDATE people
SET salary = salary*1.2
WHERE salary < 7000;
   
/*people tablosundaki tüm kayıtkarın salary sutununu 10000 olarak güncelleyiniz */
UPDATE people
SET salary=10000;
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydı siliniz*/
DELETE FROM vacation_plan2
WHERE employee_id=1;


