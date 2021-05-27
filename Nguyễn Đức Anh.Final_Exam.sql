DROP DATABASE IF EXISTS finalexam;
CREATE DATABASE IF NOT EXISTS finalexam;
USE finalexam;



DROP TABLE IF EXISTS  `User`;
CREATE TABLE IF NOT EXISTS `User` ( 	
	id 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	email 		CHAR(100) NOT NULL UNIQUE,
	`password`		VARCHAR(800) NOT NULL,
	fullName 		NVARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Manager;
CREATE TABLE IF NOT EXISTS Manager ( 	
	id 				SMALLINT UNSIGNED NOT NULL,
	expInYear 	SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (id) REFERENCES `User`(id)
);


DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee ( 	
	id 				SMALLINT UNSIGNED NOT NULL,
    proSkill 		ENUM('DEV', 'TEST', 'JAVA', 'SQL') NOT NULL,
    FOREIGN KEY (id) REFERENCES `User`(id)
);


DROP TABLE IF EXISTS Project;
CREATE TABLE IF NOT EXISTS Project ( 	
	projectID 		SMALLINT UNSIGNED NOT NULL,
	teamSize	 	SMALLINT UNSIGNED,
    id	 			SMALLINT UNSIGNED NOT NULL,
    chucVu			ENUM ('MANAGER', 'EMPLOYEE')
 
);


-- insert
INSERT INTO `User` 	(email,					`password`,		  fullName	)
VALUE				('tttt1@gmail.com',		'123456A',		'Nguyen Van A'	), 
					('tttt2@gmail.com',		'123456A',		'Nguyen Van B'	), 
					('tttt3@vti.com',		'123456A',		'Nguyen Van C'	), 
					('tttt4@vti.com',		'123456A',		'Nguyen Van D'	), 
					('tttt5@vti.com',		'123456A',		'Nguyen Van E'	), 
					('tttt6@vti.com',		'123456A',		'Nguyen Van F'	),
					('tttt7@gmail.com', 	'123456A',		'Nguyen Van G'	),
					('tttt8@gmail.com', 	'123456A',		'Nguyen Van H'	),
					('tttt9@gmail.com', 	'123456A',		'Nguyen Van I'	),
					('tttt10@gmail.com', 	'123456A',		'Nguyen Van J'	),
					('tttt11@gmail.com', 	'123456A',  	'Nguyen Van K'	),
					('yyyy12@gmail.com', 	'123456A',		'Nguyen Van L'	),
					('tttt13@gmail.com', 	'123456A',		'Nguyen Van N'	),
					('tttt14@gmail.com', 	'123456A',		'Nguyen Van M'	),
					('tttt15@gmail.com', 	'123456A',		'Nguyen Van O'	);
	

INSERT INTO Manager (id,	expInYear	)
VALUE				(1,			1		), 
					(2,			2		), 
					(3,			3		), 
					(4,			4		), 
					(5,			5		), 
					(6,			6		), 
					(7,			7		);
				
INSERT INTO Employee 	(id,	`proSkill`	)
VALUE					(8,			'DEV'	), 
						(9,			'DEV'	), 
						(10,		'TEST'	), 
						(11,		'TEST'	), 
						(12,		'JAVA'	), 
						(13,		'DEV'	), 
						(14,		'JAVA'	), 
						(15,		'SQL'	);


INSERT INTO Project 	(projectId	,	teamSize,	   id,   		 	chucVu	)
VALUE						(1		,		3	,	   	1,				'MANAGER'), 
							(1		,		3	,		8,				'EMPLOYEE'), 
							(1		,		3	,		9,				'EMPLOYEE'), 
							(2		,		4	,		10,				'EMPLOYEE'), 
							(2		,		4	,		2,				'MANAGER'), 
							(2		,		4	,		11,				'EMPLOYEE'), 
                            (2		,		4	,		12,				'EMPLOYEE'),
							(3		,		5	,		13,				'EMPLOYEE'), 
                            (3		,		5	,		14,				'EMPLOYEE'), 
                            (3		,		5	,		15,				'EMPLOYEE'), 
                            (3		,		5	,		16,				'EMPLOYEE'), 
							(3		,		5	,		3,				'MANAGER');