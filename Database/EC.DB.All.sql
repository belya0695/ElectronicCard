USE [master]
GO

/****** Object:  Database [EC.DB]    Script Date: 27.05.2018 17:36:15 ******/
CREATE DATABASE [EC.DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N' EC.DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ EC.DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N' EC.DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ EC.DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [EC.DB] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EC.DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [EC.DB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [EC.DB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [EC.DB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [EC.DB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [EC.DB] SET ARITHABORT OFF 
GO

ALTER DATABASE [EC.DB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [EC.DB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [EC.DB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [EC.DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [EC.DB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [EC.DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [EC.DB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [EC.DB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [EC.DB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [EC.DB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [EC.DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [EC.DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [EC.DB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [EC.DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [EC.DB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [EC.DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [EC.DB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [EC.DB] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [EC.DB] SET  MULTI_USER 
GO

ALTER DATABASE [EC.DB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [EC.DB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [EC.DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [EC.DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [EC.DB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [EC.DB] SET QUERY_STORE = OFF
GO

USE [EC.DB]
GO

ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [EC.DB] SET  READ_WRITE 
GO

USE [EC.DB]
GO
/****** Object:  User [adminEC]    Script Date: 12.06.2018 16:06:51 ******/
CREATE USER [adminEC] FOR LOGIN [adminEC] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [adminEC]
GO
/****** Object:  Table [dbo].[diagnoses]    Script Date: 12.06.2018 16:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnoses](
	[diagnosis_id] [int] IDENTITY(1,1) NOT NULL,
	[diagnosis_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_diagnosis] PRIMARY KEY CLUSTERED 
(
	[diagnosis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drugs]    Script Date: 12.06.2018 16:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drugs](
	[drug_id] [int] IDENTITY(1,1) NOT NULL,
	[drug_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_drugs] PRIMARY KEY CLUSTERED 
(
	[drug_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drugs_lists]    Script Date: 12.06.2018 16:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drugs_lists](
	[record_id] [int] NOT NULL,
	[drug_id] [int] NOT NULL,
	[administration_mode] [nvarchar](300) NOT NULL,
	[treatment_duration] [int] NOT NULL,
 CONSTRAINT [PK_drugs_lists] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC,
	[drug_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logins]    Script Date: 12.06.2018 16:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logins](
	[login] [nvarchar](20) NOT NULL,
	[pass] [nvarchar](20) NOT NULL,
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_logins] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medical_procedures]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medical_procedures](
	[procedure_id] [int] IDENTITY(1,1) NOT NULL,
	[procedure_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_medical_procedure] PRIMARY KEY CLUSTERED 
(
	[procedure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medical_records]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medical_records](
	[record_id] [int] IDENTITY(1,1) NOT NULL,
	[record_date] [date] NOT NULL,
	[patient_id] [int] NOT NULL,
	[diagnosis_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[sick_leave_id] [int] NOT NULL,
 CONSTRAINT [PK_medical_records] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[procedures_lists]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procedures_lists](
	[record_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL,
	[administration_mode] [nvarchar](300) NOT NULL,
	[treatment_duration] [int] NOT NULL,
 CONSTRAINT [PK_procedures_lists] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC,
	[procedure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sick_leaves]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sick_leaves](
	[sick_leave_id] [int] IDENTITY(1,1) NOT NULL,
	[issued] [bit] NOT NULL,
	[valid_from] [date] NULL,
	[valid_to] [date] NULL,
 CONSTRAINT [PK_seak_leaves] PRIMARY KEY CLUSTERED 
(
	[sick_leave_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](40) NOT NULL,
	[middle_name] [nvarchar](40) NOT NULL,
	[last_name] [nvarchar](40) NOT NULL,
	[post_id] [int] NULL,
	[birthdate] [date] NOT NULL,
	[workplace] [nvarchar](100) NULL,
	[email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_doctors] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_phones]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_phones](
	[phone_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[phone_number] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_doctors_phones_1] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[drugs_lists]  WITH CHECK ADD  CONSTRAINT [FK_grugs_lists_drugs] FOREIGN KEY([drug_id])
REFERENCES [dbo].[drugs] ([drug_id])
GO
ALTER TABLE [dbo].[drugs_lists] CHECK CONSTRAINT [FK_grugs_lists_drugs]
GO
ALTER TABLE [dbo].[drugs_lists]  WITH CHECK ADD  CONSTRAINT [FK_grugs_lists_medical_records] FOREIGN KEY([record_id])
REFERENCES [dbo].[medical_records] ([record_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[drugs_lists] CHECK CONSTRAINT [FK_grugs_lists_medical_records]
GO
ALTER TABLE [dbo].[logins]  WITH CHECK ADD  CONSTRAINT [FK_logins_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[logins] CHECK CONSTRAINT [FK_logins_roles]
GO
ALTER TABLE [dbo].[logins]  WITH CHECK ADD  CONSTRAINT [FK_logins_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[logins] CHECK CONSTRAINT [FK_logins_users]
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_diagnoses] FOREIGN KEY([diagnosis_id])
REFERENCES [dbo].[diagnoses] ([diagnosis_id])
GO
ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_diagnoses]
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_sick_leaves] FOREIGN KEY([sick_leave_id])
REFERENCES [dbo].[sick_leaves] ([sick_leave_id])
GO
ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_sick_leaves]
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_users] FOREIGN KEY([patient_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_users]
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_users1] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_users1]
GO
ALTER TABLE [dbo].[procedures_lists]  WITH CHECK ADD  CONSTRAINT [FK_procedures_lists_medical_procedures] FOREIGN KEY([procedure_id])
REFERENCES [dbo].[medical_procedures] ([procedure_id])
GO
ALTER TABLE [dbo].[procedures_lists] CHECK CONSTRAINT [FK_procedures_lists_medical_procedures]
GO
ALTER TABLE [dbo].[procedures_lists]  WITH CHECK ADD  CONSTRAINT [FK_procedures_lists_medical_records] FOREIGN KEY([record_id])
REFERENCES [dbo].[medical_records] ([record_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[procedures_lists] CHECK CONSTRAINT [FK_procedures_lists_medical_records]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_doctors_posts] FOREIGN KEY([post_id])
REFERENCES [dbo].[posts] ([post_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_doctors_posts]
GO
ALTER TABLE [dbo].[users_phones]  WITH CHECK ADD  CONSTRAINT [FK_users_phones_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_phones] CHECK CONSTRAINT [FK_users_phones_users]
GO
/****** Object:  StoredProcedure [dbo].[AddDiagnosis]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDiagnosis]
@diag_name nvarchar(100)
AS
BEGIN
INSERT INTO dbo.diagnoses
VALUES(@diag_name)
END
GO
/****** Object:  StoredProcedure [dbo].[AddDrug]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDrug]
@drug_name nvarchar(100)
AS
BEGIN
INSERT INTO dbo.drugs
VALUES(@drug_name)
END
GO
/****** Object:  StoredProcedure [dbo].[AddDrugToDrugList]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDrugToDrugList]
@record_id int,
@drug_id int,
@mode nvarchar(300),
@duration int
AS
BEGIN
INSERT INTO dbo.drugs_lists
VALUES(@record_id, @drug_id, @mode, @duration)
END
GO
/****** Object:  StoredProcedure [dbo].[AddLogin]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLogin]
@login nvarchar(20),
@pass nvarchar(20),
@user_id int,
@role_id int
AS
BEGIN
INSERT INTO dbo.logins
VALUES(@login ,@pass, @user_id, @role_id)
END
GO
/****** Object:  StoredProcedure [dbo].[AddMedProcedure]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMedProcedure]
@proc_name nvarchar(100)
AS
BEGIN
INSERT INTO dbo.medical_procedures
VALUES(@proc_name)
END
GO
/****** Object:  StoredProcedure [dbo].[AddMedRecordAndSickLeave]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMedRecordAndSickLeave]
@patient_id int,
@diagnosis_id int,
@doctor_id int
AS
BEGIN
INSERT INTO dbo.sick_leaves
VALUES(0, NULL, NULL)
INSERT INTO dbo.medical_records
VALUES(GETDATE() ,@patient_id, @diagnosis_id, @doctor_id, @@IDENTITY)
END
GO
/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPost]
@post_name nvarchar(100)
AS
BEGIN
INSERT INTO dbo.posts
VALUES(@post_name)
END
GO
/****** Object:  StoredProcedure [dbo].[AddProcedureToProcedureList]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProcedureToProcedureList]
@record_id int,
@proc_id int,
@mode nvarchar(300),
@duration int
AS
BEGIN
INSERT INTO dbo.procedures_lists
VALUES(@record_id, @proc_id, @mode, @duration)
END
GO
/****** Object:  StoredProcedure [dbo].[AddUserPhone]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUserPhone]
@user_id int,
@phone nvarchar(20)
AS
BEGIN
INSERT INTO dbo.users_phones
VALUES(@user_id, @phone)
END
GO
/****** Object:  StoredProcedure [dbo].[AddUserWithLoginAndPhone]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUserWithLoginAndPhone]
@first_name nvarchar(40),
@middle_name nvarchar(40),
@last_name nvarchar(40),
@post_id int,
@birthdate date,
@workplace nvarchar(100),
@email nvarchar(100),
@phone nvarchar(20),
@login nvarchar(20),
@pass nvarchar(20),
@role_id int
AS
BEGIN
INSERT INTO dbo.users
VALUES(@first_name, @middle_name, @last_name, @post_id, @birthdate, @workplace, @email)
DECLARE @user_id int = @@IDENTITY

INSERT INTO dbo.users_phones
VALUES(@user_id, @phone)

INSERT INTO dbo.logins
VALUES(@login, @pass, @user_id, @role_id)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDiagnosis]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDiagnosis]
@diag_id int
AS
BEGIN
DELETE FROM [dbo].[diagnoses]
      WHERE diagnosis_id = @diag_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDrug]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDrug]
@drug_id int
AS
BEGIN
DELETE FROM [dbo].drugs
      WHERE drug_id = @drug_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDrugFromDrugList]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDrugFromDrugList]
@record_id int,
@drug_id int
AS
BEGIN
DELETE FROM [dbo].drugs_lists
      WHERE record_id = @record_id AND drug_id = @drug_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteLogin]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteLogin]
@login nvarchar(20)
AS
BEGIN
DELETE FROM [dbo].logins
      WHERE login = @login
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMedProcedure]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMedProcedure]
@proc_id int
AS
BEGIN
DELETE FROM [dbo].medical_procedures
      WHERE procedure_id = @proc_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMedRecordAndSickLeave]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMedRecordAndSickLeave]
@record_id int
AS
BEGIN
DECLARE @leave_id int
SELECT @leave_id  =  sick_leave_id FROM [dbo].medical_records WHERE record_id = @record_id
DELETE FROM [dbo].medical_records
      WHERE record_id = @record_id
DELETE FROM dbo.sick_leaves
	  WHERE sick_leave_id = @leave_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePost]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePost]
@post_id int
AS
BEGIN
DELETE FROM [dbo].posts
      WHERE post_id = @post_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProcedureFromProcedureList]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProcedureFromProcedureList]
@record_id int,
@proc_id int
AS
BEGIN
DELETE FROM [dbo].procedures_lists
      WHERE record_id = @record_id AND procedure_id = @proc_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSickLeave]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSickLeave]
@leave_id int
AS
BEGIN
DELETE FROM [dbo].sick_leaves
      WHERE sick_leave_id = @leave_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserAndHisPhones]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUserAndHisPhones]
@user_id int
AS
BEGIN
DELETE FROM [dbo].users
      WHERE user_id = @user_id
DELETE FROM [dbo].users_phones
      WHERE user_id = @user_id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserPhone]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUserPhone]
@phone_id int
AS
BEGIN
DELETE FROM [dbo].users_phones
      WHERE phone_id = @phone_id  
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllDiagnoses]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllDiagnoses]
AS
BEGIN
SELECT *
FROM dbo.diagnoses
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllDrugs]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllDrugs]
AS
BEGIN
SELECT *
FROM dbo.drugs
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPatients]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPatients]
@doctor_id int
AS
BEGIN
SELECT dbo.users.[user_id], first_name, middle_name, last_name, birthdate
FROM dbo.users INNER JOIN dbo.medical_records ON dbo.users.user_id = dbo.medical_records.patient_id
WHERE dbo.medical_records.doctor_id = @doctor_id
GROUP BY dbo.users.[user_id], first_name, middle_name, last_name, birthdate
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPosts]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPosts]
AS
BEGIN
SELECT *
FROM dbo.posts
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProcedures]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProcedures]
AS
BEGIN
SELECT *
FROM dbo.medical_procedures
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllRoles]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRoles]
AS
BEGIN
SELECT *
FROM dbo.roles
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
SELECT *, posts.post_name, logins.login
FROM dbo.users INNER JOIN posts ON dbo.users.post_id = posts.post_id INNER JOIN logins ON users.user_id = logins.user_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetDiagnosisById]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDiagnosisById]
@diag_id int
AS
BEGIN
SELECT *
FROM diagnoses
WHERE diagnoses.diagnosis_id = @diag_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetDrugById]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDrugById]
@drug_id int
AS
BEGIN
SELECT *
FROM drugs
WHERE drugs.drug_id = @drug_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetDrugsListsByRecordId]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDrugsListsByRecordId]
@record_id int
AS
BEGIN
SELECT *, dbo.drugs.drug_name
FROM dbo.drugs_lists INNER JOIN dbo.drugs ON dbo.drugs_lists.drug_id = dbo.drugs.drug_id
WHERE dbo.drugs_lists.record_id = @record_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetPostById]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPostById]
@post_id int
AS
BEGIN
SELECT *
FROM posts
WHERE posts.post_id = @post_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetProcedureById]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProcedureById]
@proc_id int
AS
BEGIN
SELECT *
FROM medical_procedures
WHERE medical_procedures.procedure_id = @proc_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetProceduresListsByRecordId]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProceduresListsByRecordId]
@record_id int
AS
BEGIN
SELECT *, dbo.medical_procedures.procedure_name
FROM dbo.procedures_lists INNER JOIN dbo.medical_procedures ON dbo.procedures_lists.procedure_id = dbo.medical_procedures.procedure_id
WHERE dbo.procedures_lists.record_id = @record_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordById]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordById]
@rec_id int
AS
BEGIN
SELECT dbo.medical_records.record_id, dbo.medical_records.record_date, patients.first_name, patients.middle_name, patients.last_name, dbo.diagnoses.diagnosis_name, dbo.sick_leaves.sick_leave_id, 
       dbo.sick_leaves.issued, dbo.sick_leaves.valid_from, dbo.sick_leaves.valid_to, doctors.first_name AS doctors_first_name, doctors.last_name AS doctors_last_name, dbo.posts.post_name, 
	   patients.[user_id]
FROM dbo.medical_records INNER JOIN
     dbo.users AS patients ON dbo.medical_records.patient_id = patients.[user_id] INNER JOIN
     dbo.users AS doctors ON dbo.medical_records.doctor_id = doctors.[user_id] INNER JOIN
     dbo.diagnoses ON dbo.medical_records.diagnosis_id = dbo.diagnoses.diagnosis_id INNER JOIN
     dbo.sick_leaves ON dbo.medical_records.sick_leave_id = dbo.sick_leaves.sick_leave_id INNER JOIN
     dbo.posts ON doctors.post_id = dbo.posts.post_id
WHERE dbo.medical_records.record_id = @rec_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordByPatientIdAndDate]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordByPatientIdAndDate]
@patient_id int,
@date date
AS
BEGIN
SELECT dbo.medical_records.record_id, dbo.medical_records.record_date, patients.first_name, patients.middle_name, patients.last_name, dbo.diagnoses.diagnosis_name, dbo.sick_leaves.sick_leave_id, 
       dbo.sick_leaves.issued, dbo.sick_leaves.valid_from, dbo.sick_leaves.valid_to, doctors.first_name AS doctors_first_name, doctors.last_name AS doctors_last_name, dbo.posts.post_name,
       patients.[user_id]
FROM dbo.medical_records INNER JOIN
     dbo.users AS patients ON dbo.medical_records.patient_id = patients.[user_id] INNER JOIN
     dbo.users AS doctors ON dbo.medical_records.doctor_id = doctors.[user_id] INNER JOIN
     dbo.diagnoses ON dbo.medical_records.diagnosis_id = dbo.diagnoses.diagnosis_id INNER JOIN
     dbo.sick_leaves ON dbo.medical_records.sick_leave_id = dbo.sick_leaves.sick_leave_id INNER JOIN
     dbo.posts ON doctors.post_id = dbo.posts.post_id
WHERE dbo.medical_records.patient_id = @patient_id AND dbo.medical_records.record_date = @date
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordByPatientIdAndDiagnosis]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordByPatientIdAndDiagnosis]
@patient_id int,
@diagnosis nvarchar(40)
AS
BEGIN
SELECT dbo.medical_records.record_id, dbo.medical_records.record_date, patients.first_name, patients.middle_name, patients.last_name, dbo.diagnoses.diagnosis_name, dbo.sick_leaves.sick_leave_id, 
       dbo.sick_leaves.issued, dbo.sick_leaves.valid_from, dbo.sick_leaves.valid_to, doctors.first_name AS doctors_first_name, doctors.last_name AS doctors_last_name, dbo.posts.post_name,
       patients.[user_id]
FROM dbo.medical_records INNER JOIN
     dbo.users AS patients ON dbo.medical_records.patient_id = patients.[user_id] INNER JOIN
     dbo.users AS doctors ON dbo.medical_records.doctor_id = doctors.[user_id] INNER JOIN
     dbo.diagnoses ON dbo.medical_records.diagnosis_id = dbo.diagnoses.diagnosis_id INNER JOIN
     dbo.sick_leaves ON dbo.medical_records.sick_leave_id = dbo.sick_leaves.sick_leave_id INNER JOIN
     dbo.posts ON doctors.post_id = dbo.posts.post_id
WHERE dbo.medical_records.patient_id = @patient_id AND dbo.diagnoses.diagnosis_name = @diagnosis
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordByPatientIdAndDoctorsPost]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordByPatientIdAndDoctorsPost]
@patient_id int,
@post_name nvarchar(40)
AS
BEGIN
SELECT dbo.medical_records.record_id, dbo.medical_records.record_date, patients.first_name, patients.middle_name, patients.last_name, dbo.diagnoses.diagnosis_name, dbo.sick_leaves.sick_leave_id, 
       dbo.sick_leaves.issued, dbo.sick_leaves.valid_from, dbo.sick_leaves.valid_to, doctors.first_name AS doctors_first_name, doctors.last_name AS doctors_last_name, dbo.posts.post_name,
       patients.[user_id]
FROM dbo.medical_records INNER JOIN
     dbo.users AS patients ON dbo.medical_records.patient_id = patients.[user_id] INNER JOIN
     dbo.users AS doctors ON dbo.medical_records.doctor_id = doctors.[user_id] INNER JOIN
     dbo.diagnoses ON dbo.medical_records.diagnosis_id = dbo.diagnoses.diagnosis_id INNER JOIN
     dbo.sick_leaves ON dbo.medical_records.sick_leave_id = dbo.sick_leaves.sick_leave_id INNER JOIN
     dbo.posts ON doctors.post_id = dbo.posts.post_id
WHERE dbo.medical_records.patient_id = @patient_id AND dbo.posts.post_name = @post_name
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordDatesByPatientId]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordDatesByPatientId]
@patient_id int
AS
BEGIN
SELECT dbo.medical_records.record_date
FROM dbo.medical_records
WHERE dbo.medical_records.patient_id = @patient_id
GROUP BY dbo.medical_records.record_date
END
GO
/****** Object:  StoredProcedure [dbo].[GetRolesById]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRolesById]
@user_id int
AS
BEGIN
SELECT dbo.roles.role_id, dbo.roles.role_name
FROM dbo.roles INNER JOIN dbo.logins ON dbo.roles.role_id = dbo.logins.role_id
WHERE dbo.logins.user_id = @user_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByLogin]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByLogin]
@user_login nvarchar(40)
AS
BEGIN
SELECT dbo.users.user_id, dbo.users.first_name, dbo.users.middle_name, dbo.users.last_name, dbo.users.post_id, dbo.users.birthdate, 
dbo.users.workplace, dbo.users.email, dbo.posts.post_id, dbo.posts.post_name, dbo.logins.login, dbo.logins.pass, dbo.roles.role_name
FROM dbo.users INNER JOIN
     dbo.users_phones ON dbo.users.user_id = dbo.users_phones.user_id LEFT JOIN
     dbo.posts ON dbo.users.post_id = dbo.posts.post_id INNER JOIN
     dbo.logins ON dbo.users.user_id = dbo.logins.user_id INNER JOIN
     dbo.roles ON dbo.logins.role_id = dbo.roles.role_id
WHERE dbo.logins.login = @user_login
GROUP BY dbo.users.user_id, dbo.users.first_name, dbo.users.middle_name, dbo.users.last_name, dbo.users.post_id, dbo.users.birthdate, 
dbo.users.workplace, dbo.users.email, dbo.posts.post_id, dbo.posts.post_name, dbo.logins.login, dbo.logins.pass, dbo.roles.role_name
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserPhonesByUserId]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserPhonesByUserId]
@userId int
AS
BEGIN
SELECT *
FROM dbo.users_phones
WHERE dbo.users_phones.user_id = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDiagnosis]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDiagnosis]
@diag_id int,
@diag_name nvarchar(150)
AS
BEGIN
UPDATE [dbo].diagnoses
   SET diagnosis_name = @diag_name
   WHERE diagnosis_id = @diag_id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDrug]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDrug]
@drug_id int,
@drug_name nvarchar(100)
AS
BEGIN
UPDATE [dbo].[drugs]
   SET [drug_name] = @drug_name
   WHERE drug_id = @drug_id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDrugList]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDrugList]
@record_id int,
@drug_id int,
@mode nvarchar(300), 
@duration int 
AS
BEGIN
UPDATE [dbo].drugs_lists
   SET administration_mode = @mode,
   treatment_duration = @duration
   WHERE record_id = @record_id AND drug_id = @drug_id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMedProcedure]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMedProcedure]
@proc_id int,
@proc_name nvarchar(100)
AS
BEGIN
UPDATE [dbo].medical_procedures
   SET procedure_name = @proc_name
   WHERE procedure_id = @proc_id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePost]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePost]
@post_id int,
@post_name nvarchar(100)
AS
BEGIN
UPDATE [dbo].posts
   SET post_name = @post_name
   WHERE post_id = @post_id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProcedureList]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProcedureList]
@record_id int,
@proc_id int,
@mode nvarchar(300), 
@duration int 
AS
BEGIN
UPDATE [dbo].procedures_lists
   SET administration_mode = @mode,
   treatment_duration = @duration
   WHERE record_id = @record_id AND procedure_id = @proc_id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSickLeave]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSickLeave]
@leave_id int,
@issued bit,
@from date, 
@to date
AS
BEGIN
UPDATE [dbo].sick_leaves
   SET issued = @issued,
   valid_from = @from,
   valid_to = @to
   WHERE sick_leave_id = @leave_id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
@user_id int,
@first_name nvarchar(40),
@middle_name nvarchar(40),
@last_name nvarchar(40),
@post_id int,
@birthdate date,
@workplace nvarchar(100),
@email nvarchar(100)
AS
BEGIN
UPDATE [dbo].users
   SET first_name = @first_name,
   middle_name = @middle_name,
   last_name = @last_name,
   post_id = @post_id,
   birthdate = @birthdate,
   workplace = @workplace,
   email = @email
   WHERE user_id = @user_id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserPhone]    Script Date: 12.06.2018 16:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserPhone]
@phone_id int,
@phone nvarchar(20)

AS
BEGIN
UPDATE [dbo].users_phones
   SET phone_number = @phone
   WHERE phone_id = @phone_id
END
GO

insert into [EC.DB].dbo.posts (post_name)
values ('Lorem'), ('Nullam'), ('Morbi'), ('Class'), ('Aenean'), ('Nostra'), ('Cras'), ('Bibendum'), ('Ante')

insert into [EC.DB].dbo.drugs (drug_name)
values ('Ipsum'), ('Vulputate'), ('Porttitor'), ('Facilisis'), ('Molestie'), ('Commodo'), ('Aptent'), ('Inceptos'), ('Rhoncus')

insert into [EC.DB].dbo.medical_procedures (procedure_name)
values ('Sociosqu'), ('Elementum'), ('lectus'), ('metus'), ('sem')

INSERT INTO [EC.DB].dbo.diagnoses (diagnosis_name)
values ('Pellentesque'), ('ullamcorper'), ('semper'), ('consectetur'), ('Donec'), ('non')

insert into [EC.DB].dbo.roles (role_name)
values ('admin'), ('editor'), ('doctor'), ('patient')

INSERT INTO [dbo].[users]([first_name],[middle_name],[last_name],[post_id],[birthdate],[email])
VALUES ('Jarrod','Moon','Adam',5,'19/01/1954','tempus.risus.Donec@litoratorquent.ca'),('Yuli','Nash','Tiger',3,'13/04/1967','Vestibulum.ut@volutpatNulla.edu'),('Meredith','Shaffer','Lamar',9,'11/11/1969','mus.Aenean.eget@enim.ca'),('Reed','Gross','John',5,'07/01/1976','risus.Duis@diam.ca'),('Keefe','Craig','Forrest',5,'21/04/1965','venenatis.a@nislMaecenas.com'),
('Admin','Admin','Admin',5,'19/01/1954','Admin@admin.ca'),
('Editor','Editor','Editor',3,'13/04/1967','Editor@editor.ed')
INSERT INTO [dbo].[users]([first_name],[middle_name],[last_name],[post_id],[birthdate],[email],[workplace])
VALUES ('Zelenia','Morris','Addison',2,'02/03/1982','lectus.quis@cursus.co.uk','Nulla Limited'),('Allistair','Moore','Vincent',2,'18/06/1976','et.netus@ipsumCurabitur.ca','Ut Nec Inc.'),('Paki','Cox','Daniel',2,'13/08/1953','non.sapien@Sedmalesuada.net','Nostra Per Associates'),('Amaya','Page','Felix',2,'14/01/1969','magnis.dis.parturient@vitae.ca','Pharetra Inc.'),('Raven','Shaw','Zeus',2,'03/04/1980','Vivamus.rhoncus@eu.edu','Nisi Institute')


INSERT INTO [dbo].[logins]([login],[pass],[user_id],[role_id])
VALUES ('doc1', '0000', 1, 3),('doc2', '0000', 2, 3),('doc3', '0000', 3, 3),('doc4', '0000', 4, 3),('doc5', '0000', 5, 3),
('admin1', '0000', 6, 1),
('editor1', '0000', 7, 2),
('pat1', '0000', 8, 4),('pat2', '0000', 9, 4),('pat3', '0000', 10, 4),('pat4', '0000', 11, 4),('pat5', '0000', 12, 4)

INSERT INTO [dbo].[users_phones]([user_id],[phone_number])
VALUES (1,'3696727484'),(2,'1717972601'),(3,'8041816590'),(4,'1437291720'),(5,'3719706085'),(6,'8747398222'),(7,'5753427985'),(8,'5289436892'),(9,'8691923251'),(10,'3371912293'),(11,'8679460343'),(12,'6157386900')

INSERT INTO [EC.DB].dbo.sick_leaves (issued, valid_from, valid_to)
values(1,'06/05/2018','12/05/2018'),(1,'06/05/2018','11/05/2018'),(1,'03/05/2018','11/05/2018'),(1,'01/05/2018','07/05/2018'),(1,'05/05/2018','12/05/2018'),(1,'12/05/2018','16/05/2018'),(1,'14/05/2018','15/05/2018'),(1,'27/05/2018','30/05/2018')

INSERT INTO [EC.DB].dbo.medical_records (record_date, patient_id, diagnosis_id, doctor_id, sick_leave_id)
values ('05/05/2018',8,1,1,1),('04/05/2018',9,2,2,2),('04/05/2018',10,3,3,3),('03/05/2018',11,4,4,4),('01/05/2018',12,5,5,5),
('12/05/2018',8,6,1,6),('14/05/2018',8,1,1,7),('27/05/2018',8,1,1,8)

INSERT INTO [EC.DB].dbo.drugs_lists (record_id, drug_id, administration_mode, treatment_duration)
values (1,1,'in lobortis tellus justo sit',27),(1,2,'vitae velit egestas lacinia.',15),(3,3,'lobortis mauris. Suspendisse aliquet molestie',19),
(4,4,'sit amet ante. Vivamus',28),(5,5,'est. Nunc laoreet lectus quis massa.',19),
(6,6,'sit amet ante. Vivamus non',3),(7,9,'elit sed consequat auctor,',5),(8,9,'Aenean euismod mauris eu',1)

INSERT INTO [EC.DB].dbo.procedures_lists (record_id, procedure_id, administration_mode, treatment_duration)
values (1,1,'sit amet, dapibus id,',9),(2,2,'natoque penatibus et magnis dis',8),(3,3,'Nam interdum enim non',8),
(4,4,'velit. Aliquam nisl. Nulla eu',7),(5,5,'rhoncus. Proin nisl',6),
(6,1,'enim. Nunc ut erat. Sed nunc',14),(7,2,'tempor arcu. Vestibulum ut eros',6),(8,1,'risus. Donec egestas. Duis ac arcu.',14)