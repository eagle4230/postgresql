CREATE TYPE contacts AS (phone VARCHAR(15), email VARCHAR(120));

ALTER TABLE users ADD COLUMN user_contacts contacts;

UPDATE users SET user_contacts = (users.phone, users.email);

UPDATE users SET user_contacts.email = 'test@somemail.ru' WHERE id = 18;
