use Assignments_kumar;

-- ASSIGNMENT - 1 --

CREATE TABLE Books(
BookId INT IDENTITY(1, 1),
BookName NVARCHAR(50)
);

ALTER TABLE Books
ADD CONSTRAINT UQ_BOOKNAME UNIQUE(BookName);

ALTER TABLE Books
ADD CONSTRAINT PK_BOOKID PRIMARY KEY(BookId);

EXEC sp_help 'dbo.Books';

INSERT INTO Books (BookName) VALUES
('SWAMY VIVEKANANDA'), ('CHE GUEVARA'), ('SANJEEV KUMAR'), ('PAVAN KUMAR');

SELECT * FROM Books;

CREATE TABLE Author(
AuthorId INT IDENTITY(1, 1),
AuthorName Nvarchar(50), 
CONSTRAINT PK_AUTHORID PRIMARY KEY(AuthorId)
);

EXEC sp_help 'dbo.Author';

INSERT INTO Author (AuthorName) VALUES
('SANJEEV'), ('RAM'), ('HARI'), ('PRIYA');

SELECT * FROM Author;

UPDATE Author
SET AuthorName = 'RAM KUMAR' WHERE AuthorId = 2;

CREATE TABLE Junction(
BookId INT,
AuthorId INT,
CONSTRAINT CP_JUNCTION PRIMARY KEY(BookId, AuthorId)
);


ALTER TABLE Junction
ADD CONSTRAINT FK_BOOKID FOREIGN KEY (BookId) REFERENCES Books(BookId), 
CONSTRAINT FK_AUTHORID FOREIGN KEY (AuthorId) REFERENCES Author(AuthorId);

EXEC sp_help 'dbo.Junction';

INSERT INTO Junction (BookId, AuthorId)
SELECT b.BookId, a.AuthorId FROM Books b CROSS JOIN Author a;

SELECT * FROM Junction;

TRUNCATE TABLE Junction;

INSERT INTO Junction VALUES
((SELECT BookId FROM Books WHERE BookName = 'SWAMY VIVEKANANDA'), (SELECT AuthorId FROM Author WHERE AuthorName = 'SANJEEV')),
((SELECT BookId FROM Books WHERE BookName = 'CHE GUEVARA'), (SELECT AuthorId FROM Author WHERE AuthorName = 'RAM KUMAR')),
((SELECT BookId FROM Books WHERE BookName = 'SANJEEV KUMAR'), (SELECT AuthorId FROM Author WHERE AuthorName = 'HARI')),
((SELECT BookId FROM Books WHERE BookName = 'PAVAN KUMAR'), (SELECT AuthorId FROM Author WHERE AuthorName = 'PRIYA'));

DELETE FROM Junction
WHERE BookId = (SELECT BookId FROM Books WHERE BookName = 'PAVAN KUMAR')
AND AuthorId = (SELECT AuthorId FROM Author WHERE AuthorName = 'PRIYA');

SELECT * FROM Junction;

TRUNCATE TABLE Junction;

DROP TABLE Junction;

TRUNCATE TABLE Books;

DROP TABLE Books;

TRUNCATE TABLE Author;

DROP TABLE Author;

-- ASSIGNMENT - 2 --

CREATE TABLE Book(
BookId INT IDENTITY(1, 1) PRIMARY KEY,
BookName NVARCHAR(100),
AuthorName NVARCHAR(100),
ISBN NVARCHAR(50)
);

ALTER TABLE Book
ALTER COLUMN BookName NVARCHAR(50);

ALTER TABLE Book
ALTER COLUMN AuthorName NVARCHAR(150);

INSERT INTO Book(BookName, AuthorName, ISBN) VALUES
('SWAMY', 'SANJEEV KUMAR', '23'), ('VIVEKANADA', 'KUMAR', '19'),
('CHE GUEVARA', 'PAVAN', '59'), ('PARAMANANDA', 'PRIYA', '122');

SELECT * FROM Book;

TRUNCATE TABLE Book;

DROP TABLE Book;

