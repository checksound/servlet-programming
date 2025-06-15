# Come aggiungere un server Tomcat in Eclipse

Per far si che da Eclispe possiamo sviluppare web application e testarle direttamente dobbiamo configurare Eclipse.

Ora procediamo con la configurazione vera e propria di Eclipse.

## Configurazione Eclipse

Prima però dobbiamo scaricare una versione di Tomcat, dal sito ufficiale sotto download https://tomcat.apache.org/.

Una volta scaricato il file di Tomcat è sufficiente
scompattarlo in una directory a vostra scelta.

Ad esempio sotto *c:\\dev* scompattiamo lo zip ottenendo *C:\dev\apache-tomcat-11.0.4*

In seguito quando configureremo Eclipse dovremo dare questo path per permettere di utilizzare Tomcat come runtime per sviluppare la Servlet e JSP.

Dal menù di Eclipse selezionare *Window* / *Preferences*
![Step 1](./step_1.PNG)

Si apre così la finestra generale di configurazione di Eclipse:

![Step 2](./step_2.PNG)

Selezioniamo la voce *Server*:

![Step 3](./step_3.PNG)

e selezioniamo l'opzione *Runtime Environments*:
![Step 4](./step_4.PNG)

Cliccando sul bottone *Add* è possibile aggiungere un nuovo *Runtime Environment*:

![Step 5](./step_5.PNG)

A questo punto selezioniamo sotto il gruppo Apache il server Tomcat (selezioniamo Tomcat 11, l'ultima vesione):

![Step 6](./step_6.PNG)

Cliccando sul pulsante *Next >* avccediamo alla finestra per selezionare, tramite il pulsante *Browse...*, la directory d'installazione del nostro Tomcat precedentemente installato sulla macchina locale (Nel nostro caso era stato installato sotto la directory *C:\\dev*) 

![Step 6_a](./step_6_a.PNG)

![Step 6_b](./step_6_b.PNG)

![Step 6_c](./step_6_c.PNG)

Cliccando quindi sul pulsante *Finish* abbiamo quindi aggiunto il servlet container *Tomcat* che ci serve per eseguire all'interno dell'IDE le Servlet e JSP.

![Step 7](./step_7.PNG)




