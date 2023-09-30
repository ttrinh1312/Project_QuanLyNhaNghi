﻿
﻿USE Bank;  
GO  

IF DB_ID (N'Bank') IS NOT NULL  
DROP DATABASE Bank;  
GO  
CREATE DATABASE Bank  
go
use Bank
go

--Tao bang BANK
create table Bank
(
	b_id	char(10),
	b_name	nvarchar(50),
	b_ad	nvarchar(200),
	primary key(b_id)
)
go
--Tao bang BRANCH
create table Branch
(
	BR_id CHAR(5),
	BR_name	nvarchar(50),
	BR_ad	nvarchar(150),
	B_id	char(10),
	primary key(BR_id),
	foreign key (B_id) references Bank
)
go
--tao bang CUSTOMER
create table customer
(
	Cust_id	char(6),
	Cust_name	nvarchar(50),
	Cust_phone	varchar(15),
	Cust_ad		nvarchar(150),
	Br_id		char(5),
	primary key(Cust_id),
	foreign key (Br_id) references Branch
)
go
--tao bang ACCOUNT
create table account
(
	Ac_no	char(10),
	ac_balance	numeric(15,0),
	ac_type	char(1),
	cust_id	char(6),
	primary key(ac_no),
	foreign key(cust_id) references Customer
)
go
--tao bang transaction
create table transactions
(
	t_id	char(10),
	t_type	char(1),
	t_amount numeric(15,0),
	t_date	date,
	t_time	time,
	ac_no	char(10),
	primary key(t_id),
	foreign key (ac_no) references account
)
go
---Insert data
insert into bank values('BFTVVNVX07',N'Ngân hàng Công thương Việt Nam',N'03 Lý Thái Tổ, Hà Nội, Việt Nam')

insert into branch values('VB001',N'Vietcombank Thái Bình',N'12 Lý Bôn - tp Thái Bình','BFTVVNVX07')
insert into branch values('VB002',N'Vietcombank Nam Định',N'04 Trần Hưng Đạo - tp Nam Định','BFTVVNVX07')
insert into branch values('VB003',N'Vietcombank Thái Nguyên',N'44 Trần Nhân Tông - tp Thái Nguyên','BFTVVNVX07')
insert into branch values('VB004',N'Vietcombank Hà Nội',N'32 Cầu Giấy','BFTVVNVX07')
insert into branch values('VB005',N'Vietcombank Bắc Ninh',N'98 Phan Huy Chú','BFTVVNVX07')
insert into branch values('VT006',N'Vietcombank Thanh Hóa',N'23 Nguyễn Du','BFTVVNVX07')
insert into branch values('VT007',N'Vietcombank Nghệ An',N'01 Phan Bội Châu','BFTVVNVX07')
insert into branch values('VT008',N'Vietcombank Hà Tĩnh',N'72 Hà Huy Tập','BFTVVNVX07')
insert into branch values('VT009',N'Vietcombank Quảng Bình',N'','BFTVVNVX07')
insert into branch values('VT010',N'Vietcombank Quảng Trị',N'','BFTVVNVX07')
insert into branch values('VT011',N'Vietcombank Huế',N'85 Lê Thánh Tông','BFTVVNVX07')
insert into branch values('VN012',N'Vietcombank Đà Nẵng',N'01 Bạch Đằng','BFTVVNVX07')
insert into branch values('VN013',N'Vietcombank Quảng Nam',N'33 Cửa Đại, Hội An','BFTVVNVX07')
insert into branch values('VN014',N'Vietcombank Sài Gòn',N'Quận 1, tp HCM','BFTVVNVX07')
insert into branch values('VN015',N'Vietcombank Đồng Tháp',N'87 Phan Châu Trinh','BFTVVNVX07')
insert into branch values('VN016',N'Vietcombank Cà Mau',N'34 Trường Chinh','BFTVVNVX07')
insert into branch values('VN017',N'Vietcombank Phan Thiết',N'99 Lý Thái Tổ','BFTVVNVX07')
insert into branch values('VN018',N'Vietcombank Vũng Tàu',N'78 Hai Bà Trưng','BFTVVNVX07')
insert into branch values('VN019',N'Vietcombank Kiên Giang',N'238 Hải PHòng','BFTVVNVX07')

insert into customer values('000001',N'Hà Công Lực','01283388103',N'NGUYỄN TIẾN DUẨN - THÔN 3 - XÃ DHÊYANG - EAHLEO - ĐĂKLĂK','VT009')
insert into customer values('000002',N'Trần Đức Quý','01638843209',N'215/90 VÕ VĂN KIỆT, PHƯỜNG THANH XUÂN, TP BUÔN MA THUỘT, ĐĂK LĂK','VT010')
insert into customer values('000003',N'Lê Quang Phong','01219688656',N'TRUNG THIỆN, DƯƠNG THỦY, LỆ THỦY, QUẢNG BÌNH.','VT011')
insert into customer values('000004',N'Trần Văn Thiện Thanh','0905556510',N'19 ĐƯỜNG SỐ 1, ĐIỆN QUANG, ĐIỆN BÀN, QUẢNG NAM','VB004')
insert into customer values('000005',N'Nguyễn Đức Duy','0935270776',N'Giáo Tây, Đại Hòa, Đại Lộc, Quảng Nam','VB005')
insert into customer values('000006',N'Nguyễn Quang Công Minh','01282157875',N'HÒA SƠN, HÒA VANG, ĐÀ NẴNG','VT006')
insert into customer values('000007',N'Trần Trương Thiện Nguyên','01265323711',N'TỔ DÂN PHỐ 4,P NAM LÝ, TP ĐỒNG HỚI, QUẢNG BÌNH','VB001')
insert into customer values('000008',N'Nguyễn Lê Minh Quân','0962883220',N'K79/4 THANH THỦY, HẢI CHÂU, ĐÀ NẴNG','VB002')
insert into customer values('000009',N'Nguyễn Văn Linh','01689084633',N'58 HÙNG VƯƠNG, TX BA ĐỒN, QUẢNG BÌNH','VB003')
insert into customer values('000010',N'Đặng Nhật Phong','01652512225',N'K907 NGUYỄN LƯƠNG BẰNG- QUẬN LIÊU CHIỂU- ĐÀ NẴNG','VB004')
insert into customer values('000011',N'Lê Tấn Anh Quốc','0975208772',N'THÔN THANH QUÝT 1, ĐIỆN THẮNG TRUNG, ĐIỆN BÀN, QUẢNG NAM','VB005')
insert into customer values('000012',N'Hứa Văn Đại','01269162146',N'TỔ 27A, NẠI HIÊN ĐÔNG, SƠN TRÀ, TP. ĐÀ NẴNG','VT006')
insert into customer values('000013',N'Hồ Quỳnh Hữu Phát','0978354865',N'PHAN THỊ HỒNG PHƯỢNG, THÔN 1B, XÃ ĐỒNG TRẠCH, BỐ TRẠCH, QUẢNG BÌNH','VT007')
insert into customer values('000014',N'Phan Nguyên Anh','0964318076',N'KHỐI HẬU XÁ, TỔ 37, PHƯỜNG THANH HÀ, TP. HỘI AN, TỈNH QUẢNG NAM.','VT008')
insert into customer values('000015',N'Trương Quang Hòa','0976308098',N'294 HUỲNH THÚC KHÁNG, AN XUÂN, TAM KỲ, QUẢNG NAM','VT009')
insert into customer values('000016',N'Lê Anh Huy','0966654330',N'412 CÁCH MẠNG THÁNG 8, QUẬN CẨM LỆ, ĐÀ NẴNG','VT010')
insert into customer values('000017',N'Hồ Trần Nhật Khánh','01648438000',N'193/12 NÚI THÀNH, PHƯỜNG HÒA CƯỜNG BẮC, HẢI CHÂU, ĐÀ NẴNG','VT011')
insert into customer values('000018',N'Lê Minh Trí','0935700123',N'TDP3-P TỨ HẠ, HƯƠNG TRÀ, TT HUẾ','VN012')
insert into customer values('000019',N'Phan Công Diễn','0935604934',N'TỔ 19 - PHƯỜNG PHƯỚC MỸ - SƠN TRÀ - ĐÀ NẴNG ','VN013')
insert into customer values('000020',N'Nguyễn Xuân Anh','0905939426',N'67 Trần Văn Dư, Mỹ An, Ngũ Hành Sơn Đà Nẵng','VN014')
insert into customer values('000021',N'Nguyễn Tiến Trung','01224064353',N'1/45 QUANG TRUNG, KHU PHỐ 2, PHƯỜNG 2, THỊ XÃ QUẢNG TRỊ, TỈNH QUẢNG TRỊ.','VN015')
insert into customer values('000022',N'Lê Hoàng Duy','0932517402',N'15A VÕ VĂN TẦN, QUY NHƠN, BÌNH ĐỊNH','VN016')
insert into customer values('000023',N'Trần Ngọc Quốc','01202023287',N'tổ 4,Bình Lãnh,Thăng Bình','VN017')
insert into customer values('000024',N'Huỳnh Tấn Dũng','0982805825',N'KHU VỰC VẠN THUẬN, PHƯỜNG NHƠN THÀNH, TX AN NHƠN, BÌNH ĐỊNH','VN018')
insert into customer values('000025',N'Trần Quang Khải','0935777298',N'KIỆT 38 TÔN THẤT SƠN, THỦY PHƯƠNG, HƯƠNG THỦY, TT HUẾ','VN019')
insert into customer values('000026',N'Nguyễn Trí Hùng','0905886802',N'HUỲNH HÙNG, THÔN 4, XÃ HÒA PHONG, KRÔNG BÔNG, ĐĂK LĂK','VT007')
insert into customer values('000027',N'Dương Ngọc Long','01208776312',N'01 THOẠI NGỌC HẦU, TAM KỲ, QUẢNG NAM','VT008')
insert into customer values('000028',N'Trương Nhật Minh','01654217772',N'TỔ 37B KHU VỰC 4, SỐ NHÀ 20/6A CHI LĂNG, QUY NHƠN, BÌNH ĐỊNH','VT009')
insert into customer values('000029',N'Lê Nguyễn Hoàng Văn','0969590517',N'SỐ 31 ĐƯỜNG HÒA MINH 4, LIÊN CHIỂU, ĐÀ NẴNG','VT010')
insert into customer values('000030',N'Nguyễn Văn Hoàng Long','0914660398',N'TỔ 45 ĐA PHƯỚC II, HÒA KHÁNH BẮC, LIÊN CHIỂU, ĐÀ NẴNG','VT009')
insert into customer values('000031',N'Trần Phước Đạt','0914163750',N'11 THÚC TỀ, THANH KHÊ, TP. ĐÀ NẴNG','VT010')
insert into customer values('000032',N'Phạm Duy Khánh','01646636030',N'08/38 TRẦN BÌNH TRỌNG - P. ĐÔNG SƠN - TP THANH HÓA','VT011')
insert into customer values('000033',N'Lương Minh Hiếu','0936185901',N'ĐỘI 7, THÔN 8, TAM LỘC, PHÚ NINH, QUẢNG NAM','VT009')
insert into customer values('000034',N'Nguyễn Ngọc Thắng','01656730217',N'16 LÝ THÁNH TÔNG, ĐỒNG HỚI, QUẢNG BÌNH','VT010')
insert into customer values('000035',N'Trương Duy Tường','01645500071',N'ĐỘI 1 - PHAN XÁ - XUÂN THỦY - LỆ THỦY - QuẢNG BÌNH','VT011')

insert into account values('1000000001',88118000,'1','000001')
insert into account values('1000000002',188372000,'0','000002')
insert into account values('1000000003',44770000,'0','000003')
insert into account values('1000000004',157231000,'1','000004')
insert into account values('1000000005',178232000,'0','000005')
insert into account values('1000000006',-15678000,'1','000006')
insert into account values('1000000007',332183000,'1','000007')
insert into account values('1000000008',393221000,'1','000008')
insert into account values('1000000009',172923000,'0','000009')
insert into account values('1000000010',-6107000,'1','000010')
insert into account values('1000000011',227449000,'1','000011')
insert into account values('1000000012',184002000,'0','000012')
insert into account values('1000000013',229384000,'1','000013')
insert into account values('1000000014',94311000,'1','000014')
insert into account values('1000000015',104826000,'0','000015')
insert into account values('1000000016',236633000,'0','000016')
insert into account values('1000000017',121389000,'1','000017')
insert into account values('1000000018',226017000,'1','000018')
insert into account values('1000000019',133429000,'1','000019')
insert into account values('1000000020',272623000,'1','000020')
insert into account values('1000000021',358446000,'0','000021')
insert into account values('1000000022',69486000,'0','000022')
insert into account values('1000000023',232929000,'0','000023')
insert into account values('1000000024',301503000,'1','000024')
insert into account values('1000000025',221284000,'0','000025')
insert into account values('1000000026',184739000,'1','000026')
insert into account values('1000000027',3672000,'0','000027')
insert into account values('1000000028',143249000,'0','000028')
insert into account values('1000000029',85747000,'0','000029')
insert into account values('1000000030',238311000,'1','000030')
insert into account values('1000000031',243154000,'1','000031')
insert into account values('1000000032',350917000,'1','000032')
insert into account values('1000000033',265088000,'0','000033')
insert into account values('1000000034',86609000,'0','000034')
insert into account values('1000000035',248363000,'0','000035')
insert into account values('1000000036',381588000,'1','000001')
insert into account values('1000000037',59175000,'0','000018')
insert into account values('1000000038',123720000,'0','000019')
insert into account values('1000000039',83933000,'0','000020')
insert into account values('1000000040',333106000,'1','000021')
insert into account values('1000000041',227374000,'0','000022')
insert into account values('1000000042',179736000,'1','000023')
insert into account values('1000000043',222900000,'1','000024')
insert into account values('1000000044',214214000,'1','000025')
insert into account values('1000000045',56524000,'1','000026')
insert into account values('1000000046',349664000,'1','000027')
insert into account values('1000000047',77659000,'0','000028')
insert into account values('1000000048',99830000,'1','000029')
insert into account values('1000000049',91027000,'1','000014')
insert into account values('1000000050',95035000,'0','000015')
insert into account values('1000000051',100367000,'0','000016')
insert into account values('1000000052',77555000,'1','000017')
insert into account values('1000000053',295473000,'0','000018')
insert into account values('1000000054',197525000,'1','000019')

insert into transactions values('0000000201','0',1752000,'2011/12/27','07:45','1000000041')
insert into transactions values('0000000202','0',3617000,'2016/01/31','03:12','1000000019')
insert into transactions values('0000000203','0',1344000,'2012/06/16','09:43','1000000009')
insert into transactions values('0000000204','1',64088000,'2010/06/13','12:18','1000000021')
insert into transactions values('0000000205','1',72397000,'2010/01/16','09:12','1000000040')
insert into transactions values('0000000206','1',47332000,'2015/04/06','12:34','1000000007')
insert into transactions values('0000000207','0',4052000,'2014/07/30','05:00','1000000011')
insert into transactions values('0000000208','1',87035000,'2012/01/23','13:15','1000000013')
insert into transactions values('0000000209','0',2804000,'2015/10/09','23:10','1000000044')
insert into transactions values('0000000210','0',4538000,'2017/11/19','07:48','1000000022')
insert into transactions values('0000000211','1',28350000,'2012/01/03','10:39','1000000004')
insert into transactions values('0000000212','0',3201000,'2014/05/01','07:01','1000000032')
insert into transactions values('0000000213','1',69085000,'2015/06/10','12:06','1000000031')
insert into transactions values('0000000214','1',66529000,'2011/01/16','16:21','1000000045')
insert into transactions values('0000000215','0',1803000,'2012/02/13','21:03','1000000034')
insert into transactions values('0000000216','0',2952000,'2014/11/20','17:32','1000000053')
insert into transactions values('0000000217','0',4790000,'2014/07/25','04:47','1000000034')
insert into transactions values('0000000218','1',57458000,'2013/08/01','11:03','1000000043')
insert into transactions values('0000000219','1',16136000,'2012/05/27','13:31','1000000027')
insert into transactions values('0000000220','0',1620000,'2014/07/05','14:41','1000000016')
insert into transactions values('0000000221','1',2424000,'2015/06/23','09:44','1000000044')
insert into transactions values('0000000222','1',61787000,'2010/06/04','12:38','1000000038')
insert into transactions values('0000000223','0',105000,'2014/12/16','22:31','1000000045')
insert into transactions values('0000000224','1',1534000,'2014/10/16','14:39','1000000041')
insert into transactions values('0000000225','0',2951000,'2010/02/08','09:17','1000000027')
insert into transactions values('0000000226','0',4807000,'2011/09/19','00:51','1000000048')
insert into transactions values('0000000227','1',13573000,'2011/09/06','11:41','1000000021')
insert into transactions values('0000000228','0',3341000,'2012/07/03','01:06','1000000005')
insert into transactions values('0000000229','1',4653000,'2011/10/23','13:27','1000000039')
insert into transactions values('0000000230','1',11090000,'2015/04/13','12:41','1000000001')
insert into transactions values('0000000231','0',105000,'2016/11/27','13:02','1000000044')
insert into transactions values('0000000232','1',97609000,'2010/05/17','12:06','1000000046')
insert into transactions values('0000000233','1',1113000,'2016/03/18','15:33','1000000019')
insert into transactions values('0000000234','0',4680000,'2010/11/07','21:59','1000000038')
insert into transactions values('0000000235','1',42182000,'2011/02/28','10:32','1000000018')
insert into transactions values('0000000236','1',67251000,'2013/11/13','12:28','1000000025')
insert into transactions values('0000000237','1',19841000,'2013/10/30','16:58','1000000009')
insert into transactions values('0000000238','0',2310000,'2011/04/21','22:56','1000000048')
insert into transactions values('0000000239','0',4902000,'2015/05/17','09:31','1000000037')
insert into transactions values('0000000240','1',68984000,'2017/04/17','09:56','1000000042')
insert into transactions values('0000000241','0',400000,'2010/06/16','03:20','1000000042')
insert into transactions values('0000000242','1',95102000,'2011/03/27','15:06','1000000041')
insert into transactions values('0000000243','1',51881000,'2016/06/26','14:42','1000000020')
insert into transactions values('0000000244','1',83905000,'2011/08/21','16:33','1000000001')
insert into transactions values('0000000245','1',67883000,'2011/01/22','09:11','1000000026')
insert into transactions values('0000000246','0',3975000,'2016/09/15','17:57','1000000032')
insert into transactions values('0000000247','0',4814000,'2010/05/13','04:48','1000000003')
insert into transactions values('0000000248','0',984000,'2012/09/30','07:34','1000000002')
insert into transactions values('0000000249','0',1183000,'2017/07/11','10:15','1000000013')
insert into transactions values('0000000250','0',4269000,'2013/01/14','03:36','1000000027')
insert into transactions values('0000000251','1',50812000,'2014/01/27','15:30','1000000030')
insert into transactions values('0000000252','1',76973000,'2017/06/02','08:21','1000000035')
insert into transactions values('0000000253','1',44310000,'2013/10/25','16:14','1000000046')
insert into transactions values('0000000254','0',230000,'2013/05/18','01:58','1000000049')
insert into transactions values('0000000255','0',2764000,'2013/03/03','05:40','1000000042')
insert into transactions values('0000000256','1',42744000,'2013/01/10','14:47','1000000002')
insert into transactions values('0000000257','1',42623000,'2011/02/19','11:09','1000000049')
insert into transactions values('0000000258','1',37565000,'2010/08/12','08:20','1000000048')
insert into transactions values('0000000259','1',29850000,'2017/02/01','11:24','1000000012')
insert into transactions values('0000000260','1',30877000,'2017/05/07','12:54','1000000022')
insert into transactions values('0000000261','0',963000,'2010/01/09','02:42','1000000048')
insert into transactions values('0000000262','0',2131000,'2017/07/27','23:54','1000000007')
insert into transactions values('0000000263','0',1844000,'2010/11/22','15:00','1000000038')
insert into transactions values('0000000264','1',70780000,'2016/03/29','12:52','1000000040')
insert into transactions values('0000000265','0',3675000,'2013/05/03','09:39','1000000031')
insert into transactions values('0000000266','0',4769000,'2017/08/27','13:57','1000000039')
insert into transactions values('0000000267','1',61672000,'2014/11/15','08:58','1000000011')
insert into transactions values('0000000268','0',4783000,'2014/02/25','12:20','1000000032')
insert into transactions values('0000000269','1',56511000,'2010/04/25','13:38','1000000026')
insert into transactions values('0000000270','0',633000,'2014/02/23','09:15','1000000040')
insert into transactions values('0000000271','1',50123000,'2015/03/26','15:54','1000000016')
insert into transactions values('0000000272','0',4643000,'2011/04/25','07:59','1000000053')
insert into transactions values('0000000273','0',1655000,'2014/05/02','19:55','1000000023')
insert into transactions values('0000000274','0',393000,'2010/02/28','08:11','1000000015')
insert into transactions values('0000000275','0',128000,'2015/12/19','16:26','1000000024')
insert into transactions values('0000000276','1',60500000,'2011/05/12','11:21','1000000026')
insert into transactions values('0000000277','1',64983000,'2013/09/27','09:29','1000000040')
insert into transactions values('0000000278','0',3246000,'2017/01/23','08:55','1000000035')
insert into transactions values('0000000279','0',73000,'2013/07/01','19:33','1000000024')
insert into transactions values('0000000280','1',94002000,'2016/11/24','10:17','1000000046')
insert into transactions values('0000000281','1',70658000,'2013/12/04','15:24','1000000024')
insert into transactions values('0000000282','0',472000,'2010/03/21','02:16','1000000024')
insert into transactions values('0000000283','0',802000,'2013/05/25','03:50','1000000048')
insert into transactions values('0000000284','1',6815000,'2014/06/30','10:43','1000000032')
insert into transactions values('0000000285','0',3384000,'2017/10/10','04:44','1000000018')
insert into transactions values('0000000286','1',39274000,'2010/02/08','09:18','1000000033')
insert into transactions values('0000000287','0',1733000,'2015/03/11','12:21','1000000054')
insert into transactions values('0000000288','1',60723000,'2017/02/08','08:52','1000000047')
insert into transactions values('0000000289','0',601000,'2011/10/15','10:01','1000000044')
insert into transactions values('0000000290','1',95797000,'2013/01/03','10:03','1000000007')
insert into transactions values('0000000291','1',17028000,'2010/08/02','13:10','1000000042')
insert into transactions values('0000000292','0',3990000,'2010/07/03','19:03','1000000045')
insert into transactions values('0000000293','0',4870000,'2017/07/31','01:40','1000000028')
insert into transactions values('0000000294','0',2942000,'2017/09/12','11:25','1000000046')
insert into transactions values('0000000295','1',69188000,'2016/05/20','14:45','1000000040')
insert into transactions values('0000000296','1',79183000,'2011/08/16','13:19','1000000011')
insert into transactions values('0000000297','1',69815000,'2013/09/06','16:23','1000000004')
insert into transactions values('0000000298','0',4825000,'2011/04/25','16:20','1000000034')
insert into transactions values('0000000299','1',51986000,'2015/11/11','11:30','1000000023')
insert into transactions values('0000000300','1',48143000,'2016/07/20','16:32','1000000041')
insert into transactions values('0000000301','1',51568000,'2013/06/02','11:45','1000000019')
insert into transactions values('0000000302','0',938000,'2013/04/22','19:36','1000000016')
insert into transactions values('0000000303','1',65913000,'2014/03/12','08:36','1000000037')
insert into transactions values('0000000304','0',4220000,'2013/08/23','12:53','1000000011')
insert into transactions values('0000000305','0',1925000,'2014/08/26','15:35','1000000013')
insert into transactions values('0000000306','0',101000,'2012/08/07','11:42','1000000049')
insert into transactions values('0000000307','0',1180000,'2017/04/29','01:24','1000000027')
insert into transactions values('0000000308','1',22385000,'2012/01/19','13:27','1000000039')
insert into transactions values('0000000309','0',439000,'2013/06/13','23:42','1000000018')
insert into transactions values('0000000310','1',30540000,'2016/12/14','15:30','1000000053')
insert into transactions values('0000000311','1',88810000,'2013/04/06','09:45','1000000019')
insert into transactions values('0000000312','0',4601000,'2016/04/02','06:28','1000000021')
insert into transactions values('0000000313','0',3236000,'2015/08/07','18:14','1000000012')
insert into transactions values('0000000314','1',66597000,'2014/07/09','13:12','1000000036')
insert into transactions values('0000000315','0',4245000,'2011/07/24','18:54','1000000030')
insert into transactions values('0000000316','1',93838000,'2014/11/25','13:09','1000000013')
insert into transactions values('0000000317','1',87961000,'2016/01/24','11:23','1000000032')
insert into transactions values('0000000318','1',48242000,'2016/01/23','12:29','1000000002')
insert into transactions values('0000000319','0',1374000,'2014/05/21','12:51','1000000041')
insert into transactions values('0000000320','0',4122000,'2010/09/08','15:36','1000000009')
insert into transactions values('0000000321','0',3650000,'2017/11/12','21:24','1000000053')
insert into transactions values('0000000322','0',1789000,'2013/07/24','00:54','1000000016')
insert into transactions values('0000000323','1',62031000,'2014/05/12','14:33','1000000008')
insert into transactions values('0000000324','1',12276000,'2015/09/16','11:56','1000000011')
insert into transactions values('0000000325','0',1123000,'2011/06/14','00:21','1000000038')
insert into transactions values('0000000326','1',17385000,'2014/06/25','12:24','1000000026')
insert into transactions values('0000000327','0',3185000,'2013/02/09','04:04','1000000033')
insert into transactions values('0000000328','0',678000,'2010/05/14','13:05','1000000009')
insert into transactions values('0000000329','1',61632000,'2016/12/05','11:34','1000000004')
insert into transactions values('0000000330','0',3913000,'2015/04/15','01:12','1000000013')
insert into transactions values('0000000331','0',1065000,'2012/07/14','13:28','1000000048')
insert into transactions values('0000000332','0',1503000,'2015/01/20','12:49','1000000037')
insert into transactions values('0000000333','1',80947000,'2017/05/07','16:48','1000000048')
insert into transactions values('0000000334','0',3728000,'2014/11/25','23:07','1000000013')
insert into transactions values('0000000335','0',3300000,'2013/10/09','04:06','1000000017')
insert into transactions values('0000000336','1',50367000,'2012/05/20','15:25','1000000012')
insert into transactions values('0000000337','1',85455000,'2010/09/18','15:46','1000000031')
insert into transactions values('0000000338','0',4225000,'2013/01/07','05:41','1000000007')
insert into transactions values('0000000339','1',9121000,'2017/06/19','11:58','1000000018')
insert into transactions values('0000000340','0',381000,'2014/08/05','18:42','1000000015')
insert into transactions values('0000000341','0',1100000,'2013/02/24','21:31','1000000038')
insert into transactions values('0000000342','1',30491000,'2014/07/29','08:57','1000000032')
insert into transactions values('0000000343','1',27835000,'2016/06/21','13:17','1000000012')
insert into transactions values('0000000344','0',1551000,'2014/08/08','02:15','1000000010')
insert into transactions values('0000000345','0',3505000,'2013/06/27','05:07','1000000048')
insert into transactions values('0000000346','0',4189000,'2014/07/10','01:34','1000000001')
insert into transactions values('0000000347','1',91697000,'2010/01/16','08:11','1000000044')
insert into transactions values('0000000348','1',99536000,'2013/03/11','16:49','1000000032')
insert into transactions values('0000000349','0',353000,'2012/03/16','02:45','1000000027')
insert into transactions values('0000000350','0',389000,'2015/10/08','23:47','1000000012')
insert into transactions values('0000000351','1',72423000,'2014/02/14','10:25','1000000041')
insert into transactions values('0000000352','1',13763000,'2013/09/27','11:16','1000000016')
insert into transactions values('0000000353','1',51814000,'2014/09/29','12:22','1000000043')
insert into transactions values('0000000354','1',91252000,'2013/06/02','14:34','1000000008')
insert into transactions values('0000000355','0',2514000,'2014/06/04','05:17','1000000054')
insert into transactions values('0000000356','0',4919000,'2013/06/18','12:22','1000000047')
insert into transactions values('0000000357','0',3143000,'2016/01/26','23:03','1000000032')
insert into transactions values('0000000358','0',1992000,'2010/04/12','23:45','1000000014')
insert into transactions values('0000000359','1',58270000,'2012/09/10','15:45','1000000046')
insert into transactions values('0000000360','1',74070000,'2012/02/19','16:56','1000000008')
insert into transactions values('0000000361','0',1680000,'2016/04/05','07:36','1000000032')
insert into transactions values('0000000362','1',55726000,'2014/01/25','10:59','1000000007')
insert into transactions values('0000000363','1',21146000,'2013/08/12','14:42','1000000047')
insert into transactions values('0000000364','1',78735000,'2017/12/01','16:46','1000000007')
insert into transactions values('0000000365','0',2671000,'2017/11/30','00:15','1000000031')
insert into transactions values('0000000366','1',95431000,'2012/10/22','16:41','1000000034')
insert into transactions values('0000000367','0',3909000,'2011/02/25','09:26','1000000026')
insert into transactions values('0000000368','1',21611000,'2012/12/19','16:55','1000000017')
insert into transactions values('0000000369','0',2331000,'2016/07/21','08:19','1000000039')
insert into transactions values('0000000370','1',97722000,'2017/10/09','15:37','1000000036')
insert into transactions values('0000000371','0',2549000,'2011/10/05','03:57','1000000007')
insert into transactions values('0000000372','1',85892000,'2012/10/29','11:51','1000000036')
insert into transactions values('0000000373','0',1567000,'2010/01/16','17:36','1000000022')
insert into transactions values('0000000374','1',16323000,'2013/09/01','09:40','1000000021')
insert into transactions values('0000000375','0',187000,'2010/05/15','16:42','1000000018')
insert into transactions values('0000000376','0',4229000,'2017/02/07','19:30','1000000031')
insert into transactions values('0000000377','1',59997000,'2014/12/11','09:30','1000000035')
insert into transactions values('0000000378','0',4296000,'2016/12/29','12:59','1000000026')
insert into transactions values('0000000379','0',4857000,'2014/03/30','01:16','1000000031')
insert into transactions values('0000000380','0',1799000,'2017/01/30','04:47','1000000002')
insert into transactions values('0000000381','1',44405000,'2015/09/06','08:57','1000000008')
insert into transactions values('0000000382','0',1668000,'2014/08/23','07:24','1000000054')
insert into transactions values('0000000383','1',40698000,'2011/07/16','15:15','1000000014')
insert into transactions values('0000000384','1',22497000,'2012/05/01','11:44','1000000043')
insert into transactions values('0000000385','1',49035000,'2017/06/08','09:48','1000000016')
insert into transactions values('0000000386','1',44783000,'2014/01/01','13:31','1000000044')
insert into transactions values('0000000387','1',56079000,'2015/08/28','15:41','1000000038')
insert into transactions values('0000000388','0',2951000,'2012/09/29','11:43','1000000015')
insert into transactions values('0000000389','1',28775000,'2015/06/24','09:26','1000000038')
insert into transactions values('0000000390','0',4035000,'2011/02/01','23:57','1000000008')
insert into transactions values('0000000391','1',92145000,'2013/01/07','15:16','1000000023')
insert into transactions values('0000000392','0',4447000,'2010/03/27','18:13','1000000023')
insert into transactions values('0000000393','1',38568000,'2013/08/28','11:28','1000000054')
insert into transactions values('0000000394','1',61242000,'2013/09/04','10:14','1000000040')
insert into transactions values('0000000395','0',1095000,'2016/10/29','23:55','1000000005')
insert into transactions values('0000000396','0',4208000,'2017/12/12','22:47','1000000044')
insert into transactions values('0000000397','0',1277000,'2012/01/15','20:09','1000000013')
insert into transactions values('0000000398','0',4794000,'2014/12/16','05:05','1000000043')
insert into transactions values('0000000399','1',69667000,'2015/09/14','10:12','1000000015')
insert into transactions values('0000000400','1',85228000,'2014/08/17','09:53','1000000016')
insert into transactions values('0000000401','1',2215000,'2014/09/03','13:18','1000000031')
insert into transactions values('0000000402','1',34163000,'2015/02/25','10:05','1000000012')
insert into transactions values('0000000403','0',4244000,'2017/11/30','00:54','1000000041')
insert into transactions values('0000000404','1',12142000,'2016/12/02','14:47','1000000029')
insert into transactions values('0000000405','1',45481000,'2013/03/23','11:22','1000000012')

DEMO.sql
Đang hiển thị DEMO.sql.

select *from Bank
select *from Branch
select *from customer
select *from account
select *from transactions

SELECT cust_name, br_id
FROM customer
WHERE br_id = ( SELECT customer . br_id
                              FROM customer JOIN branch ON customer . br_id = branch . br_id
                              WHERE cust_name = N'Hà Công Lực')
