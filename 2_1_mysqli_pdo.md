# 2.1 MySQLi i PDO — Różnice między nimi

## 📚 Teoria

Aby połączyć PHP z MySQL, musimy wybrać jedną z dwóch metod:

1. **MySQLi** (MySQL Improved) — nowsza wersja procedury MySQL
2. **PDO** (PHP Data Objects) — uniwersalne rozwiązanie dla wielu baz

Oba podejścia działają, ale się różnią.

## 📊 Porównanie MySQLi i PDO

| Cecha | MySQLi | PDO |
|-------|--------|-----|
| **Typ API** | Proceduralne i obiektowe | Tylko obiektowe |
| **Obsługa MySQL** | Tak | Tak (i inne bazy) |
| **Prepared Statements** | Tak | Tak |
| **Łatwość nauki** | Średnia | Średnia |
| **Rekomendacja** | ✅ Dobrze | ✅ Dobrze |

## 🔗 MySQLi — Proceduralne podejście

MySQLi najczęściej używamy w stylu proceduralnym (najprostszy dla początkujących).

### Struktura kodu MySQLi:

```php
<?php
  // 1. Połączenie z bazą
  $conn = mysqli_connect("localhost", "root", "", "kurier");
  
  // 2. Sprawdzenie połączenia
  if (!$conn) {
      die("Błąd połączenia: " . mysqli_connect_error());
  }
  
  // 3. Wykonanie zapytania
  $sql = "SELECT * FROM Samochody";
  $result = mysqli_query($conn, $sql);
  
  // 4. Przetworzenie wyników
  while ($row = mysqli_fetch_assoc($result)) {
      echo $row['marka'];
  }
  
  // 5. Zamknięcie połączenia
  mysqli_close($conn);
?>
```

### Wyjaśnienie parametrów:

```php
mysqli_connect("host", "użytkownik", "hasło", "baza_danych");
```

- **host** — adres serwera (zwykle `localhost`)
- **użytkownik** — login (domyślnie `root`)
- **hasło** — hasło (domyślnie puste)
- **baza_danych** — nazwa bazy (w naszym przypadku `kurier`)

## 🔐 PDO — Uniwersalne podejście

PDO jest bardziej bezpieczny i bardziej zaawansowany. Używa orientacji obiektowej.

### Struktura kodu PDO:

```php
<?php
  try {
      // 1. Połączenie z bazą
      $conn = new PDO(
          "mysql:host=localhost;dbname=kurier;charset=utf8",
          "root",
          ""
      );
      
      // 2. Ustawienie błędów
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      
      // 3. Wykonanie zapytania
      $sql = "SELECT * FROM Samochody";
      $result = $conn->query($sql);
      
      // 4. Przetworzenie wyników
      while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
          echo $row['marka'];
      }
      
  } catch (PDOException $e) {
      echo "Błąd: " . $e->getMessage();
  }
?>
```

## 🎯 Praktyka

### Ćwiczenie 2.1.1: Porównanie obu podejść

Zapamiętaj główne różnice:

| Aspekt | MySQLi | PDO |
|--------|--------|-----|
| **Połączenie** | `mysqli_connect()` | `new PDO(...)` |
| **Pętla wyników** | `mysqli_fetch_assoc()` | `fetch(PDO::FETCH_ASSOC)` |
| **Zamknięcie** | `mysqli_close()` | Automatyczne |
| **Błędy** | `mysqli_error()` | try/catch |

## 📝 Podsumowanie

W tym kursie będziemy używać **MySQLi w stylu proceduralnym** ponieważ:
- Jest łatwiejszy do nauki dla początkujących
- Wystarczająco bezpieczny
- Intuicyjny i prosty

**Przejdź do 2.2 aby nauczyć się podstawowego połączenia!**
