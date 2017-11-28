USE [NhaHang]
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblRoom]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblRoom]
(
	@ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblRoom] WHERE (([ID] = @ID))
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblRoomType]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblRoomType]
(
	@ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblRoomType] WHERE (([ID] = @ID))
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblRoomType]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblRoomType]
(
	@ID int OUTPUT,
	@Name nvarchar(50),
	@AccountID int,
	@CreateDate datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblRoomType] ([Name], [AccountID], [CreateDate]) VALUES (@Name, @AccountID, @CreateDate);
	
SELECT @ID = SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertSP_tblRoom]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertSP_tblRoom]
(
	@ID int OUTPUT,
	@Name nvarchar(50),
	@Images nvarchar(50),
	@About nvarchar(1000),
	@Type int,
	@AccountID int,
	@CreateDate datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblRoom] ([Name], [Images], [About], [Type], [AccountID], [CreateDate]) VALUES (@Name, @Images, @About, @Type, @AccountID, @CreateDate);
	
SELECT @ID = SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblRoom]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblRoom]
AS
	SET NOCOUNT ON;
SELECT        tblRoom.*
FROM            tblRoom
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblRoomType]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblRoomType]
AS
	SET NOCOUNT ON;
SELECT        tblRoomType.*
FROM            tblRoomType
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblRoom]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblRoom]
(
	@ID int,
	@Name nvarchar(50),
	@Images nvarchar(50),
	@About nvarchar(1000),
	@Type int
	
)
AS
	SET NOCOUNT OFF;
UPDATE [tblRoom] SET [Name] = @Name, [Images] = @Images, [About] = @About, [Type] = @Type 
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblRoomType]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblRoomType]
(@ID int,
	@Name nvarchar(50)
)
AS
	SET NOCOUNT OFF;
UPDATE [tblRoomType] SET [Name] = @Name WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1
GO
