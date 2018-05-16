USE [master]
GO
/****** Object:  Database [EC.DB]    Script Date: 16.05.2018 23:37:28 ******/
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
USE [EC.DB]
GO
/****** Object:  User [adminEC]    Script Date: 16.05.2018 23:37:28 ******/
CREATE USER [adminEC] FOR LOGIN [adminEC] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [adminEC]
GO
/****** Object:  Table [dbo].[diagnoses]    Script Date: 16.05.2018 23:37:28 ******/
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
/****** Object:  Table [dbo].[doctors]    Script Date: 16.05.2018 23:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctors](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](20) NOT NULL,
	[middle_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[post_id] [int] NOT NULL,
 CONSTRAINT [PK_doctors] PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctors_phones]    Script Date: 16.05.2018 23:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctors_phones](
	[phone_id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [int] NOT NULL,
	[phone_number] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_doctors_phones_1] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drugs]    Script Date: 16.05.2018 23:37:28 ******/
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
/****** Object:  Table [dbo].[grugs_lists]    Script Date: 16.05.2018 23:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grugs_lists](
	[record_id] [int] NOT NULL,
	[drug_id] [int] NOT NULL,
	[administration_mode] [nvarchar](300) NOT NULL,
	[treatment_duration] [int] NOT NULL,
 CONSTRAINT [PK_grugs_lists] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC,
	[drug_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medical_procedures]    Script Date: 16.05.2018 23:37:29 ******/
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
/****** Object:  Table [dbo].[medical_records]    Script Date: 16.05.2018 23:37:29 ******/
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
/****** Object:  Table [dbo].[patients]    Script Date: 16.05.2018 23:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients](
	[patient_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](20) NOT NULL,
	[middle_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[birthdate] [date] NOT NULL,
	[workplace] [nvarchar](100) NULL,
 CONSTRAINT [PK_patients] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patients_phones]    Script Date: 16.05.2018 23:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients_phones](
	[phone_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NOT NULL,
	[phone_number] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_patients_phones_1] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 16.05.2018 23:37:29 ******/
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
/****** Object:  Table [dbo].[procedures_lists]    Script Date: 16.05.2018 23:37:29 ******/
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
/****** Object:  Table [dbo].[sick_leaves]    Script Date: 16.05.2018 23:37:29 ******/
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
ALTER TABLE [dbo].[doctors]  WITH CHECK ADD  CONSTRAINT [FK_doctors_posts] FOREIGN KEY([post_id])
REFERENCES [dbo].[posts] ([post_id])
GO
ALTER TABLE [dbo].[doctors] CHECK CONSTRAINT [FK_doctors_posts]
GO
ALTER TABLE [dbo].[doctors_phones]  WITH CHECK ADD  CONSTRAINT [FK_doctors_phones_doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctors] ([doctor_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[doctors_phones] CHECK CONSTRAINT [FK_doctors_phones_doctors]
GO
ALTER TABLE [dbo].[grugs_lists]  WITH CHECK ADD  CONSTRAINT [FK_grugs_lists_drugs] FOREIGN KEY([drug_id])
REFERENCES [dbo].[drugs] ([drug_id])
GO
ALTER TABLE [dbo].[grugs_lists] CHECK CONSTRAINT [FK_grugs_lists_drugs]
GO
ALTER TABLE [dbo].[grugs_lists]  WITH CHECK ADD  CONSTRAINT [FK_grugs_lists_medical_records] FOREIGN KEY([record_id])
REFERENCES [dbo].[medical_records] ([record_id])
GO
ALTER TABLE [dbo].[grugs_lists] CHECK CONSTRAINT [FK_grugs_lists_medical_records]
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_diagnoses] FOREIGN KEY([diagnosis_id])
REFERENCES [dbo].[diagnoses] ([diagnosis_id])
GO
ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_diagnoses]
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_doctors]
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_patients] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([patient_id])
GO
ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_patients]
GO
ALTER TABLE [dbo].[medical_records]  WITH CHECK ADD  CONSTRAINT [FK_medical_records_sick_leaves] FOREIGN KEY([sick_leave_id])
REFERENCES [dbo].[sick_leaves] ([sick_leave_id])
GO
ALTER TABLE [dbo].[medical_records] CHECK CONSTRAINT [FK_medical_records_sick_leaves]
GO
ALTER TABLE [dbo].[patients_phones]  WITH CHECK ADD  CONSTRAINT [FK_patients_phones_patients] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[patients_phones] CHECK CONSTRAINT [FK_patients_phones_patients]
GO
ALTER TABLE [dbo].[procedures_lists]  WITH CHECK ADD  CONSTRAINT [FK_procedures_lists_medical_procedures] FOREIGN KEY([procedure_id])
REFERENCES [dbo].[medical_procedures] ([procedure_id])
GO
ALTER TABLE [dbo].[procedures_lists] CHECK CONSTRAINT [FK_procedures_lists_medical_procedures]
GO
ALTER TABLE [dbo].[procedures_lists]  WITH CHECK ADD  CONSTRAINT [FK_procedures_lists_medical_records] FOREIGN KEY([record_id])
REFERENCES [dbo].[medical_records] ([record_id])
GO
ALTER TABLE [dbo].[procedures_lists] CHECK CONSTRAINT [FK_procedures_lists_medical_records]
GO
/****** Object:  StoredProcedure [dbo].[GetAllPatients]    Script Date: 16.05.2018 23:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPatients]
AS
BEGIN
SELECT patient_id, first_name, middle_name, last_name, birthdate, workplace
FROM dbo.patients
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordById]    Script Date: 16.05.2018 23:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordById]
@rec_id int
AS
BEGIN
SELECT dbo.medical_records.record_id, dbo.medical_records.record_date, dbo.patients.first_name, dbo.patients.middle_name, dbo.patients.last_name, dbo.diagnoses.diagnosis_name, dbo.sick_leaves.sick_leave_id, 
       dbo.sick_leaves.issued, dbo.sick_leaves.valid_from, dbo.sick_leaves.valid_to, dbo.doctors.first_name AS doctors_first_name, dbo.doctors.last_name AS doctors_last_name, dbo.posts.post_name
FROM dbo.medical_records INNER JOIN
     dbo.patients ON dbo.medical_records.patient_id = dbo.patients.patient_id INNER JOIN
     dbo.doctors ON dbo.medical_records.doctor_id = dbo.doctors.doctor_id INNER JOIN
     dbo.diagnoses ON dbo.medical_records.diagnosis_id = dbo.diagnoses.diagnosis_id INNER JOIN
     dbo.sick_leaves ON dbo.medical_records.sick_leave_id = dbo.sick_leaves.sick_leave_id INNER JOIN
     dbo.posts ON dbo.doctors.post_id = dbo.posts.post_id
WHERE dbo.medical_records.record_id = @rec_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordByPatientIdAndDate]    Script Date: 16.05.2018 23:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordByPatientIdAndDate]
@patient_id int,
@date date
AS
BEGIN
SELECT dbo.medical_records.record_id, dbo.medical_records.record_date, dbo.patients.first_name, dbo.patients.middle_name, dbo.patients.last_name, dbo.diagnoses.diagnosis_name, dbo.sick_leaves.sick_leave_id, 
       dbo.sick_leaves.issued, dbo.sick_leaves.valid_from, dbo.sick_leaves.valid_to, dbo.doctors.first_name AS doctors_first_name, dbo.doctors.last_name AS doctors_last_name, dbo.posts.post_name, 
       dbo.patients.patient_id
FROM dbo.medical_records INNER JOIN
     dbo.patients ON dbo.medical_records.patient_id = dbo.patients.patient_id INNER JOIN
     dbo.doctors ON dbo.medical_records.doctor_id = dbo.doctors.doctor_id INNER JOIN
     dbo.diagnoses ON dbo.medical_records.diagnosis_id = dbo.diagnoses.diagnosis_id INNER JOIN
     dbo.sick_leaves ON dbo.medical_records.sick_leave_id = dbo.sick_leaves.sick_leave_id INNER JOIN
     dbo.posts ON dbo.doctors.post_id = dbo.posts.post_id
WHERE dbo.patients.patient_id = @patient_id AND dbo.medical_records.record_date = @date
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordDatesByPatientId]    Script Date: 16.05.2018 23:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecordDatesByPatientId]
@patient_id int
AS
BEGIN
SELECT dbo.medical_records.record_date, dbo.medical_records.record_id
FROM dbo.medical_records
WHERE dbo.medical_records.patient_id = @patient_id
END
GO
USE [master]
GO
ALTER DATABASE [EC.DB] SET  READ_WRITE 
GO
