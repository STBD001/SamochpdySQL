NAPISZ ZAPYTANIA, KTÓRE WYJMĄ Z BAZY NASTĘPUJĄCE INFORMACJE:

1. Imię i nazwisko (tylko te dwie dane) klienta numer 4.
ROZWIĄZANIE: SELECT imie, nazwisko 
from klienci
WHERE idklienta=4

2. Wszystkie dane samochodów z rocznika 2010.
ROZWIĄZANIE: SELECT idauta, marka, model, przebieg, rocznik, kolor, ubezpieczenie
from auta
WHERE rocznik=2010

3. Wszystkie dane na temat samochodów marki Ford posiadanych przez nas
(innymi słowy: "jakie mamy auta marki Ford w firmie i co o nich wiemy?").
ROZWIĄZANIE: SELECT idauta, model, przebieg, rocznik, kolor, ubezpieczenie, marka
FROM auta
WHERE marka = 'Ford';

4. Samochody o numerach w bazie od 2 do 4 włącznie
ROZWIĄZANIE: SELECT *
FROM auta
WHERE idauta BETWEEN 2 and 4

5. Imiona i nazwiska klientów, którzy mieszkają w Katowicach na ulicy Rolnej (pod
dowolnym numerem).
ROZWIĄZANIE: SELECT *
FROM klienci
INNER JOIN wypozyczenia ON klienci.idklienta = wypozyczenia.idklienta
INNER JOIN auta ON wypozyczenia.idauta = auta.idauta
WHERE klienci.adres LIKE '%Rolna%';

6. Samochód w bazie (marka, model), którego ubezpieczenie jest najdroższe z
wszystkich aut.
ROZWIĄZANIE: SELECT marka, model
FROM auta
ORDER BY ubezpieczenie ASC LIMIT 1

7. Samochód (idauta, marka, model), który został najwcześniej wypożyczony
(decyduje datawyp).
ROZWIĄZANIE: SELECT auta.idauta, auta.marka, auta.model, wypozyczenia.datawyp
FROM auta
INNER JOIN wypozyczenia ON auta.idauta = wypozyczenia.idauta
ORDER BY wypozyczenia.datawyp ASC
LIMIT 1;

8. Imiona i nazwiska osób, które wypożyczyły kiedykolwiek samochód nr 1.
ROZWIĄZANIE: SELECT klienci.imie, klienci.nazwisko, wypozyczenia.idauta
FROM klienci
INNER JOIN wypozyczenia ON klienci.idklienta = wypozyczenia.idklienta
WHERE idauta=1

9. Jakie auta (marka, model) kiedykolwiek wypożyczyła u nas osoba nr 4?
ROZWIĄZANIE: SELECT auta.model, auta.marka, klienci.idklienta, wypozyczenia.idklienta, wypozyczenia.idauta
FROM auta
INNER JOIN wypozyczenia ON auta.idauta = wypozyczenia.idauta
INNER JOIN klienci ON klienci.idklienta = wypozyczenia.idklienta
WHERE klienci.idklienta=4

10. Jakie auta (marka, model) kiedykolwiek wypożyczyła u nas osoba o nazwisku
"Pastewniak"?
ROZWIĄZANIE: SELECT auta.model, auta.marka, klienci.nazwisko, klienci.idklienta, wypozyczenia.idklienta, wypozyczenia.idauta, wypozyczenia.datawyp
FROM auta
INNER JOIN wypozyczenia ON auta.idauta = wypozyczenia.idauta
INNER JOIN klienci ON klienci.idklienta = wypozyczenia.idklienta
WHERE klienci.nazwisko LIKE "Pastewniak" 



