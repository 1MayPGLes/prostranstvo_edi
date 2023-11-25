SELECT passport_pat AS user_id, NULL AS user_group
FROM patient
WHERE login ='$login' and password = '$password'