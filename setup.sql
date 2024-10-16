DROP DATABASE IF EXISTS passwords_db;
CREATE DATABASE passwords_db;
USE passwords_db;


SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('mySuperSecretPassphrase', 512)); -- Secure encryption key
SET @init_vector = RANDOM_BYTES(16); -- Initialization vector

CREATE TABLE IF NOT EXISTS passwords (
    id INT AUTO_INCREMENT PRIMARY KEY,
    website_name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    username VARCHAR(150),
    email VARCHAR(255),
    password VARBINARY(255), 
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO passwords (website_name, url, first_name, last_name, username, email, password, comment)
VALUES (
    'Google', 
    'https://google.com', 
    'Ken', 
    'David', 
    'KenD', 
    'kenD@gmail.com', 
    AES_ENCRYPT('EzP@sswrd', @key_str, @init_vector), 
    'Google account pass'
);
