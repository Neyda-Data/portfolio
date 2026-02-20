/****** Object:  View [dbo].[CourseRevenue_v]    Script Date: 11/24/2025 8:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CourseRevenue_v] AS
SELECT
  c.CourseCode,
  c.CourseTitle,
  COUNT(s.SectionID) AS SectionCount,
  SUM(CASE WHEN s.SectionID IS NOT NULL THEN ISNULL(c.FullCourseFee,0) ELSE 0 END) AS TotalGrossRevenue,
  CASE WHEN COUNT(s.SectionID) = 0 THEN CAST(0.00 AS DECIMAL(12,2))
       ELSE CAST(ROUND(SUM(CASE WHEN s.SectionID IS NOT NULL THEN ISNULL(c.FullCourseFee,0) ELSE 0 END) * 1.0 / COUNT(s.SectionID), 2) AS DECIMAL(12,2))
  END AS AvgRevenuePerSection
FROM dbo.Courses c
LEFT JOIN dbo.Sections s
  ON s.CourseCode = c.CourseCode
  AND ISNULL(s.SectionStatus,'') <> 'CN'
GROUP BY c.CourseCode, c.CourseTitle;
GO
