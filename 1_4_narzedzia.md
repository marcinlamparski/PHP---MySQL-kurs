# 1.4 Narzędzia: PhpMyAdmin, konsola MySQL

## 📚 Teoria

Do pracy z bazą danych MySQL mamy do dyspozycji narzędzia:

1. **PhpMyAdmin** — graficzny interfejs (najłatwiejszy dla początkujących)
2. **Konsola MySQL** — wiersz poleceń (bardziej zaawansowany)

## 🖥️ PhpMyAdmin — Narzędzie graficzne

PhpMyAdmin jest najłatwiejszy w użyciu. Jest instalowany razem z XAMPP.

### Dostęp do PhpMyAdmin

1. Uruchom Apache i MySQL w XAMPP
2. Wejdź na: `http://localhost/phpmyadmin`
3. Zaloguj się (domyślnie: użytkownik `root`, hasło puste)

### Interfejs PhpMyAdmin

| Element | Opis |
|---------|------|
| **Lewy panel** | Lista baz danych i tabel |
| **Górne menu** | Baza, Tabela, Wyszukiwanie, Eksport, Import |
| **Główny panel** | Zawartość tabeli i wyniki zapytań |

### Operacje w PhpMyAdmin

#### Przeglądanie tabeli:
1. Kliknij na bazę `kurier`
2. Kliknij na tabelę `Samochody`
3. Zobaczysz wszystkie rekordy w formacie tabelarycznym

#### Dodawanie rekordu:
1. W karcie tabel, kliknij **Wstaw** (Insert)
2. Wpisz dane
3. Kliknij **Wykonaj**

#### Edycja rekordu:
1. Kliknij ikonę **edytuj** (ołówek) przy rekordzie
2. Zmień wartości
3. Kliknij **Wykonaj**

#### Usuwanie rekordu:
1. Zaznacz rekordy do usunięcia (checkbox)
2. Na dole kliknij **Usuń**

#### Wykonywanie zapytań SQL:
1. Kliknij na bazę `kurier`
2. Kliknij zakładkę **SQL**
3. Wpisz zapytanie
4. Kliknij **Wykonaj**

## 🎯 Praktyka

### Ćwiczenie 1.4.1: Praca z PhpMyAdmin

1. Otwórz PhpMyAdmin
2. Kliknij na bazę `kurier`
3. Sprawdź zawartość każdej tabeli (Samochody, Kierowcy, Zlecenia)
4. Przejdź do zakładki SQL
5. Wpisz i wykonaj zapytanie:

```sql
SELECT * FROM Samochody;
```

6. Spróbuj zmodyfikować zapytanie:

```sql
SELECT marka, model, przebieg FROM Samochody WHERE przebieg > 100000;
```

## 💻 Konsola MySQL

Konsola MySQL to wiersz poleceń do komunikacji z bazą. Jest bardziej zaawansowana niż PhpMyAdmin.

### Dostęp do konsoli MySQL

#### Windows:
1. Otwórz Command Prompt (cmd)
2. Wpisz:
```bash
cd C:\xampp\mysql\bin
mysql -u root
```

#### Mac/Linux:
```bash
mysql -u root
```

### Podstawowe komendy w konsoli

```sql
-- Pokaż wszystkie bazy danych
SHOW DATABASES;

-- Wybierz bazę
USE kurier;

-- Pokaż tabele w bieżącej bazie
SHOW TABLES;

-- Pokaż strukturę tabeli
DESCRIBE Samochody;

-- Wykonaj zapytanie SELECT
SELECT * FROM Samochody;

-- Wyloguj się
EXIT;
```

## 🎯 Praktyka

### Ćwiczenie 1.4.2: Praca z konsolą MySQL

1. Otwórz konsolę MySQL (instrukcje wyżej)
2. Wykonaj komendy:

```sql
SHOW DATABASES;
USE kurier;
SHOW TABLES;
```

3. Zobaczysz trzy tabele: Samochody, Kierowcy, Zlecenia
4. Wpisz:

```sql
SELECT COUNT(*) FROM Samochody;
```

Wyświetli liczbę samochodów (powinno być 8)

5. Spróbuj:

```sql
SELECT * FROM Kierowcy WHERE imie = 'Piotr';
```

6. Wpisz `EXIT;` aby wyjść

## 📊 Eksport i import danych

### Eksport bazy w PhpMyAdmin:

1. Kliknij na bazę `kurier`
2. Kliknij na zakładkę **Eksport**
3. Wybierz format **SQL**
4. Kliknij **Wykonaj**
5. Plik zostanie pobrany

### Import bazy w PhpMyAdmin:

1. Kliknij na bazę
2. Kliknij na zakładkę **Import**
3. Kliknij **Wybierz plik**
4. Zaznacz plik `.sql`
5. Kliknij **Wykonaj**

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Nawigacji w PhpMyAdmin
- ✅ Przeglądania, dodawania, edycji i usuwania rekordów
- ✅ Wykonywania zapytań SQL w PhpMyAdmin
- ✅ Używania konsoli MySQL
- ✅ Eksportu i importu danych

**Gratulacje! Zakończyłeś Moduł 1. Przejdź do Modułu 2: Łączenie PHP z bazą!**
