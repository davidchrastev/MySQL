USE book_library;

UPDATE books
SET title = replace(title, 'The', '***')
WHERE left(title, 3) = 'The';

SELECT title
FROM books
WHERE left(title, 3) = '***'
ORDER BY id;