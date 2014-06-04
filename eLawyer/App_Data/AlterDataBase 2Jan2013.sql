alter table Payments
Add CaseId int null;

GO

/****** Object:  View [dbo].[vw_PaymentLists]    Script Date: 01/02/2014 16:12:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_PaymentLists]
AS
SELECT     dbo.Payments.Id, dbo.Payments.ClientId, dbo.Payments.Date, dbo.Payments.PaidTo, dbo.PaymentModes.Mode AS PaymentMode, 
                      dbo.EXPENSESHEAD.CODE AS ExpenseHeadCode, dbo.EXPENSESHEAD.NAME AS ExpenseHeadName, dbo.LedgerTypes.Type AS LedgerType, 
                      dbo.Payments.Amounts, dbo.Payments.Narration, dbo.EXPENSESHEAD.LedgerTypeId, dbo.Payments.VoucherNo, dbo.Payments.CHQ_NO, dbo.Payments.CHQ_DATE, 
                      dbo.Payments.BANK, dbo.Payments.Remarks, dbo.Payments.ExpenseHeadId, dbo.Payments.PaymentModeId, dbo.Payments.CaseId, dbo.Cases.CaseNumber
FROM         dbo.Payments INNER JOIN
                      dbo.PaymentModes ON dbo.PaymentModes.Id = dbo.Payments.PaymentModeId INNER JOIN
                      dbo.EXPENSESHEAD ON dbo.Payments.ExpenseHeadId = dbo.EXPENSESHEAD.Id INNER JOIN
                      dbo.LedgerTypes ON dbo.EXPENSESHEAD.LedgerTypeId = dbo.LedgerTypes.Id INNER JOIN
                      dbo.Cases ON dbo.Payments.CaseId = dbo.Cases.ID

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[44] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Payments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 238
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "PaymentModes"
            Begin Extent = 
               Top = 6
               Left = 243
               Bottom = 95
               Right = 403
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EXPENSESHEAD"
            Begin Extent = 
               Top = 64
               Left = 437
               Bottom = 183
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LedgerTypes"
            Begin Extent = 
               Top = 6
               Left = 639
               Bottom = 95
               Right = 799
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cases"
            Begin Extent = 
               Top = 96
               Left = 243
               Bottom = 238
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_PaymentLists'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_PaymentLists'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_PaymentLists'
GO


/****** Script for SelectTopNRows command from SSMS  ******/

/****** Object:  View [dbo].[vw_ClientList]    Script Date: 01/02/2014 16:42:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ClientList]
AS
SELECT     dbo.Clients.Id, dbo.Clients.Name, dbo.Clients.AdminstratorId, dbo.Clients.Lane, dbo.Clients.Street, dbo.Clients.City, dbo.Clients.Zip, dbo.Clients.Phone1, 
                      dbo.Clients.Phone2, dbo.Clients.Cell, dbo.Clients.Email, dbo.Clients.Website, dbo.Clients.ContractStartDate, dbo.Clients.ContractEndDate, 
                       dbo.Clients.CreateDate, dbo.Clients.LastUpdated, dbo.Clients.UpdatedBy, dbo.Clients.StateId, 
                      dbo.States.Name AS StateName, dbo.States.Code AS StateCode, dbo.Clients.CountryId, dbo.Countries.Name AS CountryName, dbo.Countries.Code AS CountryCode 
                     
FROM         dbo.Clients INNER JOIN
                      dbo.States ON dbo.Clients.StateId = dbo.States.Id INNER JOIN
                      dbo.Countries ON dbo.States.CountryId = dbo.Countries.Id 


GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[53] 2[19] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Clients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 293
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "States"
            Begin Extent = 
               Top = 1
               Left = 539
               Bottom = 116
               Right = 691
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Countries"
            Begin Extent = 
               Top = 7
               Left = 743
               Bottom = 107
               Right = 895
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BusinessTypes"
            Begin Extent = 
               Top = 58
               Left = 340
               Bottom = 143
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 26
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 150' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ClientList'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ClientList'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ClientList'
GO




/****** Object:  View [dbo].[vw_ExpenseHeads]    Script Date: 01/02/2014 16:58:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_ExpenseHeads]
AS
SELECT     dbo.EXPENSESHEAD.Id, dbo.EXPENSESHEAD.CODE, dbo.EXPENSESHEAD.NAME, dbo.EXPENSESHEAD.LedgerTypeId, dbo.LedgerTypes.Type AS LedgerType, 
                      dbo.EXPENSESHEAD.OP_BAL, dbo.EXPENSESHEAD.ClientId
FROM         dbo.EXPENSESHEAD LEFT OUTER JOIN
                      dbo.LedgerTypes ON dbo.EXPENSESHEAD.LedgerTypeId = dbo.LedgerTypes.Id

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[17] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EXPENSESHEAD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 198
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LedgerTypes"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 95
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ExpenseHeads'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ExpenseHeads'
GO



/****** Object:  View [dbo].[vw_Users_Lists]    Script Date: 01/02/2014 17:09:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Users_Lists]
AS
SELECT     dbo.vw_aspnet_Users.UserId, dbo.vw_aspnet_Users.UserName, dbo.vw_aspnet_Users.LoweredUserName, dbo.vw_aspnet_Users.MobileAlias, 
                      dbo.vw_aspnet_Users.IsAnonymous, dbo.vw_aspnet_Users.LastActivityDate, dbo.aspnet_UsersInRoles.RoleId, dbo.aspnet_Roles.RoleName, 
                      dbo.aspnet_Roles.LoweredRoleName, dbo.aspnet_Roles.Description, dbo.vw_aspnet_Users.ApplicationId, dbo.aspnet_Membership.Email, 
                      dbo.aspnet_Membership.LoweredEmail, dbo.aspnet_Membership.IsApproved, dbo.aspnet_Membership.IsLockedOut, dbo.aspnet_Membership.CreateDate, 
                      dbo.aspnet_Membership.LastLoginDate, dbo.aspnet_Membership.FailedPasswordAttemptCount, dbo.aspnet_Membership.LastPasswordChangedDate, 
                      dbo.aspnet_Membership.LastLockoutDate, dbo.associated_Users.ClientId, dbo.vw_ClientList.Name, dbo.vw_ClientList.Lane, dbo.vw_ClientList.Street, 
                      dbo.vw_ClientList.City, dbo.vw_ClientList.Zip, dbo.vw_ClientList.Email AS ClientEmail, dbo.vw_ClientList.Website, dbo.vw_ClientList.ContractStartDate, 
                      dbo.vw_ClientList.ContractEndDate, dbo.vw_ClientList.StateName, dbo.vw_ClientList.CountryName, dbo.vw_ClientList.Cell
FROM         dbo.vw_aspnet_Users INNER JOIN
                      dbo.aspnet_Membership ON dbo.vw_aspnet_Users.UserId = dbo.aspnet_Membership.UserId LEFT OUTER JOIN
                      dbo.aspnet_UsersInRoles ON dbo.aspnet_UsersInRoles.UserId = dbo.vw_aspnet_Users.UserId LEFT OUTER JOIN
                      dbo.aspnet_Roles ON dbo.aspnet_Roles.RoleId = dbo.aspnet_UsersInRoles.RoleId LEFT OUTER JOIN
                      dbo.associated_Users ON dbo.associated_Users.Membership_UserId = dbo.vw_aspnet_Users.UserId LEFT OUTER JOIN
                      dbo.vw_ClientList ON dbo.associated_Users.ClientId = dbo.vw_ClientList.Id

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[12] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[49] 2[18] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vw_aspnet_Users"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 200
               Right = 179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Membership"
            Begin Extent = 
               Top = 53
               Left = 650
               Bottom = 348
               Right = 950
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_UsersInRoles"
            Begin Extent = 
               Top = 112
               Left = 273
               Bottom = 264
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Roles"
            Begin Extent = 
               Top = 119
               Left = 487
               Bottom = 282
               Right = 665
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "associated_Users"
            Begin Extent = 
               Top = 0
               Left = 195
               Bottom = 147
               Right = 379
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "vw_Employees"
            Begin Extent = 
               Top = 4
               Left = 697
               Bottom = 195
               Right = 876
            End
            DisplayFlags = 280
            TopColumn = 29
         End
         Begin Table = "vw_ClientList"
            Begin Extent = 
               Top = 56
               Left = 536
               Bottom = 263
               Right = 7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Users_Lists'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'32
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 38
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Users_Lists'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Users_Lists'
GO


