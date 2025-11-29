-- =====================================
-- SOCIAL MEDIA DATASET — EXPECTED OUTPUT SUMMARY
-- =====================================

-- Q1. List all users with their username, full name, and verification status.
-- user_id | username      | full_name    | is_verified
-- -------- | ------------- | ------------ | -----------
-- 1        | rajesh_dev    | Rajesh Kumar | true
-- 2        | priya_design  | Priya Sharma | true
-- 3        | amit_tech     | Amit Patel   | false
-- 4        | sneha_photo   | Sneha Reddy  | false
-- 5        | vikram_code   | Vikram Singh | false
-- 6        | anjali_food   | Anjali Mehta | false


-- Q2. List all posts with user username, topic name, and post content.
-- post_id | username      | topic_name   | content
-- -------- | ------------- | ------------ | ---------------------------
-- 1        | rajesh_dev    | Technology   | Just learned PostgreSQL!...
-- 2        | priya_design  | Design       | New design system...
-- 3        | amit_tech     | Technology   | Best practices for React...
-- 4        | sneha_photo   | Photography  | Sunset photography...
-- 5        | rajesh_dev    | Technology   | Database indexing...
-- 6        | vikram_code   | Technology   | Building REST APIs...
-- 7        | anjali_food   | Food         | Homemade pasta recipe
-- 8        | priya_design  | Design       | Color theory basics


-- Q3. List all comments with post content, commenter username, and comment content.
-- comment_id | post_content                    | commenter_username | comment_content
-- ---------- | ------------------------------- | ----------------- | ----------------
-- 1          | Just learned PostgreSQL!...      | priya_design      | Great post!
-- 2          | Just learned PostgreSQL!...      | amit_tech         | I agree!
-- 3          | New design system...             | rajesh_dev        | Looks amazing!
-- 4          | New design system...             | amit_tech         | Can you share...
-- 5          | New design system...             | priya_design      | Sure, check...
-- 6          | Best practices for React...      | rajesh_dev        | Very helpful!
-- 7          | Best practices for React...      | priya_design      | Thanks for...
-- 8          | Sunset photography...            | rajesh_dev        | Beautiful shot!
-- 9          | Sunset photography...            | priya_design      | Love it!
-- 10         | Database indexing...            | amit_tech         | Good explanation
-- 11         | Building REST APIs...          | rajesh_dev        | Nice tutorial
-- 12         | Homemade pasta recipe           | rajesh_dev        | Recipe looks...
-- 13         | Homemade pasta recipe           | priya_design      | Will try this...
-- 14         | Color theory basics             | amit_tech         | Useful info


-- Q4. For each topic, show how many posts belong to it.
-- topic_id | topic_name   | post_count
-- --------- | ------------ | -----------
-- 1        | Technology   | 4
-- 2        | Design       | 2
-- 3        | Photography  | 1
-- 4        | Food         | 1


-- Q5. For each user, show the total number of posts they have created.
-- user_id | username      | post_count
-- -------- | ------------- | -----------
-- 1        | rajesh_dev    | 2
-- 2        | priya_design  | 2
-- 3        | amit_tech     | 1
-- 4        | sneha_photo   | 1
-- 5        | vikram_code   | 1
-- 6        | anjali_food   | 1


-- Q6. List all verified users.
-- user_id | username      | full_name
-- -------- | ------------- | ------------
-- 1        | rajesh_dev    | Rajesh Kumar
-- 2        | priya_design  | Priya Sharma


-- Q7. List all users who have NEVER created any post.
-- user_id | username
-- -------- | ------------
-- (None - all users have created posts)


-- Q8. List all posts that have NO comments.
-- post_id | content
-- -------- | ---------------------------
-- (None - all posts have comments)


-- Q9. For each user, show total likes received (sum of likes_count from their posts).
-- user_id | username      | total_likes_received
-- -------- | ------------- | --------------------
-- 1        | rajesh_dev    | 12
-- 2        | priya_design  | 14
-- 3        | amit_tech     | 12
-- 4        | sneha_photo   | 15
-- 5        | vikram_code   | 10
-- 6        | anjali_food   | 20


-- Q10. Show the TOP 3 posts by likes_count.
-- post_id | content                    | likes_count
-- -------- | -------------------------- | -----------
-- 7        | Homemade pasta recipe      | 20
-- 4        | Sunset photography...      | 15
-- 3        | Best practices for React... | 12


-- Q11. List all posts created on 2024-03-07.
-- post_id | username      | content
-- -------- | ------------- | ---------------------------
-- 5        | rajesh_dev    | Database indexing...
-- 6        | vikram_code   | Building REST APIs...


-- Q12. List all likes with username and post content.
-- user_id | username      | post_content
-- -------- | ------------- | ---------------------------
-- 2        | priya_design  | Just learned PostgreSQL!...
-- 3        | amit_tech     | Just learned PostgreSQL!...
-- 5        | vikram_code   | Just learned PostgreSQL!...
-- 1        | rajesh_dev    | New design system...
-- 3        | amit_tech     | New design system...
-- (and so on...)


-- Q13. List all users who have NEVER liked any post.
-- user_id | username
-- -------- | ------------
-- 4        | sneha_photo
-- 6        | anjali_food


-- Q14. For each topic, show the average likes_count of posts.
-- topic_id | topic_name   | avg_likes
-- --------- | ------------ | ---------
-- 1        | Technology   | 8.5
-- 2        | Design       | 7.0
-- 3        | Photography  | 15.0
-- 4        | Food         | 20.0


-- Q15. List all posts that have comments but have likes_count < 10.
-- post_id | content                    | likes_count | comments_count
-- -------- | -------------------------- | ----------- | --------------
-- 1        | Just learned PostgreSQL!... | 5           | 2
-- 5        | Database indexing...        | 7           | 1
-- 8        | Color theory basics         | 6           | 1


-- Q16. Show all users with average likes_count of their posts.
-- user_id | username      | avg_likes
-- -------- | ------------- | ---------
-- 1        | rajesh_dev    | 6.0
-- 2        | priya_design  | 7.0
-- 3        | amit_tech     | 12.0
-- 4        | sneha_photo   | 15.0
-- 5        | vikram_code   | 10.0
-- 6        | anjali_food   | 20.0


-- Q17. List all posts that have comments but author has NOT liked their own post.
-- post_id | content                    | author_username
-- -------- | -------------------------- | --------------
-- (Need to check if author liked their own post - in this dataset, users don't like their own posts, so all posts qualify)


-- Q18. For each user, show the total number of comments they have made.
-- user_id | username      | comment_count
-- -------- | ------------- | --------------
-- 1        | rajesh_dev    | 4
-- 2        | priya_design  | 4
-- 3        | amit_tech     | 4
-- 4        | sneha_photo   | 0
-- 5        | vikram_code   | 0
-- 6        | anjali_food   | 0


-- Q19. List all users who have posted in the 'Technology' topic.
-- user_id | username
-- -------- | -------------
-- 1        | rajesh_dev
-- 3        | amit_tech
-- 5        | vikram_code


-- Q20. Users with more than 2 comments (using CTE).
-- user_id | username      | comment_count
-- -------- | ------------- | --------------
-- 1        | rajesh_dev    | 4
-- 2        | priya_design  | 4
-- 3        | amit_tech     | 4


-- Q21. List all posts that have been liked by more than 5 users.
-- post_id | content                    | like_count
-- -------- | -------------------------- | -----------
-- 3        | Best practices for React... | (check likes table)
-- 4        | Sunset photography...      | (check likes table)
-- 7        | Homemade pasta recipe      | (check likes table)


-- Q22. Show the topic with the highest average likes_count per post.
-- topic_id | topic_name | avg_likes
-- --------- | ---------- | ---------
-- 4        | Food       | 20.0


-- Q23. List all users who have created posts but have NEVER received any likes.
-- user_id | username
-- -------- | ------------
-- (None - all users who created posts have received likes)


-- Q24. For each post, show how many comments it has (from comments table).
-- post_id | content                    | comment_count
-- -------- | -------------------------- | --------------
-- 1        | Just learned PostgreSQL!... | 2
-- 2        | New design system...        | 3
-- 3        | Best practices for React... | 2
-- 4        | Sunset photography...      | 2
-- 5        | Database indexing...       | 1
-- 6        | Building REST APIs...      | 1
-- 7        | Homemade pasta recipe      | 2
-- 8        | Color theory basics        | 1


-- Q25. List all users who have liked posts but have NEVER created any post.
-- user_id | username
-- -------- | ------------
-- (None - all users who liked posts have also created posts)

