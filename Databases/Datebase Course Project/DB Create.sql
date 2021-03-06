USE [master]
GO
CREATE DATABASE [SimpleStudentSystem]
 CONTAINMENT = NONE
GO

USE [SimpleStudentSystem]

CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
))
GO

CREATE TABLE [dbo].[Faculties](
	[FacultyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
))

CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(110000,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UniversityId] [int] NOT NULL,
	[FacultyId] [int] NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
))
GO

CREATE TABLE [dbo].[Students_Courses](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Students_Courses] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC
))

CREATE TABLE [dbo].[Universities](
	[UniversityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Universities] PRIMARY KEY CLUSTERED 
(
	[UniversityId] ASC
))
GO

ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([FacultyId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Faculties]
GO

ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Universities] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[Universities] ([UniversityId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Universities]
GO

ALTER TABLE [dbo].[Students_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Students_Courses_Courses1] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Students_Courses] CHECK CONSTRAINT [FK_Students_Courses_Courses1]
GO

ALTER TABLE [dbo].[Students_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Students_Courses_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Students_Courses] CHECK CONSTRAINT [FK_Students_Courses_Students]
GO

