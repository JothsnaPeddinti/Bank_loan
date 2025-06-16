USE [test]
GO
--> Selecting the data from a database
SELECT [Loan_ID]
      ,[Gender]
      ,[Married]
      ,[Dependents]
      ,[Education]
      ,[Self_Employed]
      ,[ApplicantIncome]
      ,[CoapplicantIncome]
      ,[LoanAmount]
      ,[Loan_Amount_Term]
      ,[Credit_History]
      ,[Property_Area]
      ,[Loan_Status]
  FROM [dbo].[loan_data_set]

GO

--> Checking the status of ho many loans approved
SELECT * FROM [dbo].[loan_data_set] WHERE Loan_Status ='1';
--> Finding and dividing the number of applicants wwho are approrved and rejected for loan
SELECT SUM (CASE WHEN Loan_Status = '1' THEN 1 ELSE 0 END) AS Approved_total, SUM(CASE WHEN Loan_Status='0' THEN 1 ELSE 0 END) rejected_total from [dbo].[loan_data_set];
-->Approval Rate
SELECT (COUNT(CASE WHEN Loan_status='1' THEN 1 END) * 100.0)/ COUNT(*) AS Approval_Rate FROM [dbo].[loan_data_set];
-->Rejection Rate
SELECT (COUNT(CASE WHEN Loan_status='0' THEN 0 END) * 100.0)/COUNT(*) AS Rejected_Rate FROM [dbo].[loan_data_set];
-->Create table appID,Loanstaus,submissionDate,DecisionDate
Create table loan_applications(AppID INT PRIMARY KEY,
Loan_status VARCHAR(20),Submission_Date DATE,Decision_Date DATE);
Insert into loan_applications(AppID,Status,Submission_Date,Decision_Date) values
(1,'Approved','2025-01-10','2025-01-15'),
(2,'Rejected','2025-01-12','2025-01-18'),
(3,'Rejected','2025-01-09','2025-01-16'),
(4,'Approved','2025-01-08','2025-01-20'),
(5,'Approved','2025-02-07','2025-02-14'),
(6,'Approved','2025-02-02','2025-02-16'),
(7,'Rejected','2025-02-05','2025-02-10'),
(8,'Approved','2025-02-09','2025-02-13'),
(9,'Rejected','2025-03-03','2025-03-09'),
(10,'Approved','2025-03-04','2025-03-11'),
(11,'Rejected','2025-03-06','2025-03-14'),
(12,'Rejected','2025-03-10','2025-03-12'),
(13,'Approved','2025-04-04','2025-03-10'),
(14,'Rejected','2025-04-05','2025-04-09'),
(15,'Approved','2025-04-03','2025-04-06');
Select * FROM loan_applications;
--> Average processing time
SELECT AVG(DATEDIFF(DAY,Submission_Date,Decision_Date)) AS average_processing_time FROM loan_applications;
-->Application Funnel drop
SELECT COUNT(*) AS rejected_count FROM loan_applications WHERE status ='Rejected';
