SELECT user_id, NULL AS user_group
FROM external_user
WHERE user_login ='$login' and user_password = '$password'