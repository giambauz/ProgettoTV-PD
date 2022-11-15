create table amministratore(
	codAdmin varchar2(500),
	constraint p_codAdmin primary key(codAdmin),
	nomeAdmin varchar2(30) not null,
	cognomeAdmin varchar2(30) not null
);

create table docente(
	codDocente int,
	constraint p_codDocente primary key(codDocente),
	nomeDocente varchar2(30) not null,
	cognomeDocente varchar2(30) not null,
	cvDocente varchar2(30) not null
);

create table corso(
	codCorso int,
	constraint p_codCorso primary key(codCorso),
	nomeCorso varchar2(30) not null,
	dataInizioCorso date not null,
	dataFineCorso date not null,
	costoCorso number(7,2) not null,
	commentiCorso varchar2(30) default 'nessun commento',
	aulaCorso varchar2(30) not null,
	codDocente int,
	constraint f_codDocente foreign key(codDocente) references docente(codDocente),
	check ((dataFineCorso-1)>dataInizioCorso)
);
	

create table corsista(
	codCorsista int,
	constraint p_codCorsista primary key(codCorsista),
	nomeCorsista varchar2(30) not null,
	cognomeCorsista varchar2(30) not null,
	precedentiFormativi number(1) not null
);

create table corso_Corsista(
	codCorso int,
	codCorsista int,
	constraint f_codCorso foreign key(codCorso) references corso(codCorso),
	constraint f_codCorsista foreign key(codCorsista) references corsista(codCorsista),
	constraint p_corso_corsista primary key(codCorso, codCorsista)
);

create sequence corso_seq;

create sequence corsista_seq;

create view frequenze(corso, totFrequenze) as
	select codCorso, count(codCorsista) 
	from corso_corsista 
	group by codCorso;

create view corsiPerDocente(docente, totCorsi) as
	select codDocente, count(codCorso) 
	from corso 
	group by codDocente;
	
create view durataCorsi(corso,durata) as
	select codCorso, dataFineCorso-dataInizioCorso
	from corso;