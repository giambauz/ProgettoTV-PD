-- Delete table:

drop table amministratore cascade constraint;
drop table docente cascade constraint;
drop table corso cascade constraint;
drop table corsista cascade constraint;
drop table corso_corsista cascade constraint;
drop view frequenze;
drop view corsiPerDocente;

-- Delete sequence:

drop sequence corso_seq;
drop sequence corsista_seq;