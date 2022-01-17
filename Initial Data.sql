
INSERT [RealEstate].[Region] ([Id], [Name], [Code], [ParentRegionId]) VALUES (N'10104899-ac63-41c4-857c-a6189042fd6c', N'COLOMBIA', N'1', NULL)
GO
INSERT [RealEstate].[Region] ([Id], [Name], [Code], [ParentRegionId]) VALUES (N'56c4bd64-4374-4dfe-b28d-03e6f91ebc94', N'BOGOTA', N'11', N'10104899-ac63-41c4-857c-a6189042fd6c')
GO

INSERT [RealEstate].[Region] ([Id], [Name], [Code], [ParentRegionId]) VALUES (N'45511450-d97b-4c91-ad2c-b93c3a541408', N'MEDELLIN', N'12', N'10104899-ac63-41c4-857c-a6189042fd6c')
GO
INSERT [RealEstate].[Person] ([Id], [Name], [Photo], [BirthDay], [Email], [Phone], [Address], [RegionId]) VALUES (N'9f82e9b3-784c-4e38-a302-0dc266a71fe3', N'OWNER2', NULL, NULL, N'owner2@hotmail.com', N'315000000', N'', N'56c4bd64-4374-4dfe-b28d-03e6f91ebc94')
GO
INSERT [RealEstate].[Person] ([Id], [Name], [Photo], [BirthDay], [Email], [Phone], [Address], [RegionId]) VALUES (N'4de7c9f3-6067-49d6-82de-175bb9f98b62', N'OWNER1', NULL, NULL, N'owner1@hotmail.com', N'319000000', N'CLL 1 1 1', N'56c4bd64-4374-4dfe-b28d-03e6f91ebc94')
GO
INSERT [RealEstate].[Property] ([Id], [Code], [Price], [Year], [OwnerId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [IsDeleted], [Address], [RegionId]) VALUES (N'a1de41b2-621c-43ea-9ca2-02a49290dde6', N'COD_TEST', CAST(1000.00 AS Decimal(10, 2)), 2020, N'4de7c9f3-6067-49d6-82de-175bb9f98b62', CAST(N'2022-01-14T23:23:20.610' AS DateTime), CAST(N'2022-01-16T09:11:25.313' AS DateTime), N'user1@mail.com', N'user@hotmail.com', 0, N'CL 4 4 4', N'10104899-ac63-41c4-857c-a6189042fd6c')
GO
INSERT [RealEstate].[Property] ([Id], [Code], [Price], [Year], [OwnerId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [IsDeleted], [Address], [RegionId]) VALUES (N'4744c1ad-6b7b-480d-acab-8486fdbc37f3', N'a24baa94-f5d7-442b-ab20-7451fa19d25e', CAST(1000.00 AS Decimal(10, 2)), 2020, N'4de7c9f3-6067-49d6-82de-175bb9f98b62', CAST(N'2022-01-16T08:03:25.270' AS DateTime), NULL, N'user@hotmail.com', NULL, 0, N'CL 4 4 4', N'56c4bd64-4374-4dfe-b28d-03e6f91ebc94')
GO
INSERT [RealEstate].[Property] ([Id], [Code], [Price], [Year], [OwnerId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [IsDeleted], [Address], [RegionId]) VALUES (N'd8361235-50da-494b-93c8-b1e18e1c68fd', N'2f875d5e-5d61-4fe6-8304-62df33b1239c', CAST(1000.00 AS Decimal(10, 2)), 2020, N'4de7c9f3-6067-49d6-82de-175bb9f98b62', CAST(N'2022-01-16T09:11:25.283' AS DateTime), NULL, N'user@hotmail.com', NULL, 0, N'CL 4 4 4', N'56c4bd64-4374-4dfe-b28d-03e6f91ebc94')
GO

INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c74ebbe8-6626-4e57-b8b3-511cd3c142df', N'testUser1@example.com', N'TESTUSER1@EXAMPLE.COM', N'testUser1@example.com', N'TESTUSER1@EXAMPLE.COM', 0, N'AQAAAAEAACcQAAAAEIgV4Hj6WuK9JVN9FixM/JkxPwKOp8G7RHrG+IbdXGM5OgMucteOtcdK/z9nkXg/kw==', N'DKNV3TGL2LYXXKKK3VBKRX3ZTBG7FAVY', N'ba1d7ff0-2f2f-4927-a1ec-774d5cc43a22', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 
GO
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'c74ebbe8-6626-4e57-b8b3-511cd3c142df', N'role', N'admin')
GO