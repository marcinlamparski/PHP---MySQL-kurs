# 1.3 Podstawy SQL

## 📚 Teoria

SQL (Structured Query Language) to język do komunikacji z bazami danych. Pozwala na pobieranie, wstawianie, aktualizowanie i usuwanie danych.

### Podstawowe polecenia SQL:
- **SELECT** — pobieranie danych
- **INSERT** — wstawianie danych
- **UPDATE** — aktualizowanie danych
- **DELETE** — usuwanie danych

## 🗄️ Nasza baza danych

W tym kursie pracujemy z bazą firmy kurierskiej zawierającą 3 tabele:

| Tabela | Opis |
|--------|------|
| **Samochody** | Pojazdy firmy (marka, model, przebieg, nr rejestracyjny) |
| **Kierowcy** | Pracownicy (imię, nazwisko, PESEL) |
| **Zlecenia** | Zlecenia dostawy (data, kierowca, samochód, opis) |

## 📖 SELECT — Pobieranie danych

### Podstawowa składnia:

```sql
SELECT kolumna1, kolumna2 FROM tabela;
```

### Przykłady:

```sql
-- Pobierz wszystkie kolumny z tabeli Samochody
SELECT * FROM Samochody;

-- Pobierz tylko marki i modele
SELECT marka, model FROM Samochody;

-- Pobierz dane kierowców
SELECT imie, nazwisko FROM Kierowcy;
```

### WHERE — warunkowe pobieranie

Filtrowanie wyników:

```sql
-- Pobierz samochody marki Toyota
SELECT * FROM Samochody WHERE marka = 'Toyota';

-- Pobierz kierowców, których imię to "Piotr"
SELECT * FROM Kierowcy WHERE imie = 'Piotr';

-- Pobierz pojazdy z przebiegiem powyżej 100000 km
SELECT * FROM Samochody WHERE przebieg > 100000;
```

### LIKE — wyszukiwanie po tekście

```sql
-- Pobierz samochody, których marka zaczyna się na "V"
SELECT * FROM Samochody WHERE marka LIKE 'V%';

-- Pobierz samochody zawierające "Golf"
SELECT * FROM Samochody WHERE model LIKE '%Golf%';
```

### ORDER BY — sortowanie

```sql
-- Posortuj samochody po marce (A→Z)
SELECT * FROM Samochody ORDER BY marka ASC;

-- Posortuj od największego przebiegu
SELECT * FROM Samochody ORDER BY przebieg DESC;
```

### LIMIT — ograniczenie wyników

```sql
-- Pobierz tylko pierwszych 5 samochodów
SELECT * FROM Samochody LIMIT 5;

-- Pobierz 3 samochody zaczynając od 2. rekordu
SELECT * FROM Samochody LIMIT 1, 3;
```

## 🎯 Praktyka

### Ćwiczenie 1.3.1: Pierwsze zapytania SQL

1. Otwórz phpMyAdmin: `http://localhost/phpmyadmin`
2. Zaloguj się (domyślnie użytkownik: `root`, hasło: puste)
3. Kliknij na bazę `kurier`
4. Kliknij zakładkę **SQL**
5. Wpisz i wykonaj następujące zapytania:

```sql
-- Zobaczysz wszystkie samochody
SELECT * FROM Samochody;
```

Następnie spróbuj:

```sql
-- Samochody marki Toyota
SELECT * FROM Samochody WHERE marka = 'Toyota';
```

```sql
-- Kierowcy posortowani alfabetycznie
SELECT * FROM Kierowcy ORDER BY nazwisko ASC;
```

## ➕ INSERT — Wstawianie danych

### Składnia:

```sql
INSERT INTO tabela (kolumna1, kolumna2) VALUES (wartość1, wartość2);
```

### Przykład:

```sql
-- Wstaw nowy pojazd
INSERT INTO Samochody (marka, model, przebieg, nr_rejestracyjny) 
VALUES ('Nissan', 'Qashqai', 150000, 'WZ 1234A');

-- Wstaw nowego kierowcę
INSERT INTO Kierowcy (imie, nazwisko, pesel) 
VALUES ('Jan', 'Kowalski', '92345678901');
```

## 🔄 UPDATE — Aktualizowanie danych

### Składnia:

```sql
UPDATE tabela SET kolumna = nowa_wartość WHERE warunek;
```

### Przykład:

```sql
-- Zmień przebieg samochodu o ID 1
UPDATE Samochody SET przebieg = 125000 WHERE id_samochodu = 1;

-- Zmień model pojazdu
UPDATE Samochody SET model = 'Corrola' WHERE marka = 'Toyota';
```

⚠️ **WAŻNE**: Zawsze używaj WHERE! Bez WHERE zmienisz WSZYSTKIE rekordy!

## ❌ DELETE — Usuwanie danych

### Składnia:

```sql
DELETE FROM tabela WHERE warunek;
```

### Przykład:

```sql
-- Usuń samochód o ID 1
DELETE FROM Samochody WHERE id_samochodu = 1;

-- Usuń kierowcę o imieniu Jan
DELETE FROM Kierowcy WHERE imie = 'Jan';
```

⚠️ **WAŻNE**: Zawsze używaj WHERE! Bez WHERE usuniesz WSZYSTKIE rekordy!

## 🎯 Praktyka

### Ćwiczenie 1.3.2: Operacje INSERT, UPDATE, DELETE

W phpMyAdmin, w zakładce SQL wykonaj:

```sql
-- Dodaj nowy samochód (wymyśl sobie wartości)
INSERT INTO Samochody (marka, model, przebieg, nr_rejestracyjny) 
VALUES ('BMW', 'X5', 50000, 'WA 9999X');

-- Sprawdź czy został dodany
SELECT * FROM Samochody WHERE marka = 'BMW';
```

```sql
-- Zaktualizuj przebieg
UPDATE Samochody SET przebieg = 55000 WHERE marka = 'BMW';

-- Sprawdź zmianę
SELECT * FROM Samochody WHERE marka = 'BMW';
```

```sql
-- Usuń samochód
DELETE FROM Samochody WHERE marka = 'BMW';

-- Sprawdź czy jest usunięty
SELECT * FROM Samochody WHERE marka = 'BMW';
```

## 📊 Zaawansowane — JOINy (krótko)

Łączenie danych z wielu tabel:

```sql
-- Pobierz informacje o zleceniach z danymi kierowcy i samochodu
SELECT Zlecenia.*, Kierowcy.imie, Kierowcy.nazwisko, Samochody.marka
FROM Zlecenia
JOIN Kierowcy ON Zlecenia.id_kierowcy = Kierowcy.id_kierowcy
JOIN Samochody ON Zlecenia.id_samochodu = Samochody.id_samochodu;
```

(Więcej o JOINach w module 5)

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Podstawowych poleceń SQL (SELECT, INSERT, UPDATE, DELETE)
- ✅ Filtrowania danych (WHERE)
- ✅ Sortowania (ORDER BY)
- ✅ Wstawiania, aktualizowania i usuwania rekordów

**Przejdź do 1.4 aby nauczyć się narzędzi do pracy z bazą!**
