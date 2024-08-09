-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH TeacherAssignmentCounts AS (
  SELECT teacher_id, COUNT(*) AS assignment_count
  FROM assignments
  WHERE state = 'GRADED'
  GROUP BY teacher_id
),
MaxGradingTeacher AS (
  SELECT teacher_id
  FROM TeacherAssignmentCounts
  ORDER BY assignment_count DESC
  LIMIT 1
)
SELECT COUNT(*) AS grade_a_count
FROM assignments
WHERE teacher_id = (SELECT teacher_id FROM MaxGradingTeacher)
  AND grade = 'A';