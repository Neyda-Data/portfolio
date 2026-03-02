/****** Object:  StoredProcedure [dbo].[StudentHistory_p]    Script Date: 11/24/2025 8:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StudentHistory_p]
  @PersonID INT
AS
BEGIN
  SET NOCOUNT ON;

  ;WITH PrimaryInstructor AS (
    SELECT
      sf.SectionID,
      sf.FacultyID,
      f.FacultyFirstName,
      f.FacultyLastName,
      ROW_NUMBER() OVER (
        PARTITION BY sf.SectionID
        ORDER BY CASE WHEN LOWER(ISNULL(sf.FacultyRole,'')) = 'primary' THEN 0 ELSE 1 END,
                 sf.SectionFacultyID
      ) AS rn
    FROM dbo.SectionFaculty sf
    LEFT JOIN dbo.Faculty f ON sf.FacultyID = f.FacultyID
  ),
  PI AS (
    SELECT SectionID, FacultyFirstName, FacultyLastName
    FROM PrimaryInstructor
    WHERE rn = 1
  )
  SELECT
    cl.PersonID,
    ISNULL(p.FirstName,'') + ' ' + ISNULL(p.LastName,'') AS StudentName,
    cl.SectionID,
    sec.CourseCode,
    ISNULL(c.CourseTitle,'') AS CourseTitle,
    ISNULL(pi.FacultyFirstName,'') 
      + CASE WHEN ISNULL(pi.FacultyFirstName,'') = '' THEN '' ELSE ' ' END
      + ISNULL(pi.FacultyLastName,'') AS PrimaryInstructorName,
    t.TermCode,
    sec.StartDate,
    ISNULL(cl.TuitionAmount,0) AS TuitionPaid,
    cl.Grade
  FROM dbo.ClassList cl
  INNER JOIN dbo.Sections sec ON cl.SectionID = sec.SectionID
  LEFT JOIN dbo.Courses c ON sec.CourseCode = c.CourseCode
  LEFT JOIN dbo.Terms t ON sec.TermID = t.TermID
  LEFT JOIN PI pi ON sec.SectionID = pi.SectionID
  LEFT JOIN dbo.Persons p ON cl.PersonID = p.PersonID
  WHERE cl.PersonID = @PersonID
  ORDER BY t.AcademicYear, t.TermCode, sec.StartDate;
END;
GO
