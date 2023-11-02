SELECT user_id, user_group
FROM internal_user
WHERE user_login ="$login" AND user_password ="$password"