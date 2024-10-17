DROP DATABASE IF EXISTS passwords_db;
CREATE DATABASE passwords_db;
USE passwords_db;


SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('mySuperSecretPassphrase', 512)); -- Generate a secure encryption key
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
VALUES 
    ('Google', 
     'https://google.com', 
     'Ken', 
     'David', 
     'KenD', 
     'kenD@gmail.com', 
     AES_ENCRYPT('EzP@sswrd', @key_str,@init_vector), 
     'Google account pass'),

    ('Facebook', 
     'https://facebook.com', 
     'Thomas', 
     'Smith', 
     'Tomsmith', 
     'Tom.smith@gmail.com', 
     AES_ENCRYPT('MyF@cePass', @key_str,@init_vector), 
     'Facebook account password'),

    ('SnapChat',
     'http://web.snapchat.com/',
     'Bruce',
     'Wayne',
     'NotBatman',
     'worldsfinest@gmail.com',
     AES_ENCRYPT('NotB@tm@n', @key_str,@init_vector),
     'SnapChat account'),

     ('Discord',
     'https://discord.com/login',
     'Jason',
     'Todd',
     'NotRedHood',
     'SecondSon@gmail.com',
     AES_ENCRYPT('JokersDeath', @key_str,@init_vector),
     'Discord account'),

     ('Instagram',
     'https://www.instagram.com/',
     'Dick',
     'Grayson',
     'NotNightWing',
     'FlyingGraysont@gmail.com',
     AES_ENCRYPT('FlyingGrayson', @key_str,@init_vector),
     'Instagram account'),

     ('Twitter(X)',
     'https://x.com/login',
     'Tim',
     'Drake',
     'NotRedRobin',
     'TheDetective@gmail.com',
     AES_ENCRYPT('TheDrake', @key_str,@init_vector),
     'Twitter account'),

     ('FasFa',
     'https://studentaid.gov/',
     'Damian',
     'Wayne',
     'NotRobin',
     'DemonsChild@gmail.com',
     AES_ENCRYPT('B@tSon', @key_str,@init_vector),
     'FasFa account'),

     ('WashingtonPost',
     'https://www.washingtonpost.com/',
     'Clark',
     'Kent',
     'NotSuperman',
     'ManOfSteel@gmail.com',
     AES_ENCRYPT('Smallville', @key_str,@init_vector),
     'WashingtonPost account'),

     ('Youtube',
     'https://www.youtube.com/',
     'Hal',
     'Jordan',
     'NotGreenLantern',
     'BestPilot@gmail.com',
     AES_ENCRYPT('Willpower', @key_str,@init_vector),
     'youtube account'),

     ('TikTok',
     'https://www.tiktok.com/',
     'Barry',
     'Allan',
     'NotTheFlash',
     'StarLabsBA@gmail.com',
     AES_ENCRYPT('SpeedForce', @key_str,@init_vector),
     'TikTok account');