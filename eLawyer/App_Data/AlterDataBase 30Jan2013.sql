Alter table cases
Add FirstPartyAliase nvarchar(50);
GO

Alter table cases
ADD SecondPartyAliase nvarchar(50);
GO



/****** Object:  Table [dbo].[CaseNatures]    Script Date: 01/30/2014 13:08:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CaseNatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nature] [nvarchar](50) NULL,
 CONSTRAINT [PK_CaseNatures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO CaseNatures values('Criminal');
INSERT INTO CaseNatures values('Civil');

/******************************************************************* */

Alter table cases
ADD CaseNatureId int null;
GO

Alter table cases
ADD IsDeleted bit null;
GO

Alter table CaseHearings
ADD IsDeleted bit null;
GO

/****** Object:  View [dbo].[vw_CaseLists]    Script Date: 01/30/2014 17:56:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_CaseLists]
AS
SELECT     dbo.Cases.ID, dbo.Cases.ClientId, dbo.Cases.CaseNumber, dbo.Cases.EnrollmentDate, dbo.Cases.JudgeName, dbo.Cases.CourtName, dbo.Cases.FirstParty, 
                      dbo.Cases.FirstPartyAddress, dbo.Cases.FirstPartyPhone, dbo.Cases.SecondParty, dbo.Cases.SecondPartyAddress, dbo.Cases.SecondPartyPhone, 
                      dbo.Cases.Description, dbo.Cases.IsActive, dbo.Cases.Status, dbo.Cases.CreatedDate, dbo.Cases.NextDate, dbo.Cases.LastUpdated, dbo.Cases.FirstHearingDate, 
                      dbo.Cases.MyPartyName, dbo.Cases.MyPartyPhone, dbo.Cases.IsFromFirstParty, dbo.Cases.IsFromSecondParty, dbo.Cases.FirstPartyAliase, 
                      dbo.Cases.SecondPartyAliase, dbo.Cases.CaseNatureId, dbo.CaseNatures.Nature, dbo.Cases.IsDeleted
FROM         dbo.Cases LEFT OUTER JOIN
                      dbo.CaseNatures ON dbo.Cases.CaseNatureId = dbo.CaseNatures.Id

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
         Configuration = "(H (1[50] 2[25] 3) )"
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
      ActivePaneConfig = 10
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cases"
            Begin Extent = 
               Top = 14
               Left = 69
               Bottom = 322
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "CaseNatures"
            Begin Extent = 
               Top = 6
               Left = 296
               Bottom = 95
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CaseLists'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CaseLists'
GO



