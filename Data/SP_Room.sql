USE [NhaHang]
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblRoom]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblRoom]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblRoom] WHERE (([ID] = @Original_ID))
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblRoomType]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblRoomType]
(
	@Original_ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblRoomType] WHERE (([ID] = @Original_ID))
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblRoomType]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblRoomType]
(
	@Name nvarchar(50),
	@AccountID int,
	@CreateDate datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblRoomType] ([Name], [AccountID], [CreateDate]) VALUES (@Name, @AccountID, @CreateDate);
	
SELECT ID, Name, AccountID, CreateDate FROM tblRoomType WHERE (ID = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertSP_tblRoom]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertSP_tblRoom]
(
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
	
SELECT ID, Name, Images, About, Type, AccountID, CreateDate FROM tblRoom WHERE (ID = SCOPE_IDENTITY())
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
	@Name nvarchar(50),
	@Images nvarchar(50),
	@About nvarchar(1000),
	@Type int,
	@AccountID int,
	@CreateDate datetime,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblRoom] SET [Name] = @Name, [Images] = @Images, [About] = @About, [Type] = @Type, [AccountID] = @AccountID, [CreateDate] = @CreateDate WHERE (([ID] = @Original_ID));
	
SELECT ID, Name, Images, About, Type, AccountID, CreateDate FROM tblRoom WHERE (ID = @ID)
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblRoomType]    Script Date: 11/26/2017 14:01:24 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblRoomType]
(
	@Name nvarchar(50),
	@AccountID int,
	@CreateDate datetime,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblRoomType] SET [Name] = @Name, [AccountID] = @AccountID, [CreateDate] = @CreateDate WHERE (([ID] = @Original_ID));
	
SELECT ID, Name, AccountID, CreateDate FROM tblRoomType WHERE (ID = @ID)
GO
