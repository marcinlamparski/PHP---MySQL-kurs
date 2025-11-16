# 2.4 Ćwiczenia — Praktyka z SELECT

## 🎯 Zadania do wykonania

Poniżej znajdziesz zadania do samodzielnego wykonania. Pamiętaj:
- Zawsze zacznij od `require 'config.php';`
- Sprawdzaj błędy zapytań
- Wyświetlaj dane w czytelny sposób

### Ćwiczenie 2.4.1: Lista kierowców

Utwórz plik `kierowcy_lista.php`, który wyświetli tabelę wszystkich kierowców z kolumnami:
- ID
- Imię
- Nazwisko
- PESEL

**Wskazówka**: Zapytanie: `SELECT * FROM Kierowcy`

### Ćwiczenie 2.4.2: Samochody z przebiegiem > 100000

Utwórz plik `samochody_dojechane.php`, który wyświetli tylko samochody, których przebieg przekroczył 100 000 km.

**Wskazówka**: `WHERE przebieg > 100000`

### Ćwiczenie 2.4.3: Kierowca o konkretnym imieniu

Utwórz plik `szukaj_kierowce.php`. Na górze strony niech będzie tekst: "Szukamy kierowcy: Piotr", a poniżej dane tego kierowcy (jeśli istnieje).

**Wskazówka**: `WHERE imie = 'Piotr'`

### Ćwiczenie 2.4.4: Zlecenia

Utwórz plik `zlecenia_lista.php` wyświetlający tabelę zleceń z danymi:
- ID zlecenia
- Data zlecenia
- Opis

### Ćwiczenie 2.4.5: Sortowanie samochodów

Utwórz plik `samochody_sortowanie.php`. Wyświetl listę samochodów posortowaną od samochodu z **najmniejszym** przebiegiem do **największego**.

**Wskazówka**: `ORDER BY przebieg ASC`

## 📝 Rozwiązania (sprawdź po wykonaniu)

### Rozwiązanie 2.4.1:

```php
<?php
  require 'config.php';
  
  $sql = "SELECT * FROM Kierowcy";
  $result = mysqli_query($conn, $sql);
  
  echo "<h2>Lista kierowców</h2>";
  echo "<table border='1' cellpadding='10'>";
  echo "<tr><th>ID</th><th>Imię</th><th>Nazwisko</th><th>PESEL</th></tr>";
  
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['id_kierowcy'] . "</td>";
      echo "<td>" . $row['imie'] . "</td>";
      echo "<td>" . $row['nazwisko'] . "</td>";
      echo "<td>" . $row['pesel'] . "</td>";
      echo "</tr>";
  }
  echo "</table>";
  
  mysqli_close($conn);
?>
```

### Rozwiązanie 2.4.2:

```php
<?php
  require 'config.php';
  
  $sql = "SELECT * FROM Samochody WHERE przebieg > 100000";
  $result = mysqli_query($conn, $sql);
  
  echo "<h2>Samochody z przebiegiem > 100 000 km</h2>";
  echo "<table border='1' cellpadding='10'>";
  echo "<tr><th>Marka</th><th>Model</th><th>Przebieg</th></tr>";
  
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['marka'] . "</td>";
      echo "<td>" . $row['model'] . "</td>";
      echo "<td>" . $row['przebieg'] . " km</td>";
      echo "</tr>";
  }
  echo "</table>";
  
  mysqli_close($conn);
?>
```

### Rozwiązanie 2.4.5:

```php
<?php
  require 'config.php';
  
  $sql = "SELECT * FROM Samochody ORDER BY przebieg ASC";
  $result = mysqli_query($conn, $sql);
  
  echo "<h2>Samochody posortowane po przebiegu (od najmniejszego)</h2>";
  echo "<table border='1' cellpadding='10'>";
  echo "<tr><th>Marka</th><th>Model</th><th>Przebieg</th></tr>";
  
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['marka'] . "</td>";
      echo "<td>" . $row['model'] . "</td>";
      echo "<td>" . $row['przebieg'] . " km</td>";
      echo "</tr>";
  }
  echo "</table>";
  
  mysqli_close($conn);
?>
```

## 📝 Podsumowanie

W tym module nauczyłeś się:
- ✅ Pobierać dane z tabel
- ✅ Wyświetlać dane w tabelach HTML
- ✅ Filtrować dane (WHERE)
- ✅ Sortować dane (ORDER BY)

**Gratulacje! Ukończyłeś Moduł 2. Przejdź do Modułu 3: Formularze i walidacja danych!**
