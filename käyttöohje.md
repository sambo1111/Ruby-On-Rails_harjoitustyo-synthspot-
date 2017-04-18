# Käyttöohje

## 1. Käyttäjän ja profiilin hallinta

### 1.1 Käyttäjän luominen
Käyttäjän luominen tapahtuu sivun oikeassa ylälaidassa olevasta "Sign Up" linkistä. Käyttäjän tulee syöttää kenttään haluamansa käyttäjätunnus ja salasana (2 kertaa). Tietojen syöttämisen jälkeen paina "Create User" nappia, jotta käyttäjä tallentuu tietokantaan.

### 1.2 Sisäänkirjautuminen
Kun käyttäjätunnus on luotu, voi käyttäjä kirjautua sisään tunnuksellaan sivun oikeassa ylälaidassa olevasta "Sign In" linkistä.

### 1.3 Uloskirjautuminen
Käyttäjän uloskirjautuminen tapahtuu sivun oikeassa ylälaidassa olevasta napista "Sign Out"

### 1.3 Instrumenttien lisääminen käyttäjäkohtaiseen studiokokoonpanoon
Käyttäjä voi halutessaan lisätä henkilökohtaiseen, käyttäjän profiilisivulla esitettävään, studiokokoonpanoonsa instrumentteja menemällä omalle profiilisivulleen sivun oikeassa ylälaidassa olevasta linkistä "My User" ja painamalla linkkiä "Add Instrument to Studio".

Sivulla on dropdown-painike, jota painamalla avautuu lista tietokannassa olevista instrumenteista. Käyttäjä voi valita haluamansa instrumentin näistä vaihtoehdoista ja lisätä sen studiokokoonpanoonsa painamalla nappia "Create User Instrument".

Tämän jälkeen käyttäjä uudelleenohjataan omalle profiilisivulleen.

## 2. Arvostelun kirjoittaminen (review)
Käyttäjä voi kirjoittaa arvosteluja tietokannassa oleville instrumenteille menemällä arvosteltavan instrumentin sivulle ja painamalla sivun alalaidassa olevaa nappia "Write a review".

Arvostelusivulla käyttäjä kirjoittaa arvostelun aiheen kenttään "Topic" ja leipätekstin kohtaan "Body". Käyttäjän tulee myös antaa arvostelun kohteelle arvosana asteikolla 1 - 10.

Arvostelun tallentaminen tapahtuu painamalla nappia "Create a review". Napin painamisen jälkeen käyttäjä uudelleenohjataan arvostelun kohteen sivulle.

## 3. Viestien lähettäminen (message)
Käyttäjä voi lähettää toiselle käyttäjälle henkilökohtaisia viestejä siirtymällä omaan postilaatikkoonsa sivun oikeassa ylälaidassa olevasta linkistä "Messages" ja painamalla nappia "New Message".

Viestinlähetys-sivulla käyttäjä syöttää viestin aiheen kenttään "Topic" ja viestin sisällön kenttään "Body". Tämän jälkeen käyttäjä syöttää viestin vastaanottajan nimen kenttään "Receiver name" ja painaa nappia "Create Message".

Viestin lähettäminen luo molemmille osapuolille kopion lähetetystä viestistä ja käyttäjä uudelleenohjataan postilaatikkoonsa.

## 4. Ehdotuksen lähettäminen ylläpidolle (suggestion)
Jos käyttäjä kokee, että tietokannasta puuttuu joitain instrumentteja, voi hän kirjoittaa tietokannan ylläpitäjille ehdotuksen lisättävästä instrumentista painamalla sivun vasemmassa ylälaidassa olevaa, "Instruments"-linkin vasemmalla puolella sijaitsevaa, logoa.

Ehdotuksen luomis-sivulla käyttäjä syöttää ehdotuksen aiheen kenttään "Topic" ja ehdotuksen sisällön kenttään "Info", jonka jälkeen käyttäjä lähettää ehdotuksen ylläpidon tarkasteltavaksi painamalla nappia "Create Suggestion".

Tämän jälkeen käyttäjä ohjataan omalle profiilisivulleen.

## 5. Instrumenttikokoonpanojen hallinta

### 5.1 Luominen
Käyttäjä voi luoda instrumenttikokoonpanon siirtymällä instrumenttikokoonpanojen sivulle linkistä "Instrument Setups" ja painamalla nappia "New Instrument Setup".

Instrumenttikokoonpanon nimi syötetään kenttään "Name" ja kuvaus kenttään "Info". Tietokantakohteen tallennus tapahtuu painamalla nappia "Create Instrument Setup"

### 5.2 Instrumenttien ja tagien lisääminen kokoonpanoon
Käyttäjä voi lisätä kokoonpanoon instrumentteja siirtymällä kokoonpanonsa sivulle ja painamalla nappia "Edit your setup".

Sivulle avautuva näkymä sisältää dropdown-valikon tietokannassa olevista instrumenteista, joista käyttäjä voi valita lisättävän instrumentin. Instrumentin tallennus kokoonpanoon tapahtuu painamalla nappia "Create Setup Instrument".

Näkymässä käyttäjä voi myös lisätä tageja kokoonpanolle kirjoittamalla tagin nimen kenttään "Add Tag" ja painamalla nappia "Create Tag".

## 5. Administraattorin toiminnot
Seuraavat toiminnot vaativat admin-käyttäjätunnuksen

### 5.1 Tietokantakohteiden lisääminen

#### 5.1.1 Instrument
Instrumenttien lisääminen tietokantaan tapahtuu menemällä instrumenttien sivulle navigaatiopalkin linkistä "Instrument" ja painamalla nappia "New Instrument".

Lisättävän instrumentin nimi syötetään kenttään "Name", julkaisuvuosi kenttään "Year" ja instrumentin kuvaus kenttään "Info".
Instrumenttiin voi liittää myös kuvan syöttämällä kuvan url-linkin kenttään "Image Link". Instrumentin valmistaja valitaan "Manufacturer"-dropdown painikkeesta ja instrumentin tyyppi "Type"-dropdown painikkeesta. Ttietokantakohteen tallennus tapahtuu painamalla nappia "Create Instrument".

#### 5.1.2 Manufacturer
Valmistajien lisääminen tietokantaan tapahtuu menemällä valmistajien sivulle navigaatiopalkin linkistä "Manufacturer" ja painamalla nappia "New Manufacturer".

Lisättävän valmistajan nimi syötetään kenttään "Name", perustamisvuosi kenttään "Year" ja valmistajan kuvaus kenttään "Info". Tietokantakohteen tallennus tapahtuu painamalla nappia "Create Manufacturer".

#### 5.1.3 Type
Instrumenttityypin lisääminen tietokantaan tapahtuu menemällä tyyppien sivulle navigaatiopalkin linkistä "Type" ja painamalla nappia "New Type".

Lisättävän tyypin nimi syötetään kenttään "Name" ja tyypin kuvaus kenttään "Info". Tietokantakohteen tallennus tapahtuu painamalla nappia "Create Type".

### Ehdotusten tarkastelu ja poistaminen (suggestion)
Käyttäjien lähettämät ehdotukset löytyvät sivulta "Suggestions". Ehdotusta voi tarkastella ja sen voi poistaa ehdotuksen sivulta, johon pääsee klikkaamalla ehdotuksen aihetta.

