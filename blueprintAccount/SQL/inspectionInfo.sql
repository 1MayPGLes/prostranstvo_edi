SELECT id_ins, date_ins, verdict, inits, id_mc
FROM inspection
JOIN doctor USING(id_doc)
JOIN med_card USING(id_mc)
WHERE passport_pat = '$inputPatient'
ORDER BY date_ins DESC