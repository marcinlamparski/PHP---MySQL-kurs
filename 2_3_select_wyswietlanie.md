# 2.3 SELECT — Pobieranie i wyświetlanie danych

## 📚 Teoria

Po połączeniu z bazą, możemy pobierać dane za pomocą SELECT. Proces wygląda tak:

1. Napisz zapytanie SQL (SELECT)
2. Wyślij zapytanie do bazy (`mysqli_query`)
3. Pobierz wyniki (`mysqli_fetch_assoc`)
4. Wyświetl dane

## 🎯 Krok po kroku

### Krok 1: Napisz zapytanie

```php
<?php
  $sql = "SELECT * FROM Samochody";
?>
```

### Krok 2: Wyślij zapytanie

```php
<?php
  $sql = "SELECT * FROM Samochody";
  $result = mysqli_query($conn, $sql);
?>
```

`mysqli_query()` zwraca wyniki zapytania lub FALSE jeśli błąd.

### Krok 3: Pobierz wyniki w pętli

```php
<?php
  $sql = "SELECT * FROM Samochody";
  $result = mysqli_query($conn, $sql);
  
  // Pętla przez każdy wiersz
  while ($row = mysqli_fetch_assoc($result)) {
      echo $row['marka'];      // Dostęp do kolumny 'marka'
      echo $row['model'];      // Dostęp do kolumny 'model'
      echo $row['przebieg'];   // Dostęp do kolumny 'przebieg'
  }
?>
```

## 🎯 Praktyka

### Ćwiczenie 2.3.1: Wyświetlanie wszystkich samochodów

Utwórz plik `samochody_lista.php`:

```php
<?php
  require 'config.php';
  
  // Zapytanie
  $sql = "SELECT * FROM Samochody";
  $result = mysqli_query($conn, $sql);
  
  // Sprawdzenie błędu
  if (!$result) {
      die("Błąd zapytania: " . mysqli_error($conn));
  }
  
  // Liczba wyników
  $liczba = mysqli_num_rows($result);
  echo "Liczba samochodów: " . $liczba . "<br><br>";
  
  // Pętla przez wyniki
  while ($row = mysqli_fetch_assoc($result)) {
      echo "ID: " . $row['id_samochodu'] . "<br>";
      echo "Marka: " . $row['marka'] . "<br>";
      echo "Model: " . $row['model'] . "<br>";
      echo "Przebieg: " . $row['przebieg'] . " km<br>";
      echo "Nr rejestracyjny: " . $row['nr_rejestracyjny'] . "<br>";
      echo "---<br>";
  }
  
  mysqli_close($conn);
?>
```

Wejdź na: `http://localhost/samochody_lista.php`

## 📊 Wyświetlanie w tabeli HTML

Lepiej wyświetlić dane w tabeli:

### Ćwiczenie 2.3.2: Tabela samochodów

```php
<?php
  require 'config.php';
  
  $sql = "SELECT * FROM Samochody";
  $result = mysqli_query($conn, $sql);
  
  if (!$result) {
      die("Błąd: " . mysqli_error($conn));
  }
  
  // Nagłówek HTML
  echo "<table border='1' cellpadding='10'>";
  echo "<tr>";
  echo "<th>ID</th>";
  echo "<th>Marka</th>";
  echo "<th>Model</th>";
  echo "<th>Przebieg (km)</th>";
  echo "<th>Nr rejestracyjny</th>";
  echo "</tr>";
  
  // Wiersze danych
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['id_samochodu'] . "</td>";
      echo "<td>" . $row['marka'] . "</td>";
      echo "<td>" . $row['model'] . "</td>";
      echo "<td>" . $row['przebieg'] . "</td>";
      echo "<td>" . $row['nr_rejestracyjny'] . "</td>";
      echo "</tr>";
  }
  
  echo "</table>";
  
  mysqli_close($conn);
?>
```

## 🔍 Wyszukiwanie — WHERE

### Ćwiczenie 2.3.3: Wyszukaj samochód po marce

```php
<?php
  require 'config.php';
  
  // Szukana marka
  $szukanaMarka = "Toyota";
  
  // Zapytanie z WHERE
  $sql = "SELECT * FROM Samochody WHERE marka = '$szukanaMarka'";
  $result = mysqli_query($conn, $sql);
  
  if (!$result) {
      die("Błąd: " . mysqli_error($conn));
  }
  
  // Wyświetl wyniki
  if (mysqli_num_rows($result) > 0) {
      while ($row = mysqli_fetch_assoc($result)) {
          echo "Znaleziono: " . $row['marka'] . " " . $row['model'] . "<br>";
      }
  } else {
      echo "Nie znaleziono samochodów.";
  }
  
  mysqli_close($conn);
?>
```

## 📈 Funkcje pomocnicze

### Liczenie wierszy:

```php
$liczba = mysqli_num_rows($result);
echo "Znaleziono: " . $liczba . " rekordów";
```

### Pobierz liczby:

```php
// Zamiast fetch_assoc (tekst) możesz użyć fetch_row (liczby)
$row = mysqli_fetch_row($result);
echo $row[0];  // Pierwszy element (po indeksie)
```

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Pisania zapytań SELECT w PHP
- ✅ Wysyłania zapytań do bazy
- ✅ Pobierania wyników z pętlą
- ✅ Wyświetlania danych w tabeli HTML
- ✅ Wyszukiwania danych (WHERE)

**Przejdź do 2.4 aby wykonać ćwiczenia praktyczne!**
