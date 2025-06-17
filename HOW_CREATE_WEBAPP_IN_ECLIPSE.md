# Come creare una web app in Eclipse

E' necessario che prima sia stato configurato *Eclipse* aggiungendo un runtime di *Tomcat* per l'esecuzione delle Servlet e JSP. Vedi: 
* [Come configurare eclipse per sviluppare web app](./HOW_CONFIGURE_SERVER_IN_ECLIPSE.md)

## Creazione di TutorialWebApp 

Dal menù di *Eclipse* selezioniamo *File* / *New* / *Dynamic Web Project*:  

![Step A](./img/step_A.PNG)

Nel campo *Project name* scriviamo *TutorialWebApp*, il nome che vogliamo dare alla nostra web app:  

![Step B](./img/step_B.PNG)

![Step C](./img/step_C.PNG)

Come *Context root* propone già *TutorialWebApp*:  

![Step D](./img/step_D.PNG)

Ecco creato il progetto con la struttura per la web app:  

![Step E](./img/step_E.PNG)

## Aggiunta di una servlet

A questo punto aggiungiamo una servlet che chiamimao *WellcomeServlet*: selezionando il progetto *TutorlaWebApp*, premendo il tasto destro, compare un menù; selezioniamo *New* / *Servlet*:  

![Step F](./img/step_F.PNG)

Compare una finestra pre crare una servlet:  

![Step G](./img/step_G.PNG)

In *Class name* inseriamo il nome della servlet, nel nostro caso *WellcomeServlet*:

![Step H](./img/step_H.PNG)

![Step I](./img/step_I.PNG)

![Step J](./img/step_J.PNG)

Al termine dei varei step viene creato lo scheletro della servlet *WellcomeServlet*:  

![Step K](./img/step_K.PNG)

## Esecuzione della web app

Selezionando il progetto *TutorlaWebApp*, premendo il tasto destro, compare un menù; selezioniamo *Run as* / *Run on Server*:

![Step run 1](./img/step_run_1.PNG)

![Step run 2](./img/step_run_2.PNG)

![Step run 3](./img/step_run_3.PNG)

![Step run 4](./img/step_run_4.PNG)

Ora possiamo accedere alla servlet digitando la seguente url nel browser:

http://localhost:8080/TutorialWebApp/WellcomeServlet

## Aggiunta di una JSP

Con una procedura molto simile aggiungiamo una JSP, *hello.jsp*.

![](./img/step_M.PNG)

![](./img/step_N.PNG)

![](./img/step_O.PNG)

http://localhost:8080/TutorialWebApp/hello.jsp

Aggiungiamo del codice Java per rendere un po' dinamico l'output della JSP:

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= new java.util.Date() %>
</body>
</html>
```





