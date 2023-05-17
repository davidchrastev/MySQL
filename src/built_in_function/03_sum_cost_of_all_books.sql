USE book_library;

SELECT round(sum(ALL (cost)), 2)
FROM books;