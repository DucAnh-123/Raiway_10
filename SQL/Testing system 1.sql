CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
CREATE TABLE Department(
	DepartmentID 		INT NOT NULL AUTO_INCREMENT,
    DepartmentName 		VARCHAR(50),
    PRIMARY KEY 		(DepartmentID));
CREATE TABLE `Position`(
	PositionID 			INT NOT NULL AUTO_INCREMENT,
    PositionName		VARCHAR(50),
    PRIMARY KEY			(PositionID));
CREATE TABLE `Account`(
	AccountID			INT AUTO_INCREMENT,
    Email				VARCHAR(100),
    UserName			VARCHAR(50),
    FullName			VARCHAR(50),
	DepartmentID		INT,
    PositionID 			INT,
    CreateDate			DATE,
    PRIMARY KEY 		(AccountID),
    FOREIGN KEY 		(DepartmentID) 	REFERENCES Department(DepartmentID),
    FOREIGN KEY 		(PositionID) 	REFERENCES `Position`(PositionID));
CREATE TABLE `GROUP`(
	GroupID				INT NOT NULL AUTO_INCREMENT,
    GroupName			VARCHAR(50),
    CreatorID			INT,
    CreateDate			DATE,
    PRIMARY KEY 		(GroupID));
CREATE TABLE GroupAccount(
	GroupID				INT,
    AccountID			INT,
    JoinDate			DATE,
    FOREIGN KEY 		(GroupID)	REFERENCES	`GROUP`(GroupID),
    FOREIGN KEY 		(AccountID)	REFERENCES	`Account`(AccountID));
CREATE TABLE TypeQuestion(
	TypeID				INT AUTO_INCREMENT NOT NULL,
    TypeName			VARCHAR(500),
    PRIMARY KEY 		(TypeID));
CREATE TABLE CategoryQuestion(
	CategoryID			INT NOT NULL AUTO_INCREMENT,
    CategoryName		VARCHAR(500),
    PRIMARY KEY 		(CategoryID));
CREATE TABLE Question(
	QuestionID			INT NOT NULL AUTO_INCREMENT,
    Content				VARCHAR(1000),
	CategoryID			INT,
    TypeID				INT,
    CreatorID			INT,
    CreateDate			DATE,
    PRIMARY KEY			(QuestionID),
    FOREIGN KEY			(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY 		(TypeID)		REFERENCES TypeQuestion(TypeID));
CREATE TABLE Answer(
	AnswerID			INT NOT NULL AUTO_INCREMENT,
    Content				VARCHAR(500),
    QuestionID			INT,
    isCorrect			BOOL,
    PRIMARY KEY			(AnswerID),
    FOREIGN KEY 		(QuestionID)	REFERENCES Question(QuestionID));
CREATE TABLE Exam(
	ExamID				INT NOT NULL AUTO_INCREMENT,
    `Code`				VARCHAR(20),
    Title				VARCHAR(200),
    CategoryID			INT,
    Duration			INT,
    CreatorID			INT,
    CreateDate			DATE,
    PRIMARY KEY 		(ExamID),
    FOREIGN KEY			(CategoryID) 	REFERENCES CategoryQuestion(CategoryID));
CREATE TABLE ExamQuestion(
	ExamID				INT,
    QuestionID			INT,
    FOREIGN KEY 		(ExamID)		REFERENCES Exam(ExamID),
    FOREIGN KEY 		(QuestionID)	REFERENCES Question(QuestionID));