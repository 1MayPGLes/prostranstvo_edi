SELECT Patient.inits, TIMESTAMPDIFF(YEAR, Patient.birth_date, CURDATE()) AS age, diagnosis, doctor.inits, admission_date, discharge_date, name_dep, id_ward, id_mc
FROM Patient
JOIN med_card USING(passport_pat)
JOIN doctor USING(id_doc)
JOIN department USING(id_dep)
WHERE passport_pat = '$inputPatient'
ORDER BY admission_date DESC