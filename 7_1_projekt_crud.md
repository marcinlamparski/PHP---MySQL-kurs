# 7.1 Projekt CRUD — Pełna aplikacja do zarządzania flotą

## 📚 Cel projektu

Stwórz kompletną aplikację do zarządzania flotą samochodów i kierowcami w firmie kurierskiej.

## 🎯 Wymagania

Aplikacja powinna zawierać:

1. **Zarządzanie samochodami**
   - Lista wszystkich samochodów
   - Dodawanie nowego samochodu
   - Edycja danych samochodu
   - Usunięcie samochodu

2. **Zarządzanie kierowcami**
   - Lista wszystkich kierowców
   - Dodawanie nowego kierowcy
   - Edycja danych kierowcy
   - Usunięcie kierowcy

3. **Zarządzanie zleceniami**
   - Lista zleceń z danymi kierowcy i samochodu (JOIN)
   - Dodawanie nowego zlecenia
   - Edycja zlecenia
   - Usunięcie zlecenia

4. **Funkcjonalności zaawansowane**
   - Sortowanie po kolumnach
   - Wyszukiwanie (filtrowanie)
   - Stronicowanie wyników
   - Wyświetlanie szczegółów rekordu

## 📁 Struktura plików

```
projekt/
├── config.php              # Połączenie z bazą
├── index.php               # Strona główna
├── samochody_lista.php     # Lista samochodów
├── samochody_dodaj.php     # Dodawanie samochodu
├── samochody_edytuj.php    # Edycja samochodu
├── samochody_usun.php      # Usuwanie samochodu
├── kierowcy_lista.php      # Lista kierowców
├── kierowcy_dodaj.php      # Dodawanie kierowcy
├── kierowcy_edytuj.php     # Edycja kierowcy
├── kierowcy_usun.php       # Usuwanie kierowcy
├── zlecenia_lista.php      # Lista zleceń
├── zlecenia_dodaj.php      # Dodawanie zlecenia
├── zlecenia_edytuj.php     # Edycja zlecenia
└── zlecenia_usun.php       # Usuwanie zlecenia
```

## 📝 Główne funkcje

### 1. Lista z akcjami

```php
<?php
  require 'config.php';
  
  $sql = "SELECT * FROM Samochody ORDER BY id_samochodu";
  $result = mysqli_query($conn, $sql);
  
  echo "<table border='1' cellpadding='10'>";
  echo "<tr><th>Marka</th><th>Model</th><th>Akcje</th></tr>";
  
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['marka'] . "</td>";
      echo "<td>" . $row['model'] . "</td>";
      echo "<td>";
      echo "<a href='samochody_edytuj.php?id=" . $row['id_samochodu'] . "'>Edytuj</a> | ";
      echo "<a href='samochody_usun.php?id=" . $row['id_samochodu'] . "'>Usuń</a>";
      echo "</td>";
      echo "</tr>";
  }
  echo "</table>";
  
  mysqli_close($conn);
?>
```

### 2. Formularz dodawania z walidacją

```php
<?php
  require 'config.php';
  
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      // Pobierz dane
      $marka = trim($_POST['marka'] ?? '');
      $model = trim($_POST['model'] ?? '');
      $przebieg = (int)($_POST['przebieg'] ?? 0);
      
      // Walidacja
      $bledy = [];
      if (empty($marka)) $bledy[] = "Marka wymagana";
      if (empty($model)) $bledy[] = "Model wymagany";
      if ($przebieg < 0) $bledy[] = "Przebieg nie może być ujemny";
      
      if (empty($bledy)) {
          $sql = "INSERT INTO Samochody (marka, model, przebieg) 
                  VALUES ('$marka', '$model', $przebieg)";
          
          if (mysqli_query($conn, $sql)) {
              header("Location: samochody_lista.php");
          }
      }
  }
  
  mysqli_close($conn);
?>
```

### 3. Lista zleceń z JOIN

```php
<?php
  require 'config.php';
  
  $sql = "SELECT 
            Z.id_zlecenia,
            Z.data_zlecenia,
            K.imie,
            K.nazwisko,
            S.marka,
            S.model,
            Z.opis
          FROM Zlecenia Z
          JOIN Kierowcy K ON Z.id_kierowcy = K.id_kierowcy
          JOIN Samochody S ON Z.id_samochodu = S.id_samochodu
          ORDER BY Z.data_zlecenia DESC";
  
  $result = mysqli_query($conn, $sql);
  
  echo "<table border='1' cellpadding='10'>";
  echo "<tr><th>Data</th><th>Kierowca</th><th>Samochód</th><th>Opis</th><th>Akcje</th></tr>";
  
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['data_zlecenia'] . "</td>";
      echo "<td>" . $row['imie'] . " " . $row['nazwisko'] . "</td>";
      echo "<td>" . $row['marka'] . " " . $row['model'] . "</td>";
      echo "<td>" . $row['opis'] . "</td>";
      echo "<td><a href='zlecenia_edytuj.php?id=" . $row['id_zlecenia'] . "'>Edytuj</a></td>";
      echo "</tr>";
  }
  echo "</table>";
  
  mysqli_close($conn);
?>
```

## 🎯 Zadania do wykonania

1. Stwórz wszystkie pliki z listą
2. Dodaj funkcjonalność dodawania
3. Dodaj edycję
4. Dodaj usuwanie
5. Dodaj sortowanie i filtrowanie
6. Dodaj stronicowanie

**Przejdź do 7.2 aby poznać proces testowania!**
