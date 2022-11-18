-- Inserimento amministratori:

insert into amministratore values('41H81aa3154%294daL42s3dW4d7f9u86940pd2Qdc$5b286Z', 'admin1', 'admin1'); --A001
insert into amministratore values('40H74aae1e5%bb46dLe6s1bW3572fu6b998pd4Q54$662e8Z', 'admin2', 'admin2'); --A002

-- Inserimento docenti:

insert into docente values(1, 'Marco', 'Zanchetta','MarcoZanchetta.pdf');
insert into docente values(2, 'Gabriele', 'Maniaci','GabrieleManiaci.pdf');
insert into docente values(3, 'GianBattista', 'Lorenzato', 'GianBattistaLorenzato.pdf');
insert into docente values(4, 'Lucas', 'Teixeira', 'LucasTeixeira.pdf');
insert into docente values(5, 'Alvise', 'Battistich', 'AlviseBattistich.pdf');


insert into corsista values(1001, 'Alfredo', 'MeGiasso', 0);
--codCorsista, nomeCorsista, cognomeCorsista, precedentiFormativi

insert into corso values(1001, 'Informatica', 	'11-DIC-2022','10-GEN-2023', 1000, 'Corso introduttivo', 'Aula1', 1);
insert into corso values(1002, 'Java', 			'10-OTT-2022','10-NOV-2022', 1000, null, 'Aula2', 1);
insert into corso values(1003, 'C#', 			'01-GEN-2023','10-FEB-2023', 1000, null, 'Aula4', 1);
insert into corso values(1004, 'JavaScript', 	'01-GEN-2023','15-FEB-2023', 1000, null, 'Aula5', 1);

