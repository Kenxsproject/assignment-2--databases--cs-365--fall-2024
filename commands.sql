--Create a New Entry into the Database--
INSERT INTO passwords (website_name, url, first_name, last_name, username, email, password, comment)
VALUES ('Geico', 'http://www.geico.com/', 'Bob', 'Dole', 'BobDole', 'BobDole@genericEmail.com', AES_ENCRYPT('NewPass123', @key_str,@init_vector), 'Geico Insurance');
--Get All Password-Related Data for URLs Containing https--
SELECT 
    website_name, 
    url, 
    first_name, 
    last_name, 
    username, 
    email, 
    CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR(100)) AS decrypted_password, 
    comment
FROM  passwords
WHERE  url LIKE 'https%';
--Change Any Password--
UPDATE passwords
SET password = AES_ENCRYPT('NewGooglePass123', @key_str, @init_vector)
WHERE url = 'https://google.com';
--Remove a Tuple Based on a URL--
DELETE FROM passwords
WHERE url = 'http://www.youtube.com/';

--Get the Password Associated with the URL--
SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR(100)) AS decrypted_password
FROM passwords
WHERE url = 'http://web.snapchat.com/';
--Change a URL Associated with One of the Passwords--
UPDATE passwords
SET url = 'https://web.snapchat.com/'
WHERE url = 'http://web.snapchat.com/';
--Remove a Tuple Based on a URL--
DELETE FROM passwords
WHERE url = 'http://www.washingtonpost.com/';
--Remove a Tuple Based on a Password--
DELETE FROM passwords
WHERE AES_DECRYPT(password, @key_str,@init_vector) = 'NewGooglePass123';



