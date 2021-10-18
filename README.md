# Stargazer list

Realizzare un’applicazione iOS per iPhone in Swift o Swift-UI a tua scelta, che permetta di visualizzare l’elenco degli stargazer di un repository su GitHub.

Le funzionalità devono essere le seguenti:

* L’utente deve poter inserire proprietario e nome del repository
* In funzione di proprietario e nome del repository, l’applicazione mostrerà la lista degli stargazers
* Ciascun elemento della lista conterrà avatar e nome utente dello stargazer

La documentazione dell'API GitHub per recuperare la lista degli stargazer è disponibile presso https://docs.github.com/en/rest/reference/activity#list-stargazers.

### Sviluppo

Per la realizzazione dell'esercizio ho preferito utilizzare il pattern MVC al posto del pattern MVVM per evitare di allungare i tempi di sviluppo del progetto. A questo ho unito un'implementazione molto basilare del pattern Coordinator per la gestione della navigazione.

Per la gestione delle chiamate API ho utilizzato la libreria [**Alamofire**](https://github.com/Alamofire/Alamofire) e per il download delle immagini invece ho utilizzato la libreria [**Kingfisher**](https://github.com/onevcat/Kingfisher), due librerie che uso di frequente nei progetti che realizzo.

Per la gestione delle dipendenze ho utilizzato **Cocoapods**.

Non ho creato classi per la gestione delle chiamate di rete, avendo una sola chiamata da effettuare all'interno del progetto.

In assenza di direttive grafiche e di mockup, ho preferito mantenere una UI molto basilare. Non ho utilizzato il framework SwiftUI poiché ad oggi non ho avuto tempo di studiarlo in maniera approfondita, avendo letto solo qualcosa di tanto in tanto.