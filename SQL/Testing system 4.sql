USE testing_system_assignment_1;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 
	*
FROM `account`
LEFT JOIN department
ON `account`.DepartmentID = department.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT 
	`account`.AccountID,
    `account`.Email, 
    `account`.UserName, 
    `account`.FullName, 
    `account`.CreateDate, 
    department.DepartmentName, 
    `group`.GroupName, 
    `position`.PositionName
FROM `account`
INNER JOIN department ON `account`.DepartmentID = department.DepartmentID
INNER JOIN groupaccount ON `account`.AccountID = groupaccount.AccountID
INNER JOIN `group` ON groupaccount.GroupID = `group`.GroupID
INNER JOIN `position` ON `account`.PositionID = `position`.PositionID
WHERE `account`.CreateDate > '2010/12/10';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT 
	AccountID,
    Email,
    UserName,
    FullName,
    DepartmentName,
    PositionName,
    `account`.CreateDate
FROM `account`
INNER JOIN `position` ON `account`.PositionID = `position`.PositionID
INNER JOIN department ON `account`.DepartmentID = department.DepartmentID
WHERE PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT 
	DepartmentName, COUNT(AccountID),
    `account`.*
FROM `account`
INNER JOIN department ON `account`.DepartmentID = department.DepartmentID
GROUP BY AccountID
HAVING COUNT(AccountID) >= 1;
USE testing_system_assignment_1;
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT
	question.*, MAX(`VALUE`)
FROM (SELECT QuestionID, MAX(QS) `VALUE`
		FROM (SELECT 
				QuestionID, COUNT(QuestionID) QS
                FROM examquestion
                GROUP BY QuestionID) `MAX`) DEM
INNER JOIN question ON DEM.QuestionID = question.QuestionID;

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT 
	CategoryID, COUNT(QuestionID)
FROM question
GROUP BY CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT
	ExamID, COUNT(ExamID)
FROM examquestion
GROUP BY QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT
	QuestionID, MAX(`MAX`)
FROM (SELECT 
			QuestionID, COUNT(A.QuestionID) `MAX`
		FROM answer A
		GROUP BY A.QuestionID) C;

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT
	GroupID, COUNT(AccountID)
FROM groupaccount
GROUP BY GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT
	P.PositionID, P.PositionName, COUNT(AccountID)
FROM `account`A
INNER JOIN  `position` P
ON P.PositionID = A.PositionID
GROUP BY P.PositionID
HAVING COUNT(AccountID) = (SELECT MIN(`COUNT`) C
					FROM(SELECT 
							COUNT(PositionID) `COUNT`
							FROM `account`
							GROUP BY PositionID) M);
                            
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT 
	A.DepartmentID, P.PositionName, COUNT(D.DepartmentID)
FROM `account` A
INNER JOIN `position` P
ON A.PositionID = P.PositionID
INNER JOIN department D
ON A.DepartmentID = D.DepartmentID
WHERE 
	P.PositionName IN('DEV', 'TEST', 'PM')
GROUP BY A.DepartmentID
ORDER BY A.DepartmentID;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT 
	Q.QuestionID,
    Q.Content,
    C.CategoryName,
    T.TypeName,
    Q.CreatorID,
    A.Content,
    A.isCorrect
FROM question Q
	INNER JOIN categoryquestion C
		ON Q.CategoryID = C.CategoryID
	INNER JOIN typequestion T
		ON Q.TypeID = T.TypeID
	INNER JOIN answer A
		ON Q.QuestionID = A.QuestionID;
        
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT
	T.TypeName, COUNT(TypeName)
FROM typequestion T
	INNER JOIN question Q
		ON T.TypeID = Q.TypeID
GROUP BY T.TypeName;

-- Question 14:Lấy ra group không có account nào
SELECT
	G.GroupID, G.GroupName, CreatorID, AccountID, G.CreateDate
FROM `group` G
	LEFT JOIN groupaccount A
		ON G.GroupID = A.GroupID
WHERE A.AccountID IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT 
	Q.QuestionID, Q.Content, Q.CategoryID, Q.TypeID, Q.CreatorID, Q.CreateDate, A.AnswerID
FROM question Q
	LEFT JOIN answer A
		ON Q.QuestionID = A.QuestionID
WHERE A.AnswerID IS NULL;

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1:
SELECT 
	A.*, G.GroupID
FROM `account` A	
	INNER JOIN groupaccount G
		ON A.AccountID = G.AccountID
WHERE G.GroupID = '1'
-- c) Ghép 2 kết quả từ câu a) và câu b)
UNION ALL
-- b) Lấy các account thuộc nhóm thứ 2
SELECT 
	A.*, G.GroupID
FROM `account` A	
	INNER JOIN groupaccount G
		ON A.AccountID = G.AccountID
WHERE G.GroupID = '3';

-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT 
	*, COUNT(AccountID)
FROM groupaccount
GROUP BY GroupID
HAVING COUNT(AccountID) > 5
-- c) Ghép 2 kết quả từ câu a) và câu b)
UNION ALL 
-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT 
	*, COUNT(AccountID)
FROM groupaccount
GROUP BY GroupID
HAVING COUNT(AccountID) < 7