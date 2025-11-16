# Kurs PHP i MySQL — Kompletny Przewodnik

Witaj! Ten kurs pozwoli Ci nauczyć się od podstaw, jak połączyć PHP z bazą danych MySQL i pracować z danymi w aplikacjach webowych.

## 📋 Informacje o kursie

- **Docelowa grupa**: Początkujący programiści
- **Czas trwania**: ~30 godzin
- **Wymagania wstępne**: Podstawowa znajomość HTML i CSS, zainstalowane XAMPP/WAMP
- **Baza danych**: Firma kurierska (samochody, kierowcy, zlecenia)

## 📁 Struktura projektu

```
php-mysql-course/
├── README.md
├── database/
│   └── baza_utworzenie.sql          # Skrypt SQL do utworzenia bazy
├── modules/
│   ├── 01_wprowadzenie/
│   │   ├── 1.1_instalacja.md
│   │   ├── 1.2_php_podstawy.md
│   │   ├── 1.3_sql_podstawy.md
│   │   └── 1.4_narzedzia.md
│   ├── 02_laczenie_bazy/
│   │   ├── 2.1_mysqli_pdo.md
│   │   ├── 2.2_polaczenie.md
│   │   ├── 2.3_select_wyswietlanie.md
│   │   └── 2.4_cwiczenia.md
│   ├── 03_formularze/
│   │   ├── 3.1_html_get_post.md
│   │   ├── 3.2_pobieranie_danych.md
│   │   ├── 3.3_walidacja.md
│   │   ├── 3.4_cwiczenia_walidacja.md
│   │   ├── 3.5_insert.md
│   │   ├── 3.6_komunikaty.md
│   │   ├── 3.7_update.md
│   │   ├── 3.8_delete.md
│   │   ├── 3.9_projekt_crud.md
│   │   └── 3.10_cwiczenia_podsumowanie.md
│   ├── 04_prezentacja_danych/
│   │   ├── 4.1_tabele_html.md
│   │   ├── 4.2_sortowanie.md
│   │   ├── 4.3_filtrowanie_wyszukiwanie.md
│   │   ├── 4.4_cwiczenia_filtry.md
│   │   ├── 4.5_paginacja.md
│   │   ├── 4.6_cwiczenia_paginacja.md
│   │   ├── 4.7_szczegoly_rekordu.md
│   │   └── 4.8_cwiczenia_podsumowanie.md
│   ├── 05_wiele_tabel/
│   │   ├── 5.1_relacje.md
│   │   ├── 5.2_join.md
│   │   ├── 5.3_zaawansowane_zapytania.md
│   │   └── 5.4_cwiczenia_join.md
│   ├── 06_optymalizacja/
│   │   ├── 6.1_indeksy_optymalizacja.md
│   │   ├── 6.2_transakcje.md
│   │   ├── 6.3_wyjatek_logi.md
│   │   └── 6.4_procedury.md
│   └── 07_projekt_koncowy/
│       ├── 7.1_projekt_crud.md
│       └── 7.2_testowanie.md
└── examples/              # Pliki przykładowe (opcjonalne)
    └── notatka.txt
```

## 🚀 Jak zacząć

### 1. Przygotowanie środowiska

- Zainstaluj **XAMPP** lub **WAMP** (dostępne na: apachefriends.org)
- Uruchom **Apache** i **MySQL**
- Przejdź do **phpMyAdmin** (http://localhost/phpmyadmin)

### 2. Utworzenie bazy danych

1. W phpMyAdmin utwórz nową bazę o nazwie **`kurier`**
2. Otwórz zakładkę **SQL** i wklej zawartość pliku `database/baza_utworzenie.sql`
3. Kliknij przycisk **Wykonaj**
4. Powinna się pojawić informacja: "Pomyślnie wykonano zapytanie"

### 3. Rozpoczęcie nauki

- Przejdź do katalogu `modules/01_wprowadzenie/`
- Zacznij od pliku `1.1_instalacja.md`
- Każdy moduł zawiera teoretyczne wyjaśnienia i praktyczne zadania
- Wykonuj ćwiczenia w odpowiedniej kolejności

## 📚 Zawartość modułów

| Moduł | Temat | Godziny |
|-------|-------|---------|
| 1 | Wprowadzenie do PHP i MySQL | 3h |
| 2 | Łączenie PHP z bazą danych | 3h |
| 3 | Obsługa formularzy i walidacja | 8h |
| 4 | Prezentacja i filtrowanie danych | 8h |
| 5 | Praca z wieloma tabelami | 3h |
| 6 | Zaawansowane techniki | 3h |
| 7 | Projekt końcowy | 2h |

## ✅ Jak pracować z tym kursem

Każdy moduł zawiera:

1. **Teorię** — wyjaśnienia konceptów z przykładami kodu
2. **Praktykę** — fragmenty kodu do skopiowania i przetestowania
3. **Ćwiczenia** — samodzielne zadania do wykonania
4. **Projekty** — praktyczne aplikacje używające poznanych technik

## 🎯 Cel kursu

Po ukończeniu kursu będziesz potrafić:

- Instalować i konfigurować środowisko PHP i MySQL
- Tworzyć i zarządzać bazami danych
- Pobierać i wyświetlać dane z MySQL w PHP
- Budować formularze ze walidacją danych
- Wykonywać operacje CRUD (Create, Read, Update, Delete)
- Filtrować, sortować i stronicować dane
- Pracować z relacjami między tabelami
- Optymalizować zapytania SQL
- Budować całą aplikację webową

## 📞 Pytania i problemy

Jeśli masz problemy:
1. Sprawdź, czy baza danych została prawidłowo załadowana
2. Upewnij się, że PHP i MySQL są uruchomione
3. Przeczytaj komunikat błędu i szukaj rozwiązania w modułach
4. Sprawdzaj polecenia MySQL w phpMyAdmin przed użyciem w PHP

## 📝 Notatki

- Kod w modułach zawsze zawiera komentarze wyjaśniające każdą linię
- Staraj się zrozumieć każdy fragment, a nie tylko go kopjować
- Eksperymentuj i modyfikuj kod — to najlepszy sposób na naukę
- Baza danych zawiera dane testowe — możesz na nich pracować bez obaw

## 🔗 Licencja

Ten kurs jest dostępny do nauki i użytku edukacyjnego.

---

**Powodzenia w nauce! 🎓**
