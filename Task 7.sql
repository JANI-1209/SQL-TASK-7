USE librarylb;

CREATE VIEW BorrowingStudents AS
SELECT DISTINCT Name FROM Students
WHERE StudentID IN (SELECT StudentID FROM BorrowedBooks);

CREATE VIEW BookAuthors AS
SELECT B.Title, A.Name AS Author
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID;

CREATE VIEW UnreturnedBooks AS
SELECT StudentID, BookID FROM BorrowedBooks
WHERE ReturnDate IS NULL;

CREATE VIEW CategoryOneBooks AS
SELECT * FROM Books
WHERE CategoryID = 1
WITH CHECK OPTION;