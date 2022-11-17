 //////////////////////////////////////////
////-------------------------------------                   
///    Esercitazione JAVA EE
//--------------------------------------                   
////////////////////////////////////////

--------------------
# Dati Amministratori 
--------------------
- nomeadmin
- cognomeadmin
- codadmin

-----------
# Dati Corsi  
-----------
- codcorso
- nomecorso
- datainiziocorso
- datafinecorso
- costocorso
- commenticorso
- aulacorso

-------------
# Dati Corsisti 
-------------
- nomecorsista
- cognomecorsista
- codcorsista
- precedentiformativi


-------------
# Dati Docenti   
-------------
- nomedocente
- cognomedocente
- cvdocente
- coddocente

Vincoli :  
- [x] 1 corso => 1 docente
- [x] I dati dell'amministratore e del docente sono presenti nel DB. Non verranno inseriti della WEBAPP.


Realizzare una applicazione web con le seguenti caratteristiche:


1) 
- [x] All'avvio dell'applicazione ( pagina index ) viene presentata all'utente una pagina di inserimento utente e codice amministratore.
- [x] I dati inseriti devono essere convalidati ( convalida case sensitive).
- [x] L'inserimento di una coppia di valori scorretta genera un messaggio di errore, dopo il quale l'utente pu� reinserire i dati per un massimo di 5 volte. Il superamento di tale limite reindirizza a una pagina di errore con il messaggio "numero di tentativi esauriti".

2) 
- [x] Se i dati inseriti sono corretti viene presentata la lista dei corsisti attualmente iscritti ai corsi e i dati della sessione dell'admin devono essere salvati.

3) 
Nella pagina devono comparire 3 pulsanti:

- [ ] pulsante inserisci: inserisce un nuovo corsista
- [x] La pagina successiva deve visualizzare il nuovo dato inserito e i dati attualmente presenti nella base dati. ( Per ogni corso ci possono essere un massimo di 12 iscritti ).
 

I dati inseriti per il discente devono passare le seguenti convalide lato server:
- [ ] a) nome corsista (obbligatorio, stringa, max 30 caratteri, no numeri)
- [ ] b) cognome corsista (obbligatorio, stringa, max 30 caratteri, no numeri)
- [ ] c) nome corso (obbligatorio, stringa, max 30 caratteri, no numeri )
- [ ] d) data inizio ( obbigatorio, formato valido DD/MM/YYYY ) 
- [ ] e) data fine ( obbigatorio, formato valido DD/MM/YYYY ) - Il corso deve durare minimo 2gg
- [ ] f) commenti ( stringa lunghezza max 200 caratteri )
- [ ] g) precedenti formativi ( campo SI/NO, radio button )
- [ ] h) aulacorso ( stringa, numeri e lettere, lunghezza max 30 )
- [ ] i) docente ( deve essere presente nel database ) - utilizzare una select per associare il corso al docente

- [ ] pulsante visualizza statistiche: apre una pagina in cui vengono riepilogate le seguenti informazioni relative ai record gi� memorizzati:
- [x] I.    Numero corsisti totali. fatto
- [x] II.   Nome del corso pi� frequentato fatto
- [x] III.  Data di inizio ultimo corso fatto
- [x] IV.   Durata media dei corsi ( in giorni lavorativi ) fatto
- [x] V.    Numero di commenti presenti fatto
- [x] VI.   Elenco corsisti fatto
- [x] VII.  Docente che pu� tenere pi� tipologie di corso fatto fatto
- [x] VIII. Corsi con posti disponibili 12

- [ ] Al punto VI. cliccando sul nome del corsista si deve aprire la pagina contenente il riepilogo con le informazioni dei corsi da lui frequentati.

- [x] - pulsante elimina corsi - apre una pagina in cui vengono elencati tutti i corsi disponibili con data maggiore alla data odierna. 
- [x] Il sistema deve permettere di scegliere i corsi da cancellare ( ovviamente i relativi dati associati verranno eliminati ). 

- [x] 4) In tutte le pagine deve essere presente in alto a destra il nome dell'utente amministratore e un pulsante per effettuare il logout. 
- [x] Il logout far� un redirect alla pagina di index
- [x] Salvare i dati dell'amministratore tramite dei cookie in modo che il login rimanga attivo fino all'esplicito logout.

- [ ] Consegnare archivio del progetto