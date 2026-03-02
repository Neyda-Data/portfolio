/****** Object:  View [dbo].[AnnualRevenue_v]    Script Date: 11/24/2025 8:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[AnnualRevenue_v] AS
WITH SectionAmounts AS (
  SELECT
    s.SectionID,
    t.AcademicYear,
    ISNULL(c.FullCourseFee,0) AS TuitionForSection,
    ISNULL(SUM(sf.PaymentAmount),0) AS FacultyPaymentsForSection
  FROM dbo.Sections s
  LEFT JOIN dbo.Courses c
    ON s.CourseCode = c.CourseCode
  LEFT JOIN dbo.Terms t
    ON s.TermID = t.TermID
  LEFT JOIN dbo.SectionFaculty sf
    ON sf.SectionID = s.SectionID
  WHERE ISNULL(s.SectionStatus,'') <> 'CN'
  GROUP BY s.SectionID, t.AcademicYear, c.FullCourseFee
)
SELECT
  AcademicYear,
  SUM(TuitionForSection) AS TotalTuition,
  SUM(FacultyPaymentsForSection) AS TotalFacultyPayments
FROM SectionAmounts
GROUP BY AcademicYear;
GO
