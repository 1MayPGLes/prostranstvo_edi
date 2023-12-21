SELECT passport_pat, inits, address, birth_date, id_mc, diagnosis, admission_date, discharge_date, id_doc, id_ward
FROM patient JOIN med_card USING(passport_pat)
WHERE admission_date = '$inputDate'