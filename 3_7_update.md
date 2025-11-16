# 3.7 UPDATE — Aktualizowanie danych

## 📚 Teoria

UPDATE to polecenie do modyfikowania istniejących rekordów.

### Składnia:

```sql
UPDATE tabela SET kolumna = wartość WHERE warunek;
```

## 🎯 Praktyka

### Ćwiczenie 3.7.1: Edycja samochodu

```php
<?php
  require 'config.php';
  
  $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
  
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $marka = isset($_POST['marka']) ? trim($_POST['marka']) : '';
      $model = isset($_POST['model']) ? trim($_POST['model']) : '';
      $przebieg = isset($_POST['przebieg']) ? (int)$_POST['przebieg'] : 0;
      
      if (empty($marka) || empty($model)) {
          echo "❌ Pola wymagane!";
      } else {
          $sql = "UPDATE Samochody SET marka='$marka', model='$model', przebieg=$przebieg WHERE id_samochodu=$id";
          
          if (mysqli_query($conn, $sql)) {
              echo "✅ Samochód zaktualizowany!";
          } else {
              echo "❌ Błąd: " . mysqli_error($conn);
          }
      }
  } else {
      // Pobierz dane do edycji
      $sql = "SELECT * FROM Samochody WHERE id_samochodu=$id";
      $result = mysqli_query($conn, $sql);
      $row = mysqli_fetch_assoc($result);
      
      echo "<form method='POST'>";
      echo "Marka: <input type='text' name='marka' value='" . $row['marka'] . "'><br>";
      echo "Model: <input type='text' name='model' value='" . $row['model'] . "'><br>";
      echo "Przebieg: <input type='number' name='przebieg' value='" . $row['przebieg'] . "'><br>";
      echo "<button type='submit'>Zapisz</button>";
      echo "</form>";
  }
  
  mysqli_close($conn);
?>
```

## 📝 Podsumowanie

- ✅ Pobieranie danych do edycji
- ✅ UPDATE — aktualizacja bazy
- ✅ Dwuetapowy proces edycji

**Przejdź do 3.8!**
