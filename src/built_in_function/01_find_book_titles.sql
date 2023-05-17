USE book_library;

SELECT title
FROM books
WHERE left(title, 3) LIKE 'The';