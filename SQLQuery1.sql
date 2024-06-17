use master
drop database if exists ReviewFood

create database ReviewFood
use ReviewFood

create table Users(
userID int primary key identity(1,1),
userName nvarchar(50) not null,
email nvarchar(30) not null unique,
password nvarchar(30) not null,
dob nvarchar(30) not null,
gender nvarchar(1) not null,
address nvarchar(50),
verifyCode nvarchar(6),
status nvarchar(1),
userRole nvarchar(1)
)


create table Products(
productID int primary key identity(1,1),
productName nvarchar(50) not null,
category nvarchar(50),
description nvarchar(4000), 
productRate money,
[address] nvarchar(100),
phoneNumber nvarchar(20),
imageFile nvarchar(20),
status nvarchar(1), 
price money
)


create table ReviewContent(
reviewContentID int identity(1,1) unique,
userID int foreign key references Users(userID),
productID int foreign key references Products(productID),
user_rating money not null,
comment nvarchar(50),
status nvarchar(1)
primary key ( userID, productID )
)

insert into Users 
(userName, email, password, dob, gender, address, verifyCode, status, userRole) values 
('Hoang Linh', 'linhhnhe163254@fpt.edu.vn','123456','12/12/2002', '0','ABC Hoa Lac', '123456','1','1'),
('Hoa Ly', 'hnlinh002@gmail.com','1234','5/5/2002','1','ABC Hoa Lac', '123456','1','2'),
('Okie','1998vari@gmail.com','1234','5/3/2002','1','ABC Hoa Lac', '123456','1','2')

insert into Products
(productName, category, description, productRate, address, phoneNumber, imageFile, status, price) values
('Bun oc','Food',
'<p>
Giờ mở cửa: 06:00 – 20:00 <br>
Đến với 120A1 Ngõ 140 Giảng Võ, bạn sẽ được thưởng thức món bún ốc ngon bá cháy. 
Nước hàng bún ngon vừa miệng có vị đậm đà. Những con ốc ở đây to giòn không tanh không nhớt. 
Cho thêm tí ớt trưng của quán tự làm là quá chuẩn luôn. Bạn nào thích ăn thêm chua thì có lọ 
rấm bỗng bên cạnh nhé. Ngoài ra còn ăn kèm với rau sống rất tươi và sạch.
</p>',
'4',
'120A1 Ngõ 140 Giảng Võ, Quận Ba Đình, Hà Nội',
'','bunOc.jpg','1',25000), 
('Bún ngan','Food',
'<p>
Giờ mở cửa: 06:00 – 20:00
Quán khá sạch sẽ, rộng rãi không gian thoải mái.
Bát bún nhiều bún, có 3 – 4 miếng thịt ngan. 
Ngoài ra còn có tiết và măng, rau. Có thể gọi thêm măng tiết ăn kèm. 
Quẩy luôn có sẵn ăn kèm nước chấm ở đây cực hợp. Điều gây ấn tượng nhất là dấm tỏi, 
tương ớt ở đây đựng hẳn trong âu to, tự phục vụ lấy bao nhiêu tuỳ thích. 
Chú bán hàng ít nói nhưng rất biết chiều ý thích ăn uống của từng khách hàng.
</p>',
'4',
'Ngõ 20 Hàng Vôi, Quận Hoàn Kiếm, Hà Nội',
'','bunNgan.jpg','1',25000),
('Bún Ngan','Food',
'<p>
Giờ mở cửa: 07:30 – 22:00
Quán bún Hà Nội này khá nhỏ, kê vài chiếc bàn ở ngoài sân, tuy nhiên rất sạch sẽ, râm mát. 
Nước dùng đậm đà và ngọt từ giò heo. Giò heo ở đây rất giòn, nhiều thịt, da cũng rất ngon. 
Ngoài ra quán còn có bún thịt bò tái ăn cũng rất bắt miệng.
</p>',
'4',
'111A5, TT. Thành Công, Ba Đình, Hà Nội',
'','bunBo.jpg','1',50000),
('Chè Bốn Mùa', 'Drink',
'<p>Chè Bốn Mùa là một quán chè Hà Nội có tuổi đời lâu năm nhất nhì phố cổ. 
Như đa phần các quán ngon thủ đô, Chè Bốn Mùa xuất phát điểm từ gánh hàng rong thân thuộc. 
Sau hơn 40 năm hoạt động, quán trở thành quán yêu thích của người dân thủ đô.</p>

<p>Chè Bốn Mùa nổi bật với hương vị của chè truyền thống được truyền qua mọi thế hệ. 
Bên cạnh đó, quán cũng cập nhật các món chè mới như chè khúc bạch và các loại sữa chua. 
Về chất lượng, chè của quán thơm và có vị ngọt thanh nhẹ, không quá gắt. Nếu có dịp ghé Hà Nội, 
bạn đừng quên thử chè thập cẩm, đỗ xanh và chè sen tại đây nhé.
</p>',
'4',
'4 Hàng Cân, Hoàn Kiếm',
'', 'cheBonMua.jpg','1',20000
),
('Mixua - Cafe', 'Drink',
'<p>
Cafe chính là thức uống tiếp theo làm cho tên tuổi Mixue phủ sóng “thần tốc”. 
Tuy không nổi rần rần như kem Mixue và trà sữa Mixue nhưng cafe Mixue sẽ là lựa chọn cho những ai yêu thích caffeine. 
Cà phê Mixue mang hương vị khá mới mẻ, đậm đà rất đáng để thử và với mức giá cũng chỉ 25.000 đồng mà thôi. 
</p>',
'4',
'',
'', 'mixueCafe.png','1',25000
),
('Mixua - Bubble Tea', 'Drink',
'<p>
Trà sữa Mixue là thức uống best seller không kém cạnh gì kem Mixue. Trong đó, nổi bật là trà 
sữa Bá Vương Mixue, trà sữa trân châu đường đen Mixue, và trà sữa 3Q Mixue. Mỗi loại lại mang một hương 
vị đặc trưng khác biệt từ trà tới sữa, không “na ná” với các hãng trôi nổi hiện nay. Trà 
sữa Mixue cũng có mức giá khá vừa túi tiền học sinh sinh viên, chỉ với 25.000 đồng/ly là bạn 
có thể nhâm nhi cả buổi rồi. 
</p>',
'4',
'',
'', 'mixueBubbleTea.jpg','1',25000
)


insert into ReviewContent (userID, productID, user_rating, comment, status) values 
(1,1,4,'Good',1),
(1,2,4,'So so',1),
(1,3,4,'Nice',1),
(1,4,4,'Very nice',1),
(2,1,4,'Look nice',1),
(2,2,4,'OK',1),
(2,3,4,'Noice',1),
(2,4,4,'Okie',1)

select * from Users
select * from Products
select * from ReviewContent

select * from Products WHERE productName like '%oc%' OR category like '%oc%' 
OR address like '%oc%' OR phoneNumber like '%oc%'