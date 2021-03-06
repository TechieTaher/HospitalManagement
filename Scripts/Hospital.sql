USE [master]
GO
/****** Object:  Database [HospitalDb]    Script Date: 3/26/2020 8:32:04 PM ******/
CREATE DATABASE [HospitalDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HospitalDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HospitalDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HospitalDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalDb] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalDb] SET QUERY_STORE = OFF
GO
USE [HospitalDb]
GO
/****** Object:  Table [dbo].[Admits]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admits](
	[AdmitId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[BedId] [int] NOT NULL,
	[StartDate] [datetimeoffset](7) NOT NULL,
	[EndDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Admits] PRIMARY KEY CLUSTERED 
(
	[AdmitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjectName]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjectName](
	[ApplicationObjectNameId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectName] [varchar](50) NOT NULL,
	[ApplicationObjectTypeId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjectName] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjectType]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjectType](
	[ApplicationObjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_ApplicationObjectType] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[ProblemId] [int] NULL,
	[DateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beds]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beds](
	[BedId] [int] IDENTITY(1,1) NOT NULL,
	[BedNo] [int] NOT NULL,
	[RoomNo] [int] NOT NULL,
 CONSTRAINT [PK_Beds] PRIMARY KEY CLUSTERED 
(
	[BedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NULL,
	[Speciality] [varchar](50) NULL,
	[JobType] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NULL,
	[PhoneNo] [bigint] NULL,
	[EmployeeType] [int] NOT NULL,
	[ShiftStartTime] [time](7) NULL,
	[ShiftEndTime] [time](7) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[MedicineId] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [varchar](50) NULL,
	[Dose] [int] NOT NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nursings]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nursings](
	[Nursingid] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Nursings] PRIMARY KEY CLUSTERED 
(
	[Nursingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[PhoneNo] [bigint] NOT NULL,
	[Address] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presciptions]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presciptions](
	[PrescriptionId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Presciptions] PRIMARY KEY CLUSTERED 
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescribeMedicines]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescribeMedicines](
	[PrescribeMedicineId] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
 CONSTRAINT [PK_PrescribeMedicine] PRIMARY KEY CLUSTERED 
(
	[PrescribeMedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problems]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problems](
	[ProblemId] [int] IDENTITY(1,1) NOT NULL,
	[ProblemType] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[Symptoms] [varchar](200) NULL,
 CONSTRAINT [PK_Probelms] PRIMARY KEY CLUSTERED 
(
	[ProblemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TreatMents]    Script Date: 3/26/2020 8:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreatMents](
	[TreatmentId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NULL,
	[DoctorId] [int] NOT NULL,
	[TreatmentType] [int] NULL,
 CONSTRAINT [PK_TreatMents] PRIMARY KEY CLUSTERED 
(
	[TreatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admits]  WITH CHECK ADD  CONSTRAINT [FK_Admits_Beds] FOREIGN KEY([BedId])
REFERENCES [dbo].[Beds] ([BedId])
GO
ALTER TABLE [dbo].[Admits] CHECK CONSTRAINT [FK_Admits_Beds]
GO
ALTER TABLE [dbo].[Admits]  WITH CHECK ADD  CONSTRAINT [FK_Admits_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Admits] CHECK CONSTRAINT [FK_Admits_Departments]
GO
ALTER TABLE [dbo].[Admits]  WITH CHECK ADD  CONSTRAINT [FK_Admits_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Admits] CHECK CONSTRAINT [FK_Admits_Doctors]
GO
ALTER TABLE [dbo].[Admits]  WITH CHECK ADD  CONSTRAINT [FK_Admits_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Admits] CHECK CONSTRAINT [FK_Admits_Patients]
GO
ALTER TABLE [dbo].[ApplicationObjectName]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationObjectName_ApplicationObjectType] FOREIGN KEY([ApplicationObjectTypeId])
REFERENCES [dbo].[ApplicationObjectType] ([ApplicationObjectTypeId])
GO
ALTER TABLE [dbo].[ApplicationObjectName] CHECK CONSTRAINT [FK_ApplicationObjectName_ApplicationObjectType]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Doctors]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Patients]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Problems] FOREIGN KEY([ProblemId])
REFERENCES [dbo].[Problems] ([ProblemId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Problems]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_ApplicationObjectName] FOREIGN KEY([JobType])
REFERENCES [dbo].[ApplicationObjectName] ([ApplicationObjectNameId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_ApplicationObjectName]
GO
ALTER TABLE [dbo].[Nursings]  WITH CHECK ADD  CONSTRAINT [FK_Nursings_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Nursings] CHECK CONSTRAINT [FK_Nursings_Employees]
GO
ALTER TABLE [dbo].[Nursings]  WITH CHECK ADD  CONSTRAINT [FK_Nursings_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Nursings] CHECK CONSTRAINT [FK_Nursings_Patients]
GO
ALTER TABLE [dbo].[Presciptions]  WITH CHECK ADD  CONSTRAINT [FK_Presciptions_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Presciptions] CHECK CONSTRAINT [FK_Presciptions_Doctors]
GO
ALTER TABLE [dbo].[Presciptions]  WITH CHECK ADD  CONSTRAINT [FK_Presciptions_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Presciptions] CHECK CONSTRAINT [FK_Presciptions_Patients]
GO
ALTER TABLE [dbo].[PrescribeMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PrescribeMedicines_Medicines] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([MedicineId])
GO
ALTER TABLE [dbo].[PrescribeMedicines] CHECK CONSTRAINT [FK_PrescribeMedicines_Medicines]
GO
ALTER TABLE [dbo].[PrescribeMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PrescribeMedicines_Presciptions] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[Presciptions] ([PrescriptionId])
GO
ALTER TABLE [dbo].[PrescribeMedicines] CHECK CONSTRAINT [FK_PrescribeMedicines_Presciptions]
GO
ALTER TABLE [dbo].[TreatMents]  WITH CHECK ADD  CONSTRAINT [FK_TreatMents_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[TreatMents] CHECK CONSTRAINT [FK_TreatMents_Doctors]
GO
ALTER TABLE [dbo].[TreatMents]  WITH CHECK ADD  CONSTRAINT [FK_TreatMents_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[TreatMents] CHECK CONSTRAINT [FK_TreatMents_Patients]
GO
USE [master]
GO
ALTER DATABASE [HospitalDb] SET  READ_WRITE 
GO
