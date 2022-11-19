-- Inserimento amministratori:

insert into amministratore values('41H81aa3154%294daL42s3dW4d7f9u86940pd2Qdc$5b286Z', 'admin1', 'admin1'); --A001
insert into amministratore values('40H74aae1e5%bb46dLe6s1bW3572fu6b998pd4Q54$662e8Z', 'admin2', 'admin2'); --A002

-- Inserimento docenti:

insert into docente values(1, 'Marco', 'Zanchetta','MarcoZanchetta.pdf');
insert into docente values(2, 'Gabriele', 'Maniaci','GabrieleManiaci.pdf');
insert into docente values(3, 'GianBattista', 'Lorenzato', 'GianBattistaLorenzato.pdf');
insert into docente values(4, 'Lucas', 'Teixeira', 'LucasTeixeira.pdf');
insert into docente values(5, 'Alvise', 'Battistich', 'AlviseBattistich.pdf');


insert into corsista values(1001, 'Nome1', 'Cognome1', 0);
insert into corsista values(1002, 'Nome2', 'Cognome2', 1);
insert into corsista values(1003, 'Nome3', 'Cognome3', 0);
insert into corsista values(1004, 'Nome4', 'Cognome4', 1);
insert into corsista values(1005, 'Nome5', 'Cognome5', 0);
insert into corsista values(1006, 'Nome6', 'Cognome6', 1);
insert into corsista values(1007, 'Nome7', 'Cognome7', 1);
insert into corsista values(1008, 'Nome8', 'Cognome8', 1);
insert into corsista values(1009, 'Nome9', 'Cognome9', 0);
insert into corsista values(1010, 'Nome10', 'Cognome10', 0);
insert into corsista values(1011, 'Nome11', 'Cognome11', 1);
insert into corsista values(1012, 'Nome12', 'Cognome12', 0);
insert into corsista values(1013, 'Nome13', 'Cognome13', 0);
insert into corsista values(1014, 'Nome14', 'Cognome14', 1);
insert into corsista values(1015, 'Nome15', 'Cognome15', 0);
insert into corsista values(1016, 'Nome16', 'Cognome16', 1);
insert into corsista values(1017, 'Nome17', 'Cognome17', 0);
insert into corsista values(1018, 'Nome18', 'Cognome18', 1);
insert into corsista values(1019, 'Nome19', 'Cognome19', 1);
insert into corsista values(1020, 'Nome20', 'Cognome20', 1);
insert into corsista values(1021, 'Nome21', 'Cognome21', 0);
insert into corsista values(1022, 'Nome22', 'Cognome22', 0);
insert into corsista values(1023, 'Nome23', 'Cognome23', 1);
insert into corsista values(1024, 'Nome24', 'Cognome24', 0);


insert into corso values(1001, 'Informatica',	'11-DIC-2022','10-GEN-2023', 100, 'Corso introduttivo', 'Aula1', 1);
insert into corso values(1002, 'Java', 			'10-OTT-2022','10-NOV-2022', 3000, null, 'Aula2', 2);
insert into corso values(1003, 'C#', 			'01-GEN-2023','10-FEB-2023', 1000, null, 'Aula4', 5);
insert into corso values(1004, 'JavaScript', 	'01-GEN-2023','15-FEB-2023', 4000, null, 'Aula5', 4);
insert into corso values(1005, 'HTML/CSS', 		'10-OTT-2022','10-NOV-2022', 3520, null, 'Aula4', 1);
insert into corso values(1006, 'Angular', 		'01-GEN-2023','10-FEB-2023', 1600, null, 'Aula4', 1);
insert into corso values(1007, 'React', 		'01-GEN-2023','15-FEB-2023', 1075, null, 'Aula5', 1);


insert into corso_corsista values(1001, 1001);
insert into corso_corsista values(1001, 1002);
insert into corso_corsista values(1001, 1003);
insert into corso_corsista values(1001, 1004);
insert into corso_corsista values(1001, 1005);
insert into corso_corsista values(1001, 1006);
insert into corso_corsista values(1001, 1007);
insert into corso_corsista values(1001, 1008);
insert into corso_corsista values(1001, 1009);
insert into corso_corsista values(1001, 1010);
insert into corso_corsista values(1001, 1011);
insert into corso_corsista values(1001, 1012);
insert into corso_corsista values(1002, 1022);
insert into corso_corsista values(1003, 1023);
insert into corso_corsista values(1002, 1024);
insert into corso_corsista values(1004, 1016);
insert into corso_corsista values(1003, 1016);
insert into corso_corsista values(1004, 1017);
insert into corso_corsista values(1005, 1018);
insert into corso_corsista values(1004, 1019);

