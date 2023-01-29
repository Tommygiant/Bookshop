/*
Navicat SQL Server Data Transfer

Source Server         : localhost
Source Server Version : 160000
Source Host           : localhost:1433
Source Database       : BOOKSHOP
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 160000
File Encoding         : 65001

Date: 2023-01-28 21:52:17
*/


-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE [dbo].[admin]
GO
CREATE TABLE [dbo].[admin] (
[admin_id] int NOT NULL IDENTITY(1,1) ,
[admin_name] varchar(20) NOT NULL ,
[admin_pwd] varchar(50) NOT NULL ,
[admin_email] varchar(30) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[admin]', RESEED, 4)
GO

-- ----------------------------
-- Records of admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[admin] ON
GO
INSERT INTO [dbo].[admin] ([admin_id], [admin_name], [admin_pwd], [admin_email]) VALUES (N'3', N'admin', N'21232F297A57A5A743894A0E4A801FC3', N'123456@163.com')
GO
GO
SET IDENTITY_INSERT [dbo].[admin] OFF
GO

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE [dbo].[books]
GO
CREATE TABLE [dbo].[books] (
[ISBN] varchar(50) NULL ,
[book_id] int NOT NULL IDENTITY(1,1) ,
[title] varchar(50) NOT NULL ,
[author] varchar(50) NOT NULL ,
[version] varchar(50) NULL ,
[pubdate] varchar(50) NOT NULL ,
[introdu] varchar(5000) NULL ,
[price] decimal(4,2) NOT NULL ,
[picname] varchar(20) NOT NULL ,
[type] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[books]', RESEED, 32)
GO

-- ----------------------------
-- Records of books
-- ----------------------------
SET IDENTITY_INSERT [dbo].[books] ON
GO
INSERT INTO [dbo].[books] ([ISBN], [book_id], [title], [author], [version], [pubdate], [introdu], [price], [picname], [type]) VALUES (N'9b0896fa-3880-4c2e-bfd6-925c87f22878', N'1', N'CQRS for Dummies', N'Mick.jdfjhd', N'人民教育出版社', N'2010年06月07日', N'Effective Java中文版', N'33.25', N'book-01.jpg', N'IT计算机')
GO
GO
INSERT INTO [dbo].[books] ([ISBN], [book_id], [title], [author], [version], [pubdate], [introdu], [price], [picname], [type]) VALUES (N'0550818d-36ad-4a8d-9c3a-a715bf15de76', N'2', N'Visual Studio Tips', N'HUAWEI', N'电子工业出版社', N'2013年11月19日', N'嵌入式Linux应用开发完全手册', N'59.00', N'book-02.jpg', N'IT计算机')
GO
GO
INSERT INTO [dbo].[books] ([ISBN], [book_id], [title], [author], [version], [pubdate], [introdu], [price], [picname], [type]) VALUES (N'8e0f11f1-be5c-4dbc-8012-c19ce8cbe8e1', N'3', N'NHibernate Cookbook', N'Kim Chen', N'中华传媒出版社', N'2014年12月02日', N'人月神话', N'62.30', N'book-03.jpg', N'小说')
GO
GO
INSERT INTO [dbo].[books] ([ISBN], [book_id], [title], [author], [version], [pubdate], [introdu], [price], [picname], [type]) VALUES (N'9787508619439', N'4', N'谁动了我的奶酪？', N'（美）斯宾塞·约翰逊', N'中信出版社', N'2001年09月01日', N'人生犹如“迷宫”，每个人都在其中寻找各自的“奶酪”——稳定的工作、身心的健康、和谐的人际关系、甜蜜美满的爱情，或是令人充满想象的财富……
那么，你是否正在享受你的奶酪呢？
如果是的，恭喜你，你只需要阅读一下书中的小故事即可，因为它会时刻提醒你，你的奶酪是否已经变质；
如果不是，欢迎你，请你把这本书从头到尾阅读一下，希望你能够从中受到启发，尽快享受你的奶酪。
自本书出版以来，已经有众多读者从奶酪的故事中得到启发，从而改善了自己的事业、婚姻和生活，同时也引起了广泛的讨论。
变化总在时时发生，我们每个人都要认真思考，究竟是谁动了我的“奶酪”，我们又该如何发现新的“奶酪”？', N'16.80', N'book-04.jpg', N'小说')
GO
GO
SET IDENTITY_INSERT [dbo].[books] OFF
GO

-- ----------------------------
-- Table structure for order_num
-- ----------------------------
DROP TABLE [dbo].[order_num]
GO
CREATE TABLE [dbo].[order_num] (
[book_id] int NOT NULL ,
[order_num] int NOT NULL 
)


GO

-- ----------------------------
-- Records of order_num
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE [dbo].[orders]
GO
CREATE TABLE [dbo].[orders] (
[order_id] int NOT NULL IDENTITY(1,1) ,
[username] varchar(50) NOT NULL ,
[order_date] varchar(50) NULL DEFAULT (getdate()) ,
[book_id] int NOT NULL ,
[book_title] varchar(50) NOT NULL ,
[quantity] int NOT NULL DEFAULT ((0)) ,
[adress] varchar(100) NOT NULL ,
[status] tinyint NOT NULL ,
[price] decimal(10,2) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[orders]', RESEED, 80)
GO

-- ----------------------------
-- Records of orders
-- ----------------------------
SET IDENTITY_INSERT [dbo].[orders] ON
GO
INSERT INTO [dbo].[orders] ([order_id], [username], [order_date], [book_id], [book_title], [quantity], [adress], [status], [price]) VALUES (N'42', N'user', N'2015/01/06', N'15', N'你在为谁读书', N'200', N'地球村', N'1', N'50.00')
GO
GO
INSERT INTO [dbo].[orders] ([order_id], [username], [order_date], [book_id], [book_title], [quantity], [adress], [status], [price]) VALUES (N'43', N'user', N'2015/01/07', N'23', N'夜的草', N'99', N'北京', N'0', N'2200.00')
GO
GO
INSERT INTO [dbo].[orders] ([order_id], [username], [order_date], [book_id], [book_title], [quantity], [adress], [status], [price]) VALUES (N'44', N'user', N'2015/01/07', N'21', N'树叶', N'55', N'北京', N'0', N'20.00')
GO
GO
INSERT INTO [dbo].[orders] ([order_id], [username], [order_date], [book_id], [book_title], [quantity], [adress], [status], [price]) VALUES (N'51', N'123456', N'2018/12/15', N'18', N'《中国近代史：1600-2000，中国的奋斗》', N'1', N'123456', N'0', N'29.80')
GO
GO
INSERT INTO [dbo].[orders] ([order_id], [username], [order_date], [book_id], [book_title], [quantity], [adress], [status], [price]) VALUES (N'72', N'user1', N'2023/01/28', N'2', N'Visual Studio Tips', N'2', N'北京', N'1', N'59.00')
GO
GO
INSERT INTO [dbo].[orders] ([order_id], [username], [order_date], [book_id], [book_title], [quantity], [adress], [status], [price]) VALUES (N'75', N'user1', N'2023/01/28', N'1', N'CQRS for Dummies', N'1', N'北京', N'1', N'33.25')
GO
GO
INSERT INTO [dbo].[orders] ([order_id], [username], [order_date], [book_id], [book_title], [quantity], [adress], [status], [price]) VALUES (N'80', N'user1', N'2023/01/28', N'3', N'NHibernate Cookbook', N'1', N'北京', N'1', N'62.30')
GO
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE [dbo].[stock]
GO
CREATE TABLE [dbo].[stock] (
[stock_id] int NOT NULL IDENTITY(1,1) ,
[isbn] varchar(20) NOT NULL ,
[stock_num] int NOT NULL DEFAULT ((0)) ,
[price] decimal(10,2) NOT NULL ,
[logdate] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[stock]', RESEED, 24)
GO

-- ----------------------------
-- Records of stock
-- ----------------------------
SET IDENTITY_INSERT [dbo].[stock] ON
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'1', N'12-34523-488934', N'3000', N'32.25', N'2010年06月07日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'2', N'12-4354243243', N'5000', N'59.00', N'2013年11月19日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'3', N'12-43282843-1341', N'3000', N'62.30', N'2014年12月02日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'4', N'9787508619439', N'2500', N'16.80', N'2001年09月01日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'5', N'9787546311241', N'6000', N'22.00', N'2009年11月01日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'6', N'9787543659230', N'3200', N'26.00', N'2010年01月01日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'7', N'9787302241454', N'5600', N'22.32', N'2011年01月01日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'8', N'9787544335935', N'5400', N'32.00', N'2011年03月01日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'9', N'9787508064604', N'3600', N'23.68', N'2011年07月01日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'16', N'9787508645056', N'3200', N'39.80', N'2014年7月1日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'19', N'978-7-5321-5420-3', N'2100', N'29.00', N'2014年12月01日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'23', N'9787533281670', N'6500', N'18.00', N'2014年11月01日')
GO
GO
INSERT INTO [dbo].[stock] ([stock_id], [isbn], [stock_num], [price], [logdate]) VALUES (N'24', N'12345678910', N'1', N'99.90', N'2002年02月13日')
GO
GO
SET IDENTITY_INSERT [dbo].[stock] OFF
GO

-- ----------------------------
-- Table structure for sysdiagrams
-- ----------------------------
DROP TABLE [dbo].[sysdiagrams]
GO
CREATE TABLE [dbo].[sysdiagrams] (
[name] sysname NOT NULL ,
[principal_id] int NOT NULL ,
[diagram_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[definition] varbinary(MAX) NULL 
)


GO

-- ----------------------------
-- Records of sysdiagrams
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON
GO
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
GO

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE [dbo].[users]
GO
CREATE TABLE [dbo].[users] (
[user_id] int NOT NULL IDENTITY(1,1) ,
[username] varchar(20) NOT NULL ,
[password] varchar(50) NOT NULL ,
[phone] varchar(15) NOT NULL ,
[email] varchar(30) NOT NULL ,
[address] varchar(100) NOT NULL ,
[postcode] varchar(6) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[users]', RESEED, 9)
GO

-- ----------------------------
-- Records of users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[users] ON
GO
INSERT INTO [dbo].[users] ([user_id], [username], [password], [phone], [email], [address], [postcode]) VALUES (N'6', N'user1', N'E10ADC3949BA59ABBE56E057F20F883E', N'13888888888', N'111111@qq.com', N'北京', N'100000')
GO
GO
INSERT INTO [dbo].[users] ([user_id], [username], [password], [phone], [email], [address], [postcode]) VALUES (N'7', N'jagol', N'E10ADC3949BA59ABBE56E057F20F883E', N'0451365199', N'3543@qq.com', N'12 nelson rd', N'54452')
GO
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO

-- ----------------------------
-- Indexes structure for table admin
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table admin
-- ----------------------------
ALTER TABLE [dbo].[admin] ADD PRIMARY KEY ([admin_id])
GO

-- ----------------------------
-- Indexes structure for table books
-- ----------------------------
CREATE INDEX [IX_books_1] ON [dbo].[books]
([ISBN] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table books
-- ----------------------------
ALTER TABLE [dbo].[books] ADD PRIMARY KEY ([book_id])
GO

-- ----------------------------
-- Indexes structure for table order_num
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table order_num
-- ----------------------------
ALTER TABLE [dbo].[order_num] ADD PRIMARY KEY ([book_id])
GO

-- ----------------------------
-- Indexes structure for table orders
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE [dbo].[orders] ADD PRIMARY KEY ([order_id])
GO

-- ----------------------------
-- Indexes structure for table stock
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table stock
-- ----------------------------
ALTER TABLE [dbo].[stock] ADD PRIMARY KEY ([stock_id])
GO

-- ----------------------------
-- Indexes structure for table sysdiagrams
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sysdiagrams
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] ADD PRIMARY KEY ([diagram_id])
GO

-- ----------------------------
-- Uniques structure for table sysdiagrams
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] ADD UNIQUE ([principal_id] ASC, [name] ASC)
GO

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE [dbo].[users] ADD PRIMARY KEY ([user_id])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[orders]
-- ----------------------------
ALTER TABLE [dbo].[orders] ADD FOREIGN KEY ([order_id]) REFERENCES [dbo].[orders] ([order_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
