# 7.2 Testowanie i debugowanie

## 📚 Proces testowania

Testuj każdą funkcję aplikacji w podanej kolejności.

## 🧪 Plan testowania

### 1. Testowanie połączenia z bazą
- [ ] Uruchom `config.php`
- [ ] Sprawdź czy połączenie działa
- [ ] Sprawdź czy wszystkie tabele istnieją

### 2. Testowanie listy samochodów
- [ ] Uruchom `samochody_lista.php`
- [ ] Sprawdź czy wyświetlają się wszystkie samochody
- [ ] Sprawdź czy dane są prawidłowe

### 3. Testowanie dodawania
- [ ] Przejdź do `samochody_dodaj.php`
- [ ] Spróbuj dodać nowy samochód
- [ ] Sprawdź czy pojawił się na liście
- [ ] Spróbuj dodać z pustymi polami (test walidacji)

### 4. Testowanie edycji
- [ ] Kliknij "Edytuj" przy dowolnym samochodzie
- [ ] Zmień dane
- [ ] Kliknij "Zapisz"
- [ ] Sprawdź czy zmiany się zapisały

### 5. Testowanie usuwania
- [ ] Kliknij "Usuń" przy samochodzie testowym
- [ ] Potwierdź usunięcie
- [ ] Sprawdź czy zniknął z listy

### 6. Testowanie filtrowania
- [ ] Spróbuj wyszukać samochód po marce
- [ ] Sprawdź czy filtry działają prawidłowo

### 7. Testowanie JOIN-ów
- [ ] Uruchom `zlecenia_lista.php`
- [ ] Sprawdź czy wyświetlane są dane z 3 tabel
- [ ] Sprawdź czy powiązania są prawidłowe

## 🐛 Debugowanie

### Jeśli coś nie działa:

1. **Sprawdź komunikat błędu**
   ```php
   if (!$result) {
       echo "Błąd: " . mysqli_error($conn);
   }
   ```

2. **Wypisz zapytanie SQL**
   ```php
   echo "SQL: " . $sql;
   ```

3. **Sprawdź phpMyAdmin**
   - Uruchom zapytanie ręcznie w phpMyAdmin
   - Sprawdź czy dane są w bazie

4. **Loguj błędy**
   ```php
   error_log("Błąd: " . mysqli_error($conn));
   ```

## ✅ Checklist ukończenia

- [ ] Wszystkie listy wyświetlają się prawidłowo
- [ ] Można dodawać nowe rekordy
- [ ] Można edytować rekordy
- [ ] Można usuwać rekordy
- [ ] Walidacja danych działa
- [ ] Filtrowanie działa
- [ ] Sortowanie działa
- [ ] JOIN-y zwracają prawidłowe dane
- [ ] Brak błędów PHP

## 🎉 Gratulacje!

Jeśli przeszedłeś wszystkie testy, gratulujemy! Ukończyłeś kurs PHP i MySQL!

## 📚 Co dalej?

- Dodaj CSS i HTML5 do stylowania aplikacji
- Spróbuj logowania i uprawnień użytkowników
- Eksperymentuj z dodatkowymi funkcjonalnościami
- Naucz się Prepared Statements do bardziej zaawansowanego bezpieczeństwa

## 🚀 Następne umiejętności

Po tym kursie możesz się uczyć:
- Frameworks PHP (Laravel, Symfony)
- REST API
- WebSockets
- Bardziej zaawansowanego SQL (VIEW, TRIGGER, CTE)

---

**Dziękujemy za ukończenie kursu! Powodzenia w dalszej nauce! 🎓**
