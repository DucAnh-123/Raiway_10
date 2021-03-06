USE testing_system_assignment_1;
INSERT INTO department(DepartmentName)
VALUES 	('Marketing'),
		('Sale'),
        ('Bảo vệ'),
        ('Nhân sự'),
        ('Kỹ thuật'),
        ('Tài chính'),
        ('Phó giám đốc'),
        ('Giám đốc'),
        ('Thư kí'),
        ('Bán hàng');
INSERT INTO `position`(PositionName)
VALUES 	('Dev'),
		('Test'),
        ('Scrum Master'),
        ('PM');
INSERT INTO	
`account`	(Email,	UserName, FullName,	DepartmentID, PositionID, CreateDate)
VALUES	('haidang29productions@gmail.com', 	'dangblack',	 'Nguyễn hải Đăng',		'5', '1', '2020-03-05'),
		('account1@gmail.com',			   	'quanganh', 	 'Nguyen Chien Thang2',	'1', '2', '2020-03-05'),
        ('account2@gmail.com', 				'vanchien',		 'Nguyen Van Chien', 	'2', '3', '2020-03-07'),
        ('account3@gmail.com', 				'cocoduongqua',	 'Duong Do', 			'3', '4', '2020-03-08'),
        ('account4@gmail.com', 				'doccocaubai', 	 'Nguyen Chien Thang1', '4', '4', '2020-03-10'),
        ('dapphatchetngay@gmail.com', 		'khabanh', 		 'Ngo Ba Kha', 			'6', '3', '2020-04-05'),
        ('songcodaoly@gmail.com', 			'huanhoahong',	 'Bui Xuan Huan', 		'7', '2',  NULL),
        ('sontungmtp@gmail.com', 			'tungnui', 		 'Nguyen Thanh Tung', 	'8', '1', '2020-04-07'),
        ('duongghuu@gmail.com',			    'duongghuu', 	 'Duong Van Huu', 		'9', '2', '2020-04-07'),
        ('haidang29productions@gmail.com',  'dangblack',	 'Nguyễn hải Đăng', 	'5', '1', '2020-03-05'),
        ('vtiaccademy@gmail.com', 		    'vtiaccademy',   'Vi Ti Ai', 			'10', '1','2020-04-09');
INSERT INTO `group`	(	GroupName,			CreatorID, 	 	 CreateDate)
VALUES 				('Testing System',			5,			'2019-03-05'),
					('Development',				1,			'2020-03-07'),
                    ('VTI Sale 01',				2,			'2020-03-09'),
                    ('VTI Sale 02',				3,			'2020-03-10'),
                    ('VTI Sale 03',				4,			'2020-03-28'),
                    ('VTI Creator',				6,			'2020-04-06'),
                    ('VTI Marketing 01',		7,			'2020-04-07'),
                    ('Management',				8,			'2020-04-08'),
                    ('Chat with love',			9,			'2020-04-09'),
                    ('Vi Ti Ai',				10,			'2020-04-10');
INSERT INTO groupaccount
VALUES 	(	1		,    1		,'2019-03-05'),
		(	1		,    2		,'2020-03-07'),
		(	3		,    3		,'2020-03-09'),
		(	3		,    4		,'2020-03-10'),
		(	5		,    5		,'2020-03-28'),
		(	1		,    3		,'2020-04-06'),
		(	1		,    7		,'2020-04-07'),
		(	8		,    3		,'2020-04-08'),
		(	1		,    9		,'2020-04-09'),
		(	10		,    10		,'2020-04-10');
INSERT INTO typequestion(TypeName)
VALUES 	('Essay'), 
		('Multiple-Choice'); 
INSERT INTO categoryquestion(CategoryName)
VALUES 	('Java'),
		('ASP.NET'),
		('ADO.NET'),
		('SQL'),
		('Postman'),
		('Ruby'),
		('Python'),
		('C++'),
		('C Sharp'),
		('PHP');
INSERT INTO question
		(	Content,		CategoryID,   TypeID, 		 CreatorID, 	 CreateDate)
VALUES	('Câu hỏi về Java', 	1,   		'1',   			'2',		'2020-04-05'),
		('Câu Hỏi về PHP',		10,  		'2',   			'2',		'2020-04-05'),
		('Hỏi về C#',			9,   		'2',   			'3',		'2020-04-06'),
		('Hỏi về Ruby',			6,  		'1',   			'4',		'2020-04-06'),
		('Hỏi về Postman',		5,   		'1',   			'5',		'2020-04-06'),
		('Hỏi về ADO.NET',		3,   		'2',   			'6',		'2020-04-06'),
		('Hỏi về ASP.NET',		2,   		'1',   			'7',		'2020-04-06'),
		('Hỏi về C++',			8,   		'1',   			'8',		'2020-04-07'),
		('Hỏi về SQL',			4,   		'2',   			'9',		'2020-04-07'),
		('Hỏi về Python',		7,   		'1',   			'10',		'2020-04-07');
INSERT INTO answer	(  Content, 	QuestionID, isCorrect)
VALUES 				('Trả lời 01',  	1,			0),
					('Trả lời 02',   	1,			1),
                    ('Trả lời 03',   	1,			0),
                    ('Trả lời 04',   	1,			1),
                    ('Trả lời 05',  	2,			1),
                    ('Trả lời 06',   	3,			1),
                    ('Trả lời 07',   	4,			0),
                    ('Trả lời 08',   	8,			0),
                    ('Trả lời 09',   	9,			1),
                    ('Trả lời 10',   	10,			1);
INSERT INTO exam( `Code`,	    Title, 		CategoryID,	 Duration, 	 CreatorID,  CreateDate)
VALUES			('VTIQ001', 'Đề thi C#',		1,		   	60,   		'5',	'2019-04-05'),
				('VTIQ002', 'Đề thi PHP',		10, 	  	60,   		'2',	'2019-04-05'),
				('VTIQ003', 'Đề thi C++',		9,			120,   		'2',	'2019-04-07'),
				('VTIQ004', 'Đề thi Java',		6,			60,   		'3',	'2020-04-08'),
				('VTIQ005', 'Đề thi Ruby',		5,			120,   		'4',	'2020-04-10'),
				('VTIQ006', 'Đề thi Postman',	3,			60,   		'6',	'2020-04-05'),
				('VTIQ007', 'Đề thi SQL',		2,			60,   		'7',	'2020-04-05'),
				('VTIQ008', 'Đề thi Python'	,	8,			60,   		'8',	'2020-04-07'),
				('VTIQ010', 'Đề thi ASP.NET',	7,			90,   		'10',	'2020-04-08');
INSERT INTO examquestion (ExamID, QuestionID)
VALUES						(1,		5),
							(2,		10), 
							(3,		4), 
							(4,		3), 
							(5,		7), 
							(6,		10), 
							(7,		2), 
							(8,		10), 
							(9,		9), 
							(10,	8);