SELECT id_ins, date_ins, diagnosis, verdict, id_mc, id_ward
FROM inspection
JOIN med_card USING(id_mc)
WHERE id_mc='$inputMed_card'
ORDER BY id_mc