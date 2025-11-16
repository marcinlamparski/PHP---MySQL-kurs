# 3.6 Komunikaty — Informowanie użytkownika

## 📚 Teoria

Po wykonaniu operacji (INSERT, UPDATE, DELETE) powinniśmy poinformować użytkownika czy się powiodła czy nie.

## 🎯 Praktyka

### Ćwiczenie 3.6.1: Komunikaty powodzenia/błędu

```php
<?php
  require 'config.php';
  
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $imie = isset($_POST['imie']) ? trim($_POST['imie']) : '';
      $nazwisko = isset($_POST['nazwisko']) ? trim($_POST['nazwisko']) : '';
      $pesel = isset($_POST['pesel']) ? trim($_POST['pesel']) : '';
      
      $bledy = array();
      
      if (empty($imie)) $bledy[] = "Imię wymagane";
      if (empty($nazwisko)) $bledy[] = "Nazwisko wymagane";
      if (empty($pesel) || strlen($pesel) != 11) $bledy[] = "PESEL nieprawidłowy";
      
      if (empty($bledy)) {
          $sql = "INSERT INTO Kierowcy (imie, nazwisko, pesel) 
                  VALUES ('$imie', '$nazwisko', '$pesel')";
          
          if (mysqli_query($conn, $sql)) {
              echo "<div style='color:green; padding:10px; background:#e8f5e9;'>";
              echo "✅ Kierowca dodany pomyślnie!";
              echo "</div>";
          } else {
              echo "<div style='color:red; padding:10px; background:#ffebee;'>";
              echo "❌ Błąd bazy danych: " . mysqli_error($conn);
              echo "</div>";
          }
      } else {
          echo "<div style='color:red; padding:10px; background:#ffebee;'>";
          foreach ($bledy as $blad) {
              echo "❌ " . $blad . "<br>";
          }
          echo "</div>";
      }
  }
  
  mysqli_close($conn);
?>
```

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Wyświetlania komunikatów sukcesu
- ✅ Wyświetlania komunikatów błędu
- ✅ Stylowania komunikatów CSS

**Przejdź do 3.7 aby nauczyć się UPDATE!**
