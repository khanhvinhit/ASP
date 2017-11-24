USE [NhaHang]
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblAbout]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblAbout]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblAbout] 
WHERE 
	([ID] = @Original_ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblAccount]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblAccount]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblAccount] 
WHERE 
	([ID] = @Original_ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblCategory]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblCategory]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblCategory] 
WHERE 
	([ID] = @Original_ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1

GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblProduct]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblProduct]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblProduct] 
WHERE 
	([ID] = @Original_ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblAbout]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblAbout]
(
	@ID [int] OUTPUT,
	@URLMap nvarchar(500),
	@Name nvarchar(200),
	@Address nvarchar(200),
	@Email nchar(200),
	@Phone1 nchar(15),
	@Phone2 nchar(15),
	@Contents ntext,
	@AccountID int,
	@CreateDate datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblAbout] ([URLMap], [Name], [Address], [Email], [Phone1], [Phone2], [Contents], [AccountID], [CreateDate]) VALUES (@URLMap, @Name, @Address, @Email, @Phone1, @Phone2, @Contents, @AccountID, @CreateDate);
	
	
SELECT @ID = SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblAccount]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblAccount]
(
	@ID [int] OUTPUT,
	@Email nchar(200),
	@Password nchar(50),
	@Type int,
	@Name nvarchar(200),
	@Avatar nvarchar(100),
	@Address nvarchar(200),
	@Phone char(15),
	@Status bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblAccount] ([Email], [Password], [Type], [Name], [Avatar], [Address], [Phone], [Status]) VALUES (@Email, @Password, @Type, @Name, @Avatar, @Address, @Phone, @Status);
	
SELECT @ID = SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblCategory]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblCategory]
(
	@ID [int] OUTPUT,
	@Name nvarchar(50),
	@CreateDate datetime,
	@AccountID int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblCategory] ([Name], [CreateDate], [AccountID]) VALUES (@Name, @CreateDate, @AccountID);
	
SELECT @ID = SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblProduct]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblProduct]
(
@ID [int] OUTPUT,
	@Name nvarchar(200),
	@CategoryID int,
	@Images nvarchar(100),
	@Price decimal(18, 0),
	@Discount decimal(18, 0),
	@Contents nvarchar(1000),
	@CreateDate datetime,
	@AccountID int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblProduct] ([Name], [CategoryID], [Images], [Price], [Discount], [Contents], [CreateDate], [AccountID]) VALUES (@Name, @CategoryID, @Images, @Price, @Discount, @Contents, @CreateDate, @AccountID);
	
SELECT @ID = SCOPE_IDENTITY();

GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_Login]
@Email nvarchar(50),
@Password nvarchar(150)
AS
BEGIN
	DECLARE @OutPut int
	DECLARE @KiemTraEmail int
	DECLARE @KiemTraPassword int
	DECLARE @TrangThai int
	SELECT @KiemTraEmail=isnull(Count(tdn.Email),0)
		FROM tblAccount tdn
		WHERE tdn.Email=@Email
	SELECT @TrangThai =isnull(tdn.Status ,0)
		FROM tblAccount tdn
		WHERE tdn.Email = @Email
	IF @KiemTraEmail=0
		SET @OutPut=1 -- Sai Email
	ELSE
	BEGIN
		SELECT @KiemTraPassword =isnull(count(*),0)
			FROM tblAccount tdn
		WHERE tdn.Email=@Email
			AND tdn.Password=@Password
		IF @KiemTraPassword=0
			SET @OutPut=2 -- Sai mật khẩu
		ELSE
			BEGIN
			   IF @TrangThai=0
				SET @OutPut=4 -- Phải đổi mật khẩu
			   ELSE
				BEGIN
				   IF @TrangThai=2
				-- Email đang bị khóa
				   SET @OutPut=3
				   ELSE
					SET @OutPut=0
				END
			END
	END
	SELECT @OutPut AS KetQua
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblAbout]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblAbout]
AS
	SET NOCOUNT ON;
SELECT        tblAbout.*
FROM            tblAbout
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblAccount]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblAccount]
AS
	SET NOCOUNT ON;
SELECT        tblAccount.*
FROM            tblAccount
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblCategory]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblCategory]
AS
	SET NOCOUNT ON;
SELECT        tblCategory.*
FROM            tblCategory

GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblProduct]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblProduct]
AS
	SET NOCOUNT ON;
SELECT        tblProduct.*
FROM            tblProduct


GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblAbout]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblAbout]
(
	@URLMap nvarchar(500),
	@Name nvarchar(200),
	@Address nvarchar(200),
	@Email nchar(200),
	@Phone1 nchar(15),
	@Phone2 nchar(15),
	@Contents ntext,
	@AccountID int,
	@CreateDate datetime,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblAbout] SET [URLMap] = @URLMap, [Name] = @Name, [Address] = @Address, [Email] = @Email, [Phone1] = @Phone1, [Phone2] = @Phone2, [Contents] = @Contents, [AccountID] = @AccountID, [CreateDate] = @CreateDate 
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblAccount]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblAccount]
(
	@Email nchar(200),
	@Password nchar(50),
	@Type int,
	@Name nvarchar(200),
	@Avatar nvarchar(100),
	@Address nvarchar(200),
	@Phone char(15),
	@Status bit,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblAccount] SET [Email] = @Email, [Password] = @Password, [Type] = @Type, [Name] = @Name, [Avatar] = @Avatar, [Address] = @Address, [Phone] = @Phone, [Status] = @Status 
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblCategory]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblCategory]
(
	@Name nvarchar(50),
	@CreateDate datetime,
	@AccountID int,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblCategory] SET [Name] = @Name, [CreateDate] = @CreateDate, [AccountID] = @AccountID WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblProduct]    Script Date: 11/24/2017 1:55:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblProduct]
(
	@Name nvarchar(200),
	@CategoryID int,
	@Images nvarchar(100),
	@Price decimal(18, 0),
	@Discount decimal(18, 0),
	@Contents nvarchar(1000),
	@CreateDate datetime,
	@AccountID int,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblProduct] SET [Name] = @Name, [CategoryID] = @CategoryID, [Images] = @Images, [Price] = @Price, [Discount] = @Discount, [Contents] = @Contents, [CreateDate] = @CreateDate, [AccountID] = @AccountID
	
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1

GO
