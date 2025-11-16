# 3.4 Ćwiczenia — Walidacja danych

## 🎯 Zadania do wykonania

### Ćwiczenie 3.4.1: Walidacja formularza samochodu

Utwórz formularz do dodawania samochodu z walidacją:
- Marka: nie może być pusta
- Model: nie może być puste
- Przebieg: musi być liczbą > 0
- Nr rejestracyjny: nie może być pusty

**Wskazówka**: Każdy błąd dodaj do tablicy `$bledy[]`

### Ćwiczenie 3.4.2: Walidacja hasła

Waliduj hasło które:
- Ma co najmniej 6 znaków
- Nie może być puste
- Potwierdź czy powtórzenie się zgadza

**Wskazówka**: Porównaj dwa pola `$haslo1 == $haslo2`

### Ćwiczenie 3.4.3: Walidacja daty

Waliduj datę, która powinna być:
- Nie pusta
- W formacie `YYYY-MM-DD`
- Winna być datą przyszłą

**Wskazówka**: Użyj `strtotime()` do konwersji daty

## 📝 Rozwiązanie 3.4.1

```php
<?php
  require 'config.php';
  
  $marka = isset($_POST['marka']) ? trim($_POST['marka']) : '';
  $model = isset($_POST['model']) ? trim($_POST['model']) : '';
  $przebieg = isset($_POST['przebieg']) ? trim($_POST['przebieg']) : '';
  $nr_reg = isset($_POST['nr_rejestracyjny']) ? trim($_POST['nr_rejestracyjny']) : '';
  
  $bledy = array();
  
  if (empty($marka)) $bledy[] = "Marka nie może być pusta";
  if (empty($model)) $bledy[] = "Model nie może być pusty";
  if (empty($przebieg)) {
      $bledy[] = "Przebieg nie może być pusty";
  } elseif (!is_numeric($przebieg) || $przebieg < 0) {
      $bledy[] = "Przebieg musi być liczbą dodatnią";
  }
  if (empty($nr_reg)) $bledy[] = "Nr rejestracyjny nie może być pusty";
  
  if (!empty($bledy)) {
      foreach ($bledy as $blad) {
          echo "❌ " . $blad . "<br>";
      }
  } else {
      echo "✅ Dane prawidłowe!<br>";
      echo "Marka: " . $marka . "<br>";
      echo "Model: " . $model . "<br>";
      echo "Przebieg: " . $przebieg . "<br>";
      echo "Nr rej: " . $nr_reg . "<br>";
  }
  
  mysqli_close($conn);
?>
```

**Gratulacje! Ukończyłeś ćwiczenia walidacji. Przejdź do 3.5!**
