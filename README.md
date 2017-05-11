[![Build Status](https://travis-ci.org/sambo1111/synthspot.png)](https://travis-ci.org/sambo1111/synthspot)

[![Coverage Status](https://coveralls.io/repos/github/sambo1111/synthspot/badge.svg?branch=master)](https://coveralls.io/github/sambo1111/synthspot?branch=master)

#### ADMIN KÄYTTÄJÄTUNNUS: tunnus/salasana: admin/iamgod
- [Linkki heroku-sovellukseen](https://morning-castle-98652.herokuapp.com)
- [Käyttöohje](https://github.com/sambo1111/synthspot/blob/master/k%C3%A4ytt%C3%B6ohje.md)

# 1. Projektin kuvaus
Sovellus on tietokanta musiikkilaitteille(esim. rumpukoneet, syntetisaattorit) ja niiden valmistajille. Sovelluksen tarkoitus on siis tarjota käyttäjillä tietoa eri musiikkilaitteista, niiden käyttötarkoituksista ja historiasta.

Käyttäjät voivat tehdä oman omalle profiilisivulleen omaa studiotaan vastaavan studiosetupin tietokannassa olevista instrumenteista. He voivat myös selata muiden käyttäjien studiosetuppeja. Käyttäjien toimitoihin kuuluu myös laitteiden arviointi (review), jossa käyttäjä kirjoittaa oman kokemuksensa laitteesta. Muut voivat lukea näitä arvosteluja.

Käyttäjät voivat myös luoda tiettyyn käyttötarkoitukseen perustuvia laitesetuppeja (eri asia kuin studiosetup). Tällainen käyttötarkoitus voi olla esimerkiksi setuppi jonkin tietynlaisen musiikin tuottamiseen. Muut käyttäjät voivat tykätä näistä laitesetupeista.

...

# 2. Testaus
Testaus toteutetaan rspecillä ja capybaralla.

# 3. API Integraatio
Sovelluksessa on käytössä Ebay API. API on integroitu sovellukseen siten, että kun käyttäjä painaa jonkun instrumentin sivulla olevaa linkkiä "View Ebay Deals", tekee sovellus kyselyn rajapintaan. Kysely sisältää hakusanana instrumentin nimen ja kysely on kohdistettu Ebay:n tuotekategoriaan "Synthesizers". Kysely palauttaa listan kauppoja (deals), jotka vastaavat kyselyyn syötettyjä tietoja.

# 4. Luokkakaavio
![alt text](https://github.com/sambo1111/synthspot/blob/master/luokkakaavio_v2.jpg)

...

# 5. Tuntikirjanpito
|Pvm|Tunnit|
|---|------|
|16.3|6h|
|17.3|4h|
|21.3|5h|
|22.3|4h|
|28.3|4h|
|29.3|4h|
|30.3|3h|
|03.4|4h|
|04.4|3h|
|05.4|2h|
|11.4|4h|
|12.4|2h|
|18.4|3h|
|19.4|2h|
|24.4|4h|
|30.4|3h|
