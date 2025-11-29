-- =====================================
-- LIBRARY DATASET — EXPECTED OUTPUT SUMMARY
-- =====================================

-- Q1. List all members with their membership type and city.
-- member_id | member_name  | membership_type | city
-- --------- | ------------ | --------------- | ---------
-- 1         | Rajesh Kumar | premium         | Delhi
-- 2         | Priya Sharma | regular         | Mumbai
-- 3         | Amit Patel   | student         | Bangalore
-- 4         | Sneha Reddy  | regular         | Chennai
-- 5         | Vikram Singh | premium         | Delhi
-- 6         | Anjali Mehta | student         | Pune


-- Q2. List all books with their author name and genre name.
-- book_id | title                                    | author_name          | genre_name
-- -------- | ---------------------------------------- | -------------------- | -----------
-- 1       | The Guide                                | R.K. Narayan         | Fiction
-- 2       | The God of Small Things                  | Arundhati Roy        | Fiction
-- 3       | A Brief History of Time                  | Stephen Hawking      | Science
-- 4       | Sapiens                                  | Yuval Noah Harari    | Non-Fiction
-- 5       | Harry Potter and the Philosopher's Stone | J.K. Rowling         | Fiction
-- 6       | 21 Lessons for the 21st Century          | Yuval Noah Harari    | Non-Fiction
-- 7       | The Malgudi Days                         | R.K. Narayan         | Fiction
-- 8       | The Theory of Everything                 | Stephen Hawking      | Science


-- Q3. List all book loans with member name, book title, and loan status.
-- loan_id | member_name  | book_title                    | status
-- -------- | ------------ | ----------------------------- | ---------
-- 1        | Rajesh Kumar | The Guide                    | returned
-- 2        | Priya Sharma | The God of Small Things       | active
-- 3        | Amit Patel   | A Brief History of Time       | returned
-- 4        | Rajesh Kumar | Sapiens                       | active
-- 5        | Sneha Reddy  | Harry Potter...               | active
-- 6        | Vikram Singh | The God of Small Things       | overdue
-- 7        | Amit Patel   | The Malgudi Days              | active
-- 8        | Priya Sharma | The Theory of Everything      | returned
-- 9        | Vikram Singh | 21 Lessons for the 21st Century | active


-- Q4. For each genre, show how many books belong to it.
-- genre_id | genre_name  | book_count
-- --------- | ----------- | ----------
-- 1        | Fiction     | 4
-- 2        | Non-Fiction | 2
-- 3        | Science     | 2


-- Q5. For each author, show the total number of books written.
-- author_id | author_name          | book_count
-- --------- | -------------------- | -----------
-- 1         | R.K. Narayan         | 2
-- 2         | Arundhati Roy        | 1
-- 3         | Stephen Hawking      | 2
-- 4         | Yuval Noah Harari    | 2
-- 5         | J.K. Rowling         | 1


-- Q6. List all books that have NO available copies.
-- book_id | title
-- -------- | --------------------------
-- 2        | The God of Small Things


-- Q7. List all members who have NEVER borrowed any book.
-- member_id | member_name
-- --------- | ------------
-- 6         | Anjali Mehta


-- Q8. List all book loans that are currently overdue.
-- loan_id | member_name  | book_title              | fine_amount
-- -------- | ------------ | ----------------------- | -----------
-- 6        | Vikram Singh | The God of Small Things | 100.00


-- Q9. For each member, show the total number of active loans.
-- member_id | member_name  | active_loans
-- --------- | ------------ | ------------
-- 1         | Rajesh Kumar | 1
-- 2         | Priya Sharma | 1
-- 3         | Amit Patel   | 1
-- 4         | Sneha Reddy  | 1
-- 5         | Vikram Singh | 2
-- 6         | Anjali Mehta | 0


-- Q10. Show the TOP 3 most expensive books.
-- book_id | title                           | price
-- -------- | ------------------------------ | --------
-- 6       | 21 Lessons for the 21st Century | 650.00
-- 4       | Sapiens                         | 600.00
-- 3       | A Brief History of Time         | 550.00


-- Q11. List all books published before 2000.
-- book_id | title                    | published_year
-- -------- | ----------------------- | --------------
-- 1       | The Guide                | 1958
-- 2       | The God of Small Things  | 1997
-- 3       | A Brief History of Time  | 1988
-- 5       | Harry Potter...          | 1997
-- 7       | The Malgudi Days         | 1943


-- Q12. List all book loans with member name, book title, and fine amount.
-- loan_id | member_name  | book_title                    | fine_amount
-- -------- | ------------ | ----------------------------- | -----------
-- 1        | Rajesh Kumar | The Guide                    | 0.00
-- 2        | Priya Sharma | The God of Small Things       | 0.00
-- 3        | Amit Patel   | A Brief History of Time       | 50.00
-- 4        | Rajesh Kumar | Sapiens                       | 0.00
-- 5        | Sneha Reddy  | Harry Potter...               | 0.00
-- 6        | Vikram Singh | The God of Small Things       | 100.00
-- 7        | Amit Patel   | The Malgudi Days              | 0.00
-- 8        | Priya Sharma | The Theory of Everything      | 0.00
-- 9        | Vikram Singh | 21 Lessons for the 21st Century | 0.00


-- Q13. List all authors who have NO books in the library.
-- author_id | author_name
-- --------- | ------------
-- (None - all authors have books)


-- Q14. For each membership type, show how many members belong to it.
-- membership_type | member_count
-- --------------- | ------------
-- premium         | 2
-- regular         | 2
-- student         | 2


-- Q15. List all members who have active loans but have fines.
-- member_id | member_name
-- --------- | ------------
-- (None - active loans don't have fines in this dataset)


-- Q16. Show all genres with average price of books.
-- genre_id | genre_name  | avg_price
-- --------- | ----------- | ----------
-- 1        | Fiction     | 400.00
-- 2        | Non-Fiction | 625.00
-- 3        | Science     | 515.00


-- Q17. List all books that have been borrowed but NEVER returned.
-- loan_id | book_title              | member_name  | status
-- -------- | ----------------------- | ------------ | ---------
-- 2        | The God of Small Things | Priya Sharma | active
-- 4        | Sapiens                 | Rajesh Kumar | active
-- 5        | Harry Potter...         | Sneha Reddy  | active
-- 6        | The God of Small Things | Vikram Singh | overdue
-- 7        | The Malgudi Days        | Amit Patel   | active
-- 9        | 21 Lessons...           | Vikram Singh | active


-- Q18. For each author, show the average price of their books.
-- author_id | author_name          | avg_price
-- --------- | -------------------- | ----------
-- 1         | R.K. Narayan         | 325.00
-- 2         | Arundhati Roy        | 450.00
-- 3         | Stephen Hawking      | 515.00
-- 4         | Yuval Noah Harari    | 625.00
-- 5         | J.K. Rowling         | 500.00


-- Q19. List all members who have borrowed books from the 'Fiction' genre.
-- member_id | member_name
-- --------- | ------------
-- 1         | Rajesh Kumar
-- 2         | Priya Sharma
-- 3         | Amit Patel
-- 5         | Vikram Singh


-- Q20. Members with total fines > 50 (using CTE).
-- member_id | member_name  | total_fines
-- --------- | ------------ | -----------
-- 3         | Amit Patel   | 50.00
-- 5         | Vikram Singh | 100.00


-- Q21. List all books that have been borrowed more than once.
-- book_id | title                    | loan_count
-- -------- | ----------------------- | -----------
-- 2       | The God of Small Things | 2


-- Q22. Show the author with the most books in the library.
-- author_id | author_name       | book_count
-- --------- | ----------------- | -----------
-- 1         | R.K. Narayan      | 2
-- 3         | Stephen Hawking   | 2
-- 4         | Yuval Noah Harari | 2
-- (Multiple authors tied with 2 books)


-- Q23. List all members who have borrowed but NEVER returned any on time.
-- member_id | member_name
-- --------- | ------------
-- 3         | Amit Patel
-- 5         | Vikram Singh


-- Q24. For each loan status, show how many loans are in that status.
-- status   | loan_count
-- --------- | -----------
-- active   | 5
-- returned | 3
-- overdue  | 1


-- Q25. List all books that are currently available but have NEVER been borrowed.
-- book_id | title
-- -------- | --------------------------
-- (None - all available books have been borrowed at some point)

