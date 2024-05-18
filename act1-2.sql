-- Create Grades table
CREATE TABLE Grades (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    ExamScore DECIMAL(10,2),
    LetterGrade CHAR(1)
);

-- Create stored procedure
CREATE PROCEDURE UpdateStudentGrade
    @StudentID INT,
    @ExamScore DECIMAL(10,2)
AS
BEGIN
    -- Calculate the letter grade
    DECLARE @LetterGrade CHAR(1);
    SET @LetterGrade = CASE
        WHEN @ExamScore >= 90 THEN 'A'
        WHEN @ExamScore >= 80 THEN 'B'
        WHEN @ExamScore >= 70 THEN 'C'
        WHEN @ExamScore >= 60 THEN 'D'
        ELSE 'F'
    END;

    -- Update the Grades table
    UPDATE Grades
    SET ExamScore = @ExamScore, LetterGrade = @LetterGrade
    WHERE StudentID = @StudentID;
END;