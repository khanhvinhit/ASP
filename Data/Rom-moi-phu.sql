USE [NhaHang]
GO
/****** Object:  StoredProcedure [dbo].[Get_AccountType_By_ID]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_AccountType_By_ID] 
	(@ID int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tblAccountType] WHERE [ID]=@ID
END


GO
/****** Object:  StoredProcedure [dbo].[Get_All_By_OrderID]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_By_OrderID]
	(@ID int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tblOrderDeails] WHERE [OrderID]=@ID
END



GO
/****** Object:  StoredProcedure [dbo].[SP_Category_Single]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Category_Single] 
	(@ID int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].tblCategory WHERE [ID]=@ID
END





GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblAbout]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblAccount]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblAccountType]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblAccountType]
(
	@Original_ID int,
	@IsNull_Name Int,
	@Original_Name nvarchar(50)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblAccountType] WHERE (([ID] = @Original_ID) AND ((@IsNull_Name = 1 AND [Name] IS NULL) OR ([Name] = @Original_Name)))

GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblCategory]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblCategory]
(
	@ID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblCategory] 
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1









GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblOrder]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblOrder]
(
	@Original_ID int,
	@IsNull_TotalPrice Int,
	@Original_TotalPrice decimal(18, 0),
	@IsNull_Quantity Int,
	@Original_Quantity int,
	@IsNull_AccountID Int,
	@Original_AccountID int,
	@IsNull_CreateDate Int,
	@Original_CreateDate datetime
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblOrder] WHERE (([ID] = @Original_ID) AND ((@IsNull_TotalPrice = 1 AND [TotalPrice] IS NULL) OR ([TotalPrice] = @Original_TotalPrice)) AND ((@IsNull_Quantity = 1 AND [Quantity] IS NULL) OR ([Quantity] = @Original_Quantity)) AND ((@IsNull_AccountID = 1 AND [AccountID] IS NULL) OR ([AccountID] = @Original_AccountID)) AND ((@IsNull_CreateDate = 1 AND [CreateDate] IS NULL) OR ([CreateDate] = @Original_CreateDate)))



GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblOrderDeails]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Delete_tblOrderDeails]
(
	@Original_ID int,
	@IsNull_OrderID Int,
	@Original_OrderID int,
	@IsNull_ProductID Int,
	@Original_ProductID int,
	@IsNull_Quantity Int,
	@Original_Quantity int,
	@IsNull_Price Int,
	@Original_Price decimal(18, 0)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [tblOrderDeails] WHERE (([ID] = @Original_ID) AND ((@IsNull_OrderID = 1 AND [OrderID] IS NULL) OR ([OrderID] = @Original_OrderID)) AND ((@IsNull_ProductID = 1 AND [ProductID] IS NULL) OR ([ProductID] = @Original_ProductID)) AND ((@IsNull_Quantity = 1 AND [Quantity] IS NULL) OR ([Quantity] = @Original_Quantity)) AND ((@IsNull_Price = 1 AND [Price] IS NULL) OR ([Price] = @Original_Price)))



GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblProduct]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblRoom]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Delete_tblRoomType]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblAbout]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblAccount]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblAccountType]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblAccountType]
(
	@Name nvarchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblAccountType] ([Name]) VALUES (@Name);
	
SELECT ID, Name FROM tblAccountType WHERE (ID = SCOPE_IDENTITY())

GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblCategory]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblCategory]
(
	@ID [int] OUTPUT,
	@Name nvarchar(50),
	@Image nvarchar(50),
	@CreateDate datetime,
	@AccountID int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblCategory] ([Name],[Image], [CreateDate], [AccountID]) VALUES (@Name,@Image, @CreateDate, @AccountID);
	
SELECT @ID = SCOPE_IDENTITY();








GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblOrder]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblOrder]
(
	@ID int OUTPUT,
	@TotalPrice decimal(18, 0),
	@Quantity int,
	@AccountID int,
	@CreateDate datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblOrder] ([TotalPrice], [Quantity], [AccountID], [CreateDate]) VALUES (@TotalPrice, @Quantity, @AccountID, @CreateDate);
	
SELECT @ID = SCOPE_IDENTITY();



GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblOrderDeails]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_tblOrderDeails]
(
	@ID int OUTPUT,
	@OrderID int,
	@ProductID int,
	@Quantity int,
	@Price decimal(18, 0)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblOrderDeails] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (@OrderID, @ProductID, @Quantity, @Price);
	
SELECT @ID = SCOPE_IDENTITY();



GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblProduct]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
	@QuantityOrder int,
	@CreateDate datetime,
	@AccountID int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblProduct] ([Name], [CategoryID], [Images], [Price], [Discount], [Contents],[QuantityOrder], [CreateDate], [AccountID]) VALUES (@Name, @CategoryID, @Images, @Price, @Discount, @Contents,@QuantityOrder, @CreateDate, @AccountID);
	
SELECT @ID = SCOPE_IDENTITY();









GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_tblRoomType]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_InsertSP_tblRoom]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_NameByID_tblCategory]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_NameByID_tblCategory]
	@id int
AS
	SELECT Name from tblCategory where @id=ID
RETURN 0









GO
/****** Object:  StoredProcedure [dbo].[SP_NewCreate_Products]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NewCreate_Products]

AS
	SELECT top 6 * from tblProduct order by CreateDate
RETURN 0








GO
/****** Object:  StoredProcedure [dbo].[SP_ProductByCategoryID_tblProduct]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ProductByCategoryID_tblProduct]
	@ID int
AS
	SELECT * from tblProduct where @ID=CategoryID
RETURN 0








GO
/****** Object:  StoredProcedure [dbo].[SP_Room_Single]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Room_Single]
	(@ID int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        ro.ID, ro.Name,ro.Images,ro.About,rt.Name as [TypeName],ro.AccountID,ro.CreateDate
FROM            tblRoom ro, tblRoomType rt
WHERE ro.ID = @ID and ro.Type = rt.ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblAbout]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Select_tblAccount]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblAccount]
AS
	SET NOCOUNT ON;
SELECT        ac.ID,ac.Email,ac.Password,at.Name as [TypeName], ac.Name,ac.Avatar ,ac.Address,ac.Phone,ac.Status
FROM            tblAccount ac , tblAccountType at
WHERE at.ID = ac.TypeID

GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblAccount_By_Email]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblAccount_By_Email] 
	(@Email nchar(200))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].tblAccount WHERE [Email] = @Email
END








GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblAccountType]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblAccountType]
AS
	SET NOCOUNT ON;
SELECT        tblAccountType.*
FROM            tblAccountType

GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblCategory]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Select_tblOrder]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblOrder]
AS
	SET NOCOUNT ON;
SELECT        tblOrder.*
FROM            tblOrder



GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblOrderDeails]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblOrderDeails]
AS
	SET NOCOUNT ON;
SELECT        tblOrderDeails.*
FROM            tblOrderDeails



GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblProduct]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Select_tblRoom]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Select_tblRoom]
AS
	SET NOCOUNT ON;
SELECT        ro.ID, ro.Name,ro.Images,ro.About,rt.Name as [TypeName],ro.AccountID,ro.CreateDate
FROM            tblRoom ro, tblRoomType rt
WHERE ro.Type = rt.ID
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_tblRoomType]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TopHot_Product]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TopHot_Product]

AS
	SELECT top 6 * from tblProduct order by QuantityOrder desc
RETURN 0







GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblAbout]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblAbout]
(@ID int,
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
UPDATE [tblAbout] SET [URLMap] = @URLMap, [Name] = @Name, [Address] = @Address, [Email] = @Email, [Phone1] = @Phone1, [Phone2] = @Phone2, [Contents] = @Contents, [AccountID] = @AccountID, [CreateDate] = @CreateDate 
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1








GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblAccount]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Update_tblAccountType]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblAccountType]
(
	@Name nvarchar(50),
	@Original_ID int,
	@IsNull_Name Int,
	@Original_Name nvarchar(50),
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblAccountType] SET [Name] = @Name WHERE (([ID] = @Original_ID) AND ((@IsNull_Name = 1 AND [Name] IS NULL) OR ([Name] = @Original_Name)));
	
SELECT ID, Name FROM tblAccountType WHERE (ID = @ID)

GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblCategory]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblCategory]
(
	@ID int,
	@Name nvarchar(50),
	@Image nvarchar(50)
)
AS
	SET NOCOUNT OFF;
UPDATE [tblCategory] SET [Name] = @Name,[Image]=@Image WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1








GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblOrder]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblOrder]
(
	@ID int,
	@TotalPrice decimal(18, 0),
	@Quantity int,
	@AccountID int,
	@CreateDate datetime
	
	
)
AS
	SET NOCOUNT OFF;
UPDATE [tblOrder] SET [TotalPrice] = @TotalPrice, [Quantity] = @Quantity, [AccountID] = @AccountID, [CreateDate] = @CreateDate
	
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1



GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblOrderDeails]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_tblOrderDeails]
(
	@ID int,
	@OrderID int,
	@ProductID int,
	@Quantity int,
	@Price decimal(18, 0)
	
	
)
AS
	SET NOCOUNT OFF;
UPDATE [tblOrderDeails] SET [OrderID] = @OrderID, [ProductID] = @ProductID, [Quantity] = @Quantity, [Price] = @Price
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1



GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblProduct]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
	@QuantityOrder int,
	@CreateDate datetime,
	@AccountID int,
	@Original_ID int,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [tblProduct] SET [Name] = @Name, [CategoryID] = @CategoryID, [Images] = @Images, [Price] = @Price, [Discount] = @Discount, [Contents] = @Contents,[QuantityOrder]=@QuantityOrder, [CreateDate] = @CreateDate, [AccountID] = @AccountID
	
WHERE 
	([ID] = @ID)
	IF @@ERROR <> 0
	RETURN 0
	ELSE
	RETURN 1









GO
/****** Object:  StoredProcedure [dbo].[SP_Update_tblRoom]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Update_tblRoomType]    Script Date: 11/28/2017 15:54:00 CHIỀU ******/
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
