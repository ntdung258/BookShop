USE[master]
IF DB_ID('BookShop') IS NOT NULL
	DROP DATABASE BookShop
GO
CREATE DATABASE BookShop COLLATE LATIN1_GENERAL_100_CI_AS_SC_UTF8;
GO
USE BOOKSHOP
GO
CREATE TABLE [User](
	ID					BIGINT				IDENTITY	PRIMARY KEY,
	EMAIL				VARCHAR(100)	UNIQUE		NOT NULL,
	PASSWORD			VARCHAR(250)				NOT NULL,
	GENDER				VARCHAR(3)					NOT NULL,
	BIRTHDAY			DATE						NOT NULL,
	FULLNAME			VARCHAR(100)				NOT NULL,
	PHONE				VARCHAR(10)					NOT NULL,
	ADDRESS				VARCHAR(500)				NOT NULL,
	USER_IMAGE			VARCHAR(250),
	USER_ROLE			VARCHAR(20)					NOT NULL,
	STATUS				BIT,	--1: active hoặc 0:deactive
)
GO
INSERT INTO [User] VALUES 
	('admin@gmail.com','$2a$12$DQ.AkuJgeP/PqSfEDKsQ3evfTbENnMGm8dsUAbLVlEwg9r6NRB1YS','nam','2000-11-11','Ronaldo','0988888888','số nhà 1A, ngách 14, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội',null,'ROLE_ADMIN',1),
	('tiendung@gmail.com','$2a$12$DQ.AkuJgeP/PqSfEDKsQ3evfTbENnMGm8dsUAbLVlEwg9r6NRB1YS','nu','2000-11-11','LionMessi','0988888888','ngã 3 Cầu Lạt, Tuy Lộc, Hậu Lộc , Thanh Hóa',null,'ROLE_USER',1),
	('dung@gmail.com','$2a$12$DQ.AkuJgeP/PqSfEDKsQ3evfTbENnMGm8dsUAbLVlEwg9r6NRB1YS','nu','2000-11-11','Sasuke','0988123123','số nhà 1A , ngõ 117, Trần Cung, Bắc Từ Liêm, Hà Nội',null,'ROLE_EMPLOYEE',1)
GO
CREATE TABLE Author(
	ID					BIGINT				IDENTITY	PRIMARY KEY,
	AUTHOR_NAME			VARCHAR(100)				NOT NULL,
	AUTHOR_IMAGE		VARCHAR(250)				NOT NULL,
	CREATE_DATE			DATETIME,
)
GO
CREATE TABLE Category(
	ID					BIGINT				IDENTITY	PRIMARY KEY,
	CATEGORY_NAME		VARCHAR(100)				NOT NULL,
	CREATE_DATE			DATETIME,
)
GO
CREATE TABLE Product(
	ID					BIGINT				IDENTITY	PRIMARY KEY,
	BOOK_NAME			VARCHAR(100)				NOT NULL,
	AUTHOR_ID			BIGINT
	FOREIGN KEY(AUTHOR_ID)		REFERENCES Author(ID),
	CATEGORY_ID			BIGINT
	FOREIGN KEY(CATEGORY_ID)	REFERENCES Category(ID),
	QUANTITY			INT							NOT NULL,
	PRICE				FLOAT						NOT NULL,
	PAGES				INT							NOT NULL,
	LANGUAGE			VARCHAR(20)					NOT NULL,
	PUBLICATION_DATE	DATE						NOT NULL,
	PUBLISHER			VARCHAR(100)				NOT NULL,
	BOOK_IMAGE			VARCHAR(250)				NOT NULL,
	CREATE_DATE			DATETIME						NOT NULL,
)
GO

CREATE TABLE Cart(
	ID					BIGINT				IDENTITY	PRIMARY KEY,	
	CREATE_DATE			DATETIME					NOT NULL,
	[USER_ID]			BIGINT						NOT NULL,
	BOOK_ID			BIGINT						NOT NULL,
	QUANTITY			INT							NOT NULL,
	PRICE				FLOAT						NOT NULL,
	BOOK_NAME			VARCHAR(100)				NOT NULL,
	BOOK_IMAGE			VARCHAR(250)				NOT NULL,
	
)
GO

CREATE TABLE Bill(
	ID					BIGINT				IDENTITY	PRIMARY KEY,	
	TOTAL_PRICE			FLOAT,
	CREATE_DATE			DATETIME,
	RECIPIENT_NAME		VARCHAR(100)				NOT NULL,
	DELIVERY_ADDRESS	VARCHAR(500)				NOT NULL,
	PHONE				VARCHAR(10)					NOT NULL,
	NOTE				VARCHAR(200),
	PAYMENT_METHOD		VARCHAR(100)				NOT NULL,
	[USER_ID]			BIGINT						NOT NULL
	FOREIGN KEY ([USER_ID]) REFERENCES [User] (ID),
	STATUS				VARCHAR(50),
	REASON_CANCEL		VARCHAR(250),
	CANCEL_DATE			DATETIME,
)
GO
CREATE TABLE Bill_Detail(
	ID					BIGINT				IDENTITY	PRIMARY KEY,
	BOOK_ID				BIGINT						NOT NULL,
	QUANTITY			INT							NOT NULL,
	PRICE				FLOAT						NOT NULL,
	BOOK_NAME			VARCHAR(100)				NOT NULL,
	BOOK_IMAGE			VARCHAR(250)				NOT NULL,
	CATEGORY_ID			BIGINT						NOT NULL,
	CATEGORY_NAME		VARCHAR(100)				NOT NULL,
	AUTHOR_ID			BIGINT						NOT NULL,
	AUTHOR_NAME			VARCHAR(100)				NOT NULL,
	BILL_ID				BIGINT						NOT NULL
	FOREIGN KEY (BILL_ID)	REFERENCES BILL (ID),
)
GO

INSERT INTO Author VALUES
	('Tiến Dũng','imag-01.jpg','2022-1-1'),
	('Văn Nam','imag-02.jpg','2022-1-2'),
	('Nguyệt','imag-03.jpg','2022-3-1'),
	('Vũ Đễ','imag-04.jpg','2022-4-1'),
	('Kiều Mỹ','imag-05.jpg','2022-5-1'),
	('Linh Nhi','imag-06.jpg','2022-6-1'),
	('Phi Vũ','imag-07.jpg','2022-7-1'),
	('Tiểu Tinh','imag-08.jpg','2022-8-1')

GO
INSERT INTO Category VALUES
	('Art & Photography','2022-2-1'),
	('Craft & Hobbies','2022-3-1'),
	('Crime & Thriller','2022-4-1'),
	('Fantasy & Horror','2022-5-1'),
	('Graphic, Anime & Manga','2022-6-1')
GO
INSERT INTO Product VALUES
	('Tây Du Ký',1,1,500,50000,1100,'VietNam','2010-8-25','Kim Đồng','img-01.jpg','2022-12-1'),
	('Hồng Lâu',2,2,500,60000,2200,'English','2010-7-25','Kim Đồng','img-02.jpg','2022-12-2'),
	('Phàm Nhân',3,3,500,70000,3300,'English','2010-6-25','Kim Đồng','img-03.jpg','2022-12-3'),
	('Tiếu Ngạo',4,4,500,80000,1200,'VietNam','2010-5-25','Kim Đồng','img-04.jpg','2022-12-4'),
	('Anh Hùng',5,5,500,90000,700,'English','2010-4-25','Kim Đồng','img-05.jpg','2022-12-5'),
	('Thần Điêu',6,1,5,55000,1000,'VietNam','2010-3-25','Kim Đồng','img-06.jpg','2022-12-6'),
	('Em Chưa 18',7,2,3,65000,980,'English','2010-2-25','Kim Đồng','img-07.jpg','2022-12-7'),
	('Vợ Nhặt',1,2,500,73000,1300,'English','2010-2-25','Kim Đồng','img-07.jpg','2022-12-8'),
	('Lão Hạc',2,3,500,44000,1200,'Tiếng Việt','2010-3-25','Kim Đồng','img-06.jpg','2022-12-9'),
	('Truyện Kiều',3,4,500,35000,1100,'Thái Lan','2010-4-25','Kim Đồng','img-05.jpg','2022-12-10'),
	('Tắt Đèn',4,5,500,45000,10600,'Mỹ','2010-5-25','Kim Đồng','img-04.jpg','2022-12-11'),
	('Đấu La',5,2,500,55000,1200,'Pháp','2010-6-25','Kim Đồng','img-03.jpg','2022-12-12'),
	('Đấu Phá',6,3,500,65000,1300,'English','2010-7-25','Kim Đồng','img-02.jpg','2022-12-13'),
	('Thần Ấn',7,4,1,75000,1700,'Tiếng Việt','2010-8-25','Kim Đồng','img-01.jpg','2022-12-14')
GO

INSERT INTO Bill VALUES
	(270000,'2022-4-14 14:20:30.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Order completed',null,null),
	(310000,'2022-5-15 15:20:30.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Order completed',null,null),
	(350000,'2022-6-16 16:20:30.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Order completed',null,null),
	(390000,'2022-7-17 17:20:30.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Order completed',null,null),
	(250000,'2022-8-18 18:20:30.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Order completed',null,null),
	(1100000,'2022-12-1 10:20:30.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Order completed',null,null),
	(350000,'2022-12-10 14:40:22.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Order completed',null,null),
	(480000,'2022-12-28 21:24:33.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Delivering',null,null),
	(360000,'2023-1-10 17:11:43.173','LionMessi','số nhà 1A, Ngõ 207 Xuân Đỉnh, Bắc Từ Liêm , Hà Nội','0988123123',null,'Payment on delivery',2,'Wait confirmation',null,null)
GO
INSERT INTO Bill_Detail VALUES
	(2,4,60000,'Hồng Lâu','img-02.jpg',2,'Craft & Hobbies',2,'Văn Nam',1),
	(3,4,70000,'Phàm Nhân','img-03.jpg',3,'Crime & Thriller',3,'Nguyệt',2),
	(4,4,80000,'Tiếu Ngạo','img-04.jpg',4,'Fantasy & Horror',4,'Vũ Đế',3),
	(5,4,90000,'Anh Hùng','img-05.jpg',5,'Graphic, Anime & Manga',5,'Kiều Mỹ ',4),
	(6,4,55000,'Thần Điêu','img-06.jpg',5,'Graphic, Anime & Manga',6,'Linh Nhi',5),
	(1,4,50000,'Tây Du Ký','img-01.jpg',1,'Art & Photography',1,'Tiến Dũng',6),
	(2,11,60000,'Hồng Lâu','img-02.jpg',2,'Craft & Hobbies',2,'Văn Nam',6),
	(3,3,70000,'Phàm Nhân','img-03.jpg',3,'Crime & Thriller',3,'Nguyệt',6),
	(4,4,80000,'Tiếu Ngạo','img-04.jpg',4,'Fantasy & Horror',4,'Vũ Đế',7),
	(5,5,90000,'Anh Hùng','img-05.jpg',5,'Graphic, Anime & Manga',5,'Kiều Mỹ',8),
	(6,6,55000,'Thần Điêu','img-06.jpg',1,'Art & Photography',6,'Linh Nhi',9)
GO

SELECT  YEAR(CREATE_DATE),
		MONTH(CREATE_DATE),
		DAY(CREATE_DATE),
        SUM(TOTAL_PRICE)  
FROM    Bill
WHERE STATUS ='Order completed' AND CREATE_DATE BETWEEN '2022-12-1' AND '2023-1-20'
GROUP BY DAY(CREATE_DATE),MONTH(CREATE_DATE),YEAR(CREATE_DATE)
ORDER BY YEAR(CREATE_DATE) DESC ,MONTH(CREATE_DATE) DESC ,DAY(CREATE_DATE) DESC



