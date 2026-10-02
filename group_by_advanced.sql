-- Bước 1: Sử dụng cơ sở dữ liệu QuanLySinhVien
USE QuanLySinhVien;

-- 1. Hiển thị tất cả các thông tin môn học (bảng Subject) có credit lớn nhất
SELECT * 
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

-- Hoặc sử dụng mệnh đề ORDER BY kết hợp LIMIT 1:
-- SELECT * FROM Subject ORDER BY Credit DESC LIMIT 1;


-- 2. Hiển thị các thông tin môn học có điểm thi (Mark) lớn nhất
SELECT Sub.*, M.Mark
FROM Subject Sub
JOIN Mark M ON Sub.SubId = M.SubId
WHERE M.Mark = (SELECT MAX(Mark) FROM Mark);


-- 3. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.StudentId, S.StudentName, S.Address, S.Phone, S.Status, S.ClassId, AVG(M.Mark) AS 'Điểm trung bình'
FROM Student S
LEFT JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName, S.Address, S.Phone, S.Status, S.ClassId
ORDER BY 'Điểm trung bình' DESC;
