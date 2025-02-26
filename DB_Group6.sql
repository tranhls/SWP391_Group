USE [SWP391_2]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[isAdmin] [int] NULL,
	[isSeller] [int] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accountID_tracker]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountID_tracker](
	[last_accountID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[totalAmount] [decimal](18, 2) NULL,
	[accountID] [int] NULL,
	[totalQuantity] [int] NULL,
 CONSTRAINT [PK_cart1] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[catID] [int] NOT NULL,
	[category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[address] [nvarchar](max) NULL,
	[accountID] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedBack]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedBack](
	[feedBackID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NULL,
	[orderID] [int] NULL,
	[rating] [int] NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_feedBack] PRIMARY KEY CLUSTERED 
(
	[feedBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NULL,
	[orderDate] [datetime] NULL,
	[totalAmount] [decimal](18, 2) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[orderDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantiy] [int] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_orderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[paymentMethod] [nvarchar](50) NULL,
	[totalPrice] [decimal](18, 2) NULL,
	[cartID] [int] NULL,
 CONSTRAINT [PK_payment1] PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](18, 2) NULL,
	[category] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[catID] [int] NULL,
	[SellID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[code] [varchar](255) NOT NULL,
	[percent] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (1, N'g6-se1822', N'12345678', 1, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (2, N'g6', N'12345678', 0, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (3, N'tranh', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (4, N'hoang', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (5, N'lam', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (6, N'se1822', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (7, N'swp', N'12345678', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (8, N'swp391', N'12345678', 0, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (9, N'trung anh', N'12345678', 0, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (10, N'loc', N'12345678', 0, 1)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (11, N'locdz', N'duclocdl03', 0, 0)
INSERT [dbo].[account] ([accountID], [user], [pass], [isAdmin], [isSeller]) VALUES (12, N'ducloc', N'12345678', 0, 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
INSERT [dbo].[accountID_tracker] ([last_accountID]) VALUES (12)
GO
INSERT [dbo].[category] ([catID], [category]) VALUES (1, N'Cafe')
INSERT [dbo].[category] ([catID], [category]) VALUES (2, N'Nước giải khát')
INSERT [dbo].[category] ([catID], [category]) VALUES (3, N'Trà')
INSERT [dbo].[category] ([catID], [category]) VALUES (4, N'Sinh tố')
INSERT [dbo].[category] ([catID], [category]) VALUES (5, N'Kem')
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (1, N'Nguyên Văn AAA', N'team6@gmail.com', N'012345678', N'FPT-U', 1)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (2, N'AAA', N'ABC@gmail.com', N'0654789123', N'tại quầy', 2)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (3, N'Nguyễn Thị B', N'nguyenthib@gmail.com', N'0987654321', N'123 Đường ABC', 3)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (4, N'Lê Văn C', N'levanc@gmail.com', N'0123456789', N'456 Đường XYZ', 4)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (5, N'Trần Thị D', N'tranthid@gmail.com', N'0934567890', N'789 Đường MNO', 5)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (6, N'Phạm Văn E', N'phamvane@gmail.com', N'0901234567', N'321 Đường DEF', 6)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (7, N'Hoàng Thị F', N'thif@gmail.com', N'0912345678', N'Đường GHI', 7)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (8, N'Nguyên Văn A', N'a@gmail.com', N'0912345678', N'654 Đường GHI', 8)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (9, N'Nguyên Văn A', N'b@gmail.com', N'0912345678', N'654 Đường GHI', 9)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (10, N'Bùi Đức Lộc', N'lochahadz@gmail.com', N'0912345678', N'654 Đường GHI', 10)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (11, N'Bùi Đức Lôc', N'buiducloc2003@gmail.com', N'0986486843', N'Lang Chánh - Thanh Hóa', 11)
INSERT [dbo].[customer] ([customerID], [name], [email], [phone], [address], [accountID]) VALUES (12, N'Nguyên Văn A', N'c@gmail.com', N'0912345678', N'654 Đường GHI', 12)
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[feedBack] ON 

INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (1, 1, NULL, 5, N'haha')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (2, 2, NULL, 4, N'hehe')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (3, 3, NULL, 4, N'hihi')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (4, 11, NULL, 4, N'ngon qua')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (5, 11, NULL, 5, N'rat tot')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (6, 11, NULL, 5, N'kkkkkkkkk')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (7, 11, NULL, 5, N'nakroth')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (8, 1, NULL, 4, N'yasuo')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (9, 11, NULL, 4, N'lee sin')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (10, 11, NULL, 4, N'zed')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (11, 11, NULL, 5, N'hahahaha')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (12, 11, NULL, 4, N'cua hang rat tot')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (13, 11, NULL, 4, N'ngon')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (14, 11, NULL, 4, N'duoc')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (15, 11, NULL, 4, N'kakaka')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (16, 11, NULL, 4, N'mmmmmmm')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (17, 11, NULL, 5, N'aaaaa')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (18, 11, NULL, 5, N'promax')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (19, 11, NULL, 5, N'solokill')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (20, 11, NULL, 4, N'dep trai')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (21, 11, NULL, 5, N'ngon ne')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (22, 11, NULL, 5, N'qua sieu')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (23, 11, NULL, 5, N'kakakakaka')
INSERT [dbo].[feedBack] ([feedBackID], [customerID], [orderID], [rating], [comments]) VALUES (24, 11, NULL, 4, N'ngon')
SET IDENTITY_INSERT [dbo].[feedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (1, 1, CAST(N'2024-06-15T09:30:00.000' AS DateTime), CAST(70000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (2, 2, CAST(N'2024-06-16T10:30:00.000' AS DateTime), CAST(35000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (3, 3, CAST(N'2024-06-15T11:30:00.000' AS DateTime), CAST(50000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (4, 4, CAST(N'2024-06-16T02:20:00.000' AS DateTime), CAST(45000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (5, 5, CAST(N'2024-07-15T12:30:00.000' AS DateTime), CAST(60000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (6, 6, CAST(N'2024-07-15T01:30:00.000' AS DateTime), CAST(65000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (7, 7, CAST(N'2024-07-15T05:30:00.000' AS DateTime), CAST(40000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (11, 11, CAST(N'2024-06-16T16:10:56.377' AS DateTime), CAST(258500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (12, 11, CAST(N'2024-06-16T16:11:28.223' AS DateTime), CAST(247500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (13, 11, CAST(N'2024-06-16T16:12:28.260' AS DateTime), CAST(66000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (14, 11, CAST(N'2024-06-19T09:21:36.993' AS DateTime), CAST(199100.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (15, 11, CAST(N'2024-06-19T09:24:04.770' AS DateTime), CAST(38500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (16, 11, CAST(N'2024-06-19T09:25:41.797' AS DateTime), CAST(38500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (17, 11, CAST(N'2024-07-09T11:09:12.330' AS DateTime), CAST(93500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (18, 11, CAST(N'2024-07-09T11:19:41.370' AS DateTime), CAST(96800.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (19, 11, CAST(N'2024-07-12T15:26:53.957' AS DateTime), CAST(38500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (20, 11, CAST(N'2024-07-12T15:30:53.127' AS DateTime), CAST(44000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (21, 11, CAST(N'2024-07-12T16:24:02.407' AS DateTime), CAST(66000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (22, 11, CAST(N'2024-07-12T16:26:19.947' AS DateTime), CAST(52800.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (23, 11, CAST(N'2024-07-12T16:27:21.740' AS DateTime), CAST(66000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (24, 11, CAST(N'2024-07-16T22:05:43.520' AS DateTime), CAST(52800.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (25, 11, CAST(N'2024-07-16T22:06:43.747' AS DateTime), CAST(115500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (26, 11, CAST(N'2024-07-16T22:07:41.057' AS DateTime), CAST(44000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (27, 11, CAST(N'2024-07-17T00:47:35.747' AS DateTime), CAST(93500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (28, 11, CAST(N'2024-07-17T00:49:52.557' AS DateTime), CAST(44000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (29, 11, CAST(N'2024-07-17T00:51:42.837' AS DateTime), CAST(88000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (31, 11, CAST(N'2024-07-19T00:42:57.300' AS DateTime), CAST(38500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (37, 11, CAST(N'2024-07-19T09:48:11.080' AS DateTime), CAST(107800.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (38, 11, CAST(N'2024-07-19T09:49:05.663' AS DateTime), CAST(22000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (39, 1, CAST(N'2024-07-19T09:57:15.213' AS DateTime), CAST(73040.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (40, 11, CAST(N'2024-07-19T10:54:03.730' AS DateTime), CAST(63250.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (41, 11, CAST(N'2024-07-19T10:55:37.013' AS DateTime), CAST(16500.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (42, 11, CAST(N'2024-07-19T11:02:04.160' AS DateTime), CAST(26400.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (43, 11, CAST(N'2024-07-19T11:06:09.410' AS DateTime), CAST(26400.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (44, 11, CAST(N'2024-07-19T11:59:52.900' AS DateTime), CAST(90750.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (45, 11, CAST(N'2024-07-20T00:56:49.977' AS DateTime), CAST(52800.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (46, 11, CAST(N'2024-07-20T10:18:44.170' AS DateTime), CAST(44000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (47, 11, CAST(N'2024-07-20T10:24:16.580' AS DateTime), CAST(52800.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (48, 11, CAST(N'2024-07-20T10:37:50.917' AS DateTime), CAST(52800.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (49, 11, CAST(N'2024-07-20T10:39:25.910' AS DateTime), CAST(22000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (50, 11, CAST(N'2024-07-20T10:54:27.810' AS DateTime), CAST(33000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (51, 11, CAST(N'2024-07-20T10:58:29.983' AS DateTime), CAST(22000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (52, 11, CAST(N'2024-07-20T10:59:23.183' AS DateTime), CAST(55000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (53, 11, CAST(N'2024-07-20T11:03:07.083' AS DateTime), CAST(26400.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (54, 11, CAST(N'2024-07-20T11:04:12.047' AS DateTime), CAST(66000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (55, 11, CAST(N'2024-07-20T11:10:38.820' AS DateTime), CAST(26400.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (56, 11, CAST(N'2024-07-20T11:11:18.313' AS DateTime), CAST(55000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (57, 11, CAST(N'2024-07-20T11:11:58.900' AS DateTime), CAST(35200.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (58, 11, CAST(N'2024-07-20T11:13:06.840' AS DateTime), CAST(44000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (59, 11, CAST(N'2024-07-20T11:36:25.487' AS DateTime), CAST(26400.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (60, 11, CAST(N'2024-07-20T11:43:05.277' AS DateTime), CAST(33000.00 AS Decimal(18, 2)), N'Completed')
INSERT [dbo].[order] ([orderID], [customerID], [orderDate], [totalAmount], [status]) VALUES (61, 11, CAST(N'2024-07-20T11:43:50.740' AS DateTime), CAST(44000.00 AS Decimal(18, 2)), N'Completed')
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetail] ON 

INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (9, 11, 6, 3, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (10, 11, 13, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (11, 11, 12, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (12, 12, 13, 5, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (13, 13, 5, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (14, 14, 4, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (15, 14, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (16, 14, 1, 2, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (17, 15, 2, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (18, 16, 2, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (19, 17, 2, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (20, 17, 6, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (21, 18, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (22, 18, 7, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (23, 19, 2, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (24, 20, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (25, 21, 3, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (26, 22, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (27, 23, 3, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (28, 24, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (29, 25, 5, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (30, 25, 4, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (31, 26, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (32, 27, 2, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (33, 27, 6, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (34, 28, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (35, 29, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (36, 29, 7, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (39, 31, 2, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (40, 31, 6, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (41, 31, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (42, 31, 2, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (43, 31, 4, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (44, 31, 3, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (45, 37, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (46, 37, 6, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (47, 38, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (48, 39, 2, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (49, 39, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (50, 40, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (51, 40, 8, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (52, 41, 19, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (53, 42, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (54, 43, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (55, 44, 5, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (56, 44, 4, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (57, 44, 3, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (58, 45, 5, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (59, 46, 6, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (60, 47, 5, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (61, 48, 5, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (62, 49, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (63, 50, 3, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (64, 51, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (65, 52, 6, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (66, 53, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (67, 54, 5, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (68, 55, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (69, 56, 6, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (70, 57, 7, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (71, 58, 9, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (72, 59, 1, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (73, 60, 5, 1, NULL)
INSERT [dbo].[orderDetail] ([orderDetail_ID], [orderID], [productID], [quantiy], [image]) VALUES (74, 61, 9, 1, NULL)
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (1, N'Trà Xanh Espresso Marble', N'ngọt', CAST(48000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/1696220139_tra-xanh-espresso-marble_26a0eb92bfd649508d0e93173e9b3083.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (2, N'Cafe Đen Đá', N'đắng', CAST(35000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/1639377797_ca-phe-den-da_6f4766ec0f8b4e929a8d916ae3c13254_large.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (3, N'Americano', N'đắng', CAST(60000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/classic-cold-brew_791256_d4d8388a3d724f879845680c0239ff68.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (4, N'Cafe Sữa Nóng', N'ngọt', CAST(45000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/1639377770_cfsua-nong_9a47f58888e7444a9979e0d117d49ad3_large.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (5, N'Cappuccino Nóng', N'ngọt và đắng', CAST(60000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/cappuccino_621532_f42ec557eda145b5958374ca67e65ff2.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (6, N'Cappuccino Đá', N'ngọt và đắng', CAST(50000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/capu-da_487470_e06d3835cbc84e51bd635b04d541494e.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (7, N'Bạc Xỉu', N'ngọt và đắng', CAST(40000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/1639377904_bac-siu_525b9fa5055b41f183088c8e479a9472.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (8, N'Cold Brew Phúc Bồn Tử', N'ngọt', CAST(75000.00 AS Decimal(18, 2)), N'Cafe', N'https://product.hstatic.net/1000075078/product/1675329120_coldbrew-pbt_127e09b0000c4027992bc3168899a656.jpg', 1, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (9, N'Dứa', N'nước ép tươi mát', CAST(40000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/8-300x300.gif', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (10, N'Dâu Tây Đá Xay', N'ngọt mát', CAST(30000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/u-300x300.jpg', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (11, N'Cam', N'ngọt thanh', CAST(25000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/9-300x300.gif', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (12, N'Sinh Tố Bơ', N'béo ngậy của bơ', CAST(40000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://kfehouse.vn/wp-content/uploads/2020/12/Sinh-to-bo-300x300.png', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (13, N'Oolong Tứ Quý', N'Vị nước cốt kim quất tươi', CAST(45000.00 AS Decimal(18, 2)), N'Trà', N'https://product.hstatic.net/1000075078/product/1709005899_kimquat-xuan-1_3badf4c6bbc04a15ba38b68bf396c0f8.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (14, N'Trà Đào Cam Sả', N'ngọt thanh', CAST(45000.00 AS Decimal(18, 2)), N'Trà', N'https://product.hstatic.net/1000075078/product/1669736819_tra-dao-cam-sa-da_63defc32ce214da487850604a63ff281.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (15, N'Oolong Tứ Quý Sen', N'vị olong thanh mát cùng vị bùi của sen', CAST(50000.00 AS Decimal(18, 2)), N'Trà', N'https://product.hstatic.net/1000075078/product/tra-sen_905594_fc1c22441b1540bf90e853c8d0316368.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (16, N'Oolong Tứ Quý Vải', N'ngọt thanh', CAST(40000.00 AS Decimal(18, 2)), N'Trà', N'https://product.hstatic.net/1000075078/product/1709004168_vai-xuan-1_07af236b854e4cf3868f8522dced19f2_large.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (17, N'Táo Xanh', N'ngọt thanh', CAST(45000.00 AS Decimal(18, 2)), N'Trà', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/o-1-300x300.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (18, N'Sinh Tố Xoài ', N'vị xoài tươi', CAST(45000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://bizweb.dktcdn.net/thumb/grande/100/438/465/products/22ab96083245f11ba854.jpg?v=1655371159900', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (19, N'Sinh Tố Chuối Củ Dền', N'vị củ dền chuối và bơ', CAST(30000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://kfehouse.vn/wp-content/uploads/2020/12/Sinh-to-chuoi-cu-den-ca-rot-300x300.png', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (20, N'Sinh Tố Dâu', N'vị dâu tươi', CAST(35000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://kfehouse.vn/wp-content/uploads/2020/12/Sinh-to-dau-300x300.png', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (21, N'Sinh Tố Mãng Cầu', N'vị mãng cầu tươi', CAST(35000.00 AS Decimal(18, 2)), N'Sinh tố', N'https://deltadtl.dasogroup.vn/wp-content/uploads/2023/03/soursop-puree.webp', 4, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (22, N'Chanh Dây', N'vị chanh dây tươi', CAST(35000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://kfehouse.vn/wp-content/uploads/2020/12/Nuoc-ep-chanh-day-300x300.png', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (23, N'Ổi Hồng', N'vị ổi tươi mát', CAST(35000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://kfehouse.vn/wp-content/uploads/2020/12/Nuoc-ep-oi-hong-300x300.png', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (24, N'Táo', N'vị táo xanh', CAST(25000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://kfehouse.vn/wp-content/uploads/2020/12/Nuoc-ep-tao-300x300.png', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (25, N'Nho', N'vị nho tim', CAST(30000.00 AS Decimal(18, 2)), N'Nước giải khát', N'https://product.hstatic.net/200000768759/product/nuoc-ep-nho_4a2d888fc2eb4b9cad0b0f406bb233ca_1024x1024.png', 2, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (26, N'Trà Đào Dầm', N'tươi mát', CAST(20000.00 AS Decimal(18, 2)), N'Trà', N'https://quynhtea.io.vn/wp-content/uploads/2024/05/tradaodam-e1714739962253.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (27, N'Trà Chanh Xí Muội', N'tươi mát', CAST(25000.00 AS Decimal(18, 2)), N'Trà', N'https://quynhtea.io.vn/wp-content/uploads/2024/05/trachanhximuoi-e1714740778924.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (28, N'Trà Vải', N'vải tươi mát', CAST(18000.00 AS Decimal(18, 2)), N'Trà', N'https://quynhtea.io.vn/wp-content/uploads/2024/05/travai-e1714741795353.png', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (29, N'Trà Xoài', N'xoài tươi mát', CAST(30000.00 AS Decimal(18, 2)), N'Trà', N'https://crowncoffeevietnam.com/wp-content/uploads/2020/08/y.jpg', 3, 1)
INSERT [dbo].[product] ([productID], [name], [description], [price], [category], [image], [catID], [SellID]) VALUES (30, N'Trà Mãng Cầu', N'mãng cầu tươi', CAST(35000.00 AS Decimal(18, 2)), N'Trà', N'https://kitecoffee.vn/wp-content/uploads/2023/06/tra-mang-cau-xiem.png', 3, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[voucher] ([code], [percent]) VALUES (N'magiam20', 20)
INSERT [dbo].[voucher] ([code], [percent]) VALUES (N'magiam50', 50)
INSERT [dbo].[voucher] ([code], [percent]) VALUES (N'magiam70', 70)
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_account] FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_account]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_account] FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([accountID])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_account]
GO
ALTER TABLE [dbo].[feedBack]  WITH CHECK ADD  CONSTRAINT [FK_feedBack_customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[customer] ([customerID])
GO
ALTER TABLE [dbo].[feedBack] CHECK CONSTRAINT [FK_feedBack_customer]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[customer] ([customerID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_order] FOREIGN KEY([orderID])
REFERENCES [dbo].[order] ([orderID])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_order]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_product]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_cart] FOREIGN KEY([cartID])
REFERENCES [dbo].[cart] ([cartID])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_cart]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([catID])
REFERENCES [dbo].[category] ([catID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
/****** Object:  Trigger [dbo].[trg_increment_accountID]    Script Date: 7/20/2024 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_increment_accountID]
ON [dbo].[customer]
AFTER INSERT
AS
BEGIN
    DECLARE @newAccountID INT;

    -- Tăng giá trị accountID trong bảng tracker và lấy giá trị mới
    UPDATE [dbo].[accountID_tracker]
    SET @newAccountID = last_accountID = last_accountID + 1;

    -- Cập nhật cột accountID trong bảng customer
    UPDATE [dbo].[customer]
    SET [accountID] = @newAccountID
    FROM [dbo].[customer]
    INNER JOIN inserted ON [dbo].[customer].[customerID] = inserted.[customerID];
END;
GO
ALTER TABLE [dbo].[customer] ENABLE TRIGGER [trg_increment_accountID]
GO
