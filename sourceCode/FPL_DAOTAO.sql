USE [master]
GO
/****** Object:  Database [FPL_DaoTao]    Script Date: 07/08/2023 10:45:05 AM ******/
CREATE DATABASE [FPL_DaoTao]

GO
ALTER DATABASE [FPL_DaoTao] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPL_DaoTao].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPL_DaoTao] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPL_DaoTao] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPL_DaoTao] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FPL_DaoTao] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPL_DaoTao] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET RECOVERY FULL 
GO
ALTER DATABASE [FPL_DaoTao] SET  MULTI_USER 
GO
ALTER DATABASE [FPL_DaoTao] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPL_DaoTao] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPL_DaoTao] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPL_DaoTao] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPL_DaoTao] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPL_DaoTao] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FPL_DaoTao', N'ON'
GO
ALTER DATABASE [FPL_DaoTao] SET QUERY_STORE = ON
GO
ALTER DATABASE [FPL_DaoTao] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FPL_DaoTao]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 07/08/2023 10:45:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[masv] [char](7) NULL,
	[tienganh] [float] NULL,
	[tinhoc] [float] NULL,
	[gdtc] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 07/08/2023 10:45:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[masv] [char](7) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[email] [varchar](100) NULL,
	[sdt] [int] NULL,
	[gioitinh] [nchar](3) NULL,
	[diachi] [nvarchar](50) NULL,
	[hinhanh] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[masv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 07/08/2023 10:45:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[role] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [fk_grade_students] FOREIGN KEY([masv])
REFERENCES [dbo].[students] ([masv])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [fk_grade_students]
GO
USE [master]
GO
ALTER DATABASE [FPL_DaoTao] SET  READ_WRITE 
GO
