-- Clean up if you re-run
DROP TABLE IF EXISTS comments, likes, posts, users, topics CASCADE;

-- Users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE,
  full_name TEXT NOT NULL,
  bio TEXT,
  city TEXT,
  joined_date DATE NOT NULL,
  is_verified BOOLEAN DEFAULT false
);

-- Topics
CREATE TABLE topics (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT
);

-- Posts
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  topic_id INT REFERENCES topics(id),
  content TEXT NOT NULL,
  post_date TIMESTAMP NOT NULL,
  likes_count INT DEFAULT 0,
  comments_count INT DEFAULT 0,
  is_public BOOLEAN DEFAULT true
);

-- Likes (many-to-many users <-> posts)
CREATE TABLE likes (
  user_id INT REFERENCES users(id),
  post_id INT REFERENCES posts(id),
  liked_at TIMESTAMP NOT NULL,
  PRIMARY KEY (user_id, post_id)
);

-- Comments
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  post_id INT REFERENCES posts(id),
  user_id INT REFERENCES users(id),
  content TEXT NOT NULL,
  comment_date TIMESTAMP NOT NULL,
  parent_comment_id INT REFERENCES comments(id)  -- For nested comments
);

--------------------------------------------------
-- Seed Data
--------------------------------------------------

-- Users
INSERT INTO users (id, username, email, full_name, bio, city, joined_date, is_verified) VALUES
  (1, 'rajesh_dev', 'rajesh@example.com', 'Rajesh Kumar', 'Full-stack developer', 'Delhi', '2024-01-05', true),
  (2, 'priya_design', 'priya@example.com', 'Priya Sharma', 'UI/UX Designer', 'Mumbai', '2024-01-10', true),
  (3, 'amit_tech', 'amit@example.com', 'Amit Patel', 'Tech enthusiast', 'Bangalore', '2024-02-01', false),
  (4, 'sneha_photo', 'sneha@example.com', 'Sneha Reddy', 'Photography lover', 'Chennai', '2024-02-15', false),
  (5, 'vikram_code', 'vikram@example.com', 'Vikram Singh', 'Code ninja', 'Delhi', '2024-03-01', false),
  (6, 'anjali_food', 'anjali@example.com', 'Anjali Mehta', 'Food blogger', 'Pune', '2024-03-05', false);

-- Topics
INSERT INTO topics (id, name, description) VALUES
  (1, 'Technology', 'Tech news and discussions'),
  (2, 'Design', 'Design inspiration and tips'),
  (3, 'Photography', 'Photo sharing and tips'),
  (4, 'Food', 'Food recipes and reviews'),
  (5, 'Travel', 'Travel experiences');

-- Posts
INSERT INTO posts (id, user_id, topic_id, content, post_date, likes_count, comments_count, is_public) VALUES
  (1, 1, 1, 'Just learned PostgreSQL! Amazing database system.', '2024-03-05 10:00:00', 5, 2, true),
  (2, 2, 2, 'New design system launched today. Check it out!', '2024-03-05 11:30:00', 8, 3, true),
  (3, 3, 1, 'Best practices for React hooks', '2024-03-06 09:15:00', 12, 5, true),
  (4, 4, 3, 'Sunset photography from Chennai beach', '2024-03-06 18:00:00', 15, 4, true),
  (5, 1, 1, 'Database indexing explained', '2024-03-07 14:20:00', 7, 1, true),
  (6, 5, 1, 'Building REST APIs with Node.js', '2024-03-07 16:00:00', 10, 2, true),
  (7, 6, 4, 'Homemade pasta recipe', '2024-03-08 12:00:00', 20, 6, true),
  (8, 2, 2, 'Color theory basics', '2024-03-08 15:30:00', 6, 1, true);

-- Likes
INSERT INTO likes (user_id, post_id, liked_at) VALUES
  (2, 1, '2024-03-05 10:15:00'),
  (3, 1, '2024-03-05 10:20:00'),
  (5, 1, '2024-03-05 11:00:00'),
  (1, 2, '2024-03-05 11:35:00'),
  (3, 2, '2024-03-05 12:00:00'),
  (5, 2, '2024-03-05 13:00:00'),
  (1, 3, '2024-03-06 09:30:00'),
  (2, 3, '2024-03-06 10:00:00'),
  (5, 3, '2024-03-06 11:00:00'),
  (1, 4, '2024-03-06 18:15:00'),
  (2, 4, '2024-03-06 18:30:00'),
  (3, 4, '2024-03-06 19:00:00'),
  (2, 5, '2024-03-07 14:30:00'),
  (3, 5, '2024-03-07 15:00:00'),
  (1, 6, '2024-03-07 16:15:00'),
  (2, 6, '2024-03-07 16:30:00'),
  (3, 7, '2024-03-08 12:15:00'),
  (4, 7, '2024-03-08 12:30:00'),
  (5, 7, '2024-03-08 13:00:00'),
  (1, 8, '2024-03-08 15:45:00');

-- Comments
INSERT INTO comments (id, post_id, user_id, content, comment_date, parent_comment_id) VALUES
  (1, 1, 2, 'Great post!', '2024-03-05 10:20:00', NULL),
  (2, 1, 3, 'I agree!', '2024-03-05 10:25:00', 1),
  (3, 2, 1, 'Looks amazing!', '2024-03-05 11:40:00', NULL),
  (4, 2, 3, 'Can you share more details?', '2024-03-05 12:00:00', NULL),
  (5, 2, 2, 'Sure, check my profile', '2024-03-05 12:15:00', 4),
  (6, 3, 1, 'Very helpful!', '2024-03-06 09:30:00', NULL),
  (7, 3, 2, 'Thanks for sharing', '2024-03-06 10:00:00', NULL),
  (8, 4, 1, 'Beautiful shot!', '2024-03-06 18:20:00', NULL),
  (9, 4, 2, 'Love it!', '2024-03-06 18:35:00', NULL),
  (10, 5, 3, 'Good explanation', '2024-03-07 14:45:00', NULL),
  (11, 6, 1, 'Nice tutorial', '2024-03-07 16:20:00', NULL),
  (12, 7, 1, 'Recipe looks delicious!', '2024-03-08 12:10:00', NULL),
  (13, 7, 2, 'Will try this weekend', '2024-03-08 12:25:00', NULL),
  (14, 8, 3, 'Useful info', '2024-03-08 15:45:00', NULL);

