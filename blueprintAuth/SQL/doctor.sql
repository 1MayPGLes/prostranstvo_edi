SELECT id_doc AS user_id, role AS user_group
FROM doctor
WHERE login ="$login" AND password ="$password"