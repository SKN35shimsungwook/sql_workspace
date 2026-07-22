CREATE DATABASE emotion_diary_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE emotion_diary_db;

CREATE TABLE IF NOT EXISTS diaries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    diary_date DATE NOT NULL,
    emotion_score INT NOT NULL CHECK (emotion_score BETWEEN 1 AND 5),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
