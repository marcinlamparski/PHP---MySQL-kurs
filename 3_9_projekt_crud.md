# 3.9 Projekt CRUD — Zarządzanie kierowcami

## 📚 Cel

Stwórz pełną aplikację do zarządzania kierowcami (Create, Read, Update, Delete).

## 🎯 Struktura projektu

Potrzebujesz 4 pliki:
1. **lista.php** — wyświetla wszystkich kierowców
2. **dodaj.php** — formularz do dodania kierowcy
3. **edytuj.php** — formularz do edycji
4. **usun.php** — usunięcie kierowcy

## 📝 Plik: lista.php

```php
<?php
  require 'config.php';
  
  $sql = "SELECT * FROM Kierowcy";
  $result = mysqli_query($conn, $sql);
  
  echo "<h2>Kierowcy</h2>";
  echo "<a href='dodaj.php'>Dodaj nowego</a><br><br>";
  
  echo "<table border='1' cellpadding='10'>";
  echo "<tr><th>ID</th><th>Imię</th><th>Nazwisko</th><th>PESEL</th><th>Akcje</th></tr>";
  
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['id_kierowcy'] . "</td>";
      echo "<td>" . $row['imie'] . "</td>";
      echo "<td>" . $row['nazwisko'] . "</td>";
      echo "<td>" . $row['pesel'] . "</td>";
      echo "<td>";
      echo "<a href='edytuj.php?id=" . $row['id_kierowcy'] . "'>Edytuj</a> | ";
      echo "<a href='usun.php?id=" . $row['id_kierowcy'] . "'>Usuń</a>";
      echo "</td>";
      echo "</tr>";
  }
  echo "</table>";
  
  mysqli_close($conn);
?>
```

## 📝 Plik: dodaj.php

```php
<?php
  require 'config.php';
  
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $imie = trim($_POST['imie']);
      $nazwisko = trim($_POST['nazwisko']);
      $pesel = trim($_POST['pesel']);
      
      if (empty($imie) || empty($nazwisko) || strlen($pesel) != 11) {
          echo "❌ Dane nieprawidłowe!";
      } else {
          $sql = "INSERT INTO Kierowcy (imie, nazwisko, pesel) 
                  VALUES ('$imie', '$nazwisko', '$pesel')";
          
          if (mysqli_query($conn, $sql)) {
              echo "✅ Kierowca dodany!";
              header("Location: lista.php");
          }
      }
  }
  
  echo "<form method='POST'>";
  echo "Imię: <input type='text' name='imie'><br>";
  echo "Nazwisko: <input type='text' name='nazwisko'><br>";
  echo "PESEL: <input type='text' name='pesel'><br>";
  echo "<button type='submit'>Dodaj</button>";
  echo "</form>";
  
  mysqli_close($conn);
?>
```

Pozostałe pliki (edytuj.php, usun.php) tworzysz analogicznie!

**Przejdź do 3.10!**
