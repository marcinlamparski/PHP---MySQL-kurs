# 3.3 Walidacja danych po stronie PHP

## 📚 Teoria

Walidacja to sprawdzenie czy dane przesłane przez użytkownika są prawidłowe, zanim je przetworzysz.

Powinna sprawdzać:
- Czy pole jest puste
- Czy ma prawidłową długość
- Czy ma prawidłowy format (email, liczba, itp.)
- Czy spełnia warunki biznesowe

## 🎯 Rodzaje walidacji

### 1. Sprawdzenie czy puste

```php
<?php
  $imie = trim($_POST['imie']);
  
  if (empty($imie)) {
      echo "❌ Imię nie może być puste!";
  } else {
      echo "✅ Imię OK: " . $imie;
  }
?>
```

### 2. Sprawdzenie długości

```php
<?php
  $haslo = $_POST['haslo'];
  
  if (strlen($haslo) < 6) {
      echo "❌ Hasło musi mieć co najmniej 6 znaków!";
  } else {
      echo "✅ Hasło OK";
  }
?>
```

### 3. Sprawdzenie czy liczba

```php
<?php
  $wiek = $_POST['wiek'];
  
  if (!is_numeric($wiek)) {
      echo "❌ Wiek musi być liczbą!";
  } else {
      echo "✅ Wiek OK: " . $wiek;
  }
?>
```

### 4. Sprawdzenie zakresu

```php
<?php
  $wiek = (int)$_POST['wiek'];
  
  if ($wiek < 18 || $wiek > 100) {
      echo "❌ Wiek musi być między 18 a 100!";
  } else {
      echo "✅ Wiek OK: " . $wiek;
  }
?>
```

### 4. Sprawdzenie czy zawiera określony znak

```php
<?php
$tekst = "przykład@adres.pl";
if (strpos($tekst, '@') !== false) {
    echo "Tekst zawiera znak @";
} else {
    echo "Tekst nie zawiera znaku @";
}
?>
```
Funkcja strpos() zwraca pozycję pierwszego wystąpienia podciągu (w tym przypadku znaku @) w ciągu tekstowym. Jeśli znak nie zostanie znaleziony, funkcja zwraca false. Ważne jest, aby użyć operatora identyczności (===), ponieważ znak @ może pojawić się na pozycji 0 (na początku tekstu), a wtedy zwykły operator porównania == mógłby błędnie zwrócić false.

## 🎯 Praktyka

### Ćwiczenie 3.3.1: Walidacja formularza kierowcy

1. Utwórz `formularz_kierowcy.html`:

```html
<!DOCTYPE html>
<html>
<body>

<h2>Dodaj kierowcę</h2>

<form method="POST" action="waliduj_kierowce.php">
  <label>Imię: <input type="text" name="imie"></label><br>
  <label>Nazwisko: <input type="text" name="nazwisko"></label><br>
  <label>PESEL (11 cyfr): <input type="text" name="pesel"></label><br>
  <button type="submit">Dodaj</button>
</form>

</body>
</html>
```

2. Utwórz `waliduj_kierowce.php`:

```php
<?php
  require 'config.php';
  
  $imie = isset($_POST['imie']) ? trim($_POST['imie']) : '';
  $nazwisko = isset($_POST['nazwisko']) ? trim($_POST['nazwisko']) : '';
  $pesel = isset($_POST['pesel']) ? trim($_POST['pesel']) : '';
  
  $bledy = array();  // Tablica na błędy
  
  // Walidacja
  if (empty($imie)) {
      $bledy[] = "Imię nie może być puste";
  }
  if (empty($nazwisko)) {
      $bledy[] = "Nazwisko nie może być puste";
  }
  if (empty($pesel)) {
      $bledy[] = "PESEL nie może być pusty";
  } elseif (strlen($pesel) != 11) {
      $bledy[] = "PESEL musi mieć 11 znaków";
  } elseif (!is_numeric($pesel)) {
      $bledy[] = "PESEL musi zawierać tylko cyfry";
  }
  
  // Wyświetl błędy lub zaakceptuj
  if (!empty($bledy)) {
      echo "<h3>❌ Błędy:</h3>";
      foreach ($bledy as $blad) {
          echo "- " . $blad . "<br>";
      }
  } else {
      echo "<h3>✅ Dane są prawidłowe!</h3>";
      echo "Imię: " . $imie . "<br>";
      echo "Nazwisko: " . $nazwisko . "<br>";
      echo "PESEL: " . $pesel . "<br>";
  }
  
  mysqli_close($conn);
?>
```

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Sprawdzania czy pole jest puste
- ✅ Sprawdzania długości tekstu
- ✅ Sprawdzania czy wartość to liczba
- ✅ Sprawdzania zakresu wartości
- ✅ Gromadzenia błędów w tablicy

**Przejdź do 3.4 aby wykonać więcej ćwiczeń walidacji!**
