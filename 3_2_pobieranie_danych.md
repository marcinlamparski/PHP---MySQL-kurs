# 3.2 Pobieranie danych z formularzy — isset() i trim()

## 📚 Teoria

Przed przetworzeniem danych z formularza musimy:
1. Sprawdzić czy dane zostały przesłane (`isset()`)
2. Wyczyścić dane z niepotrzebnych spacji (`trim()`)
3. Bezpiecznie ich użyć

## 🔍 isset() — Sprawdzenie czy zmienna istnieje

```php
<?php
  if (isset($_POST['imie'])) {
      echo "Formularz został wysłany!";
  } else {
      echo "Formularz nie został wysłany";
  }
?>
```

## ✂️ trim() — Usunięcie spacji

```php
<?php
  $tekst = "  Piotr  ";
  $czysty = trim($tekst);  // "Piotr"
  
  echo "Przed: '" . $tekst . "'";
  echo "Po: '" . $czysty . "'";
?>
```

## 🎯 Połączenie isset() i trim()

```php
<?php
  $imie = isset($_POST['imie']) ? trim($_POST['imie']) : '';
  
  // Jeśli formularz wysłany i pole wypełnione, to czysty tekst
  // Jeśli nie, to pusty string
  
  echo "Imię: " . $imie;
?>
```

## 🎯 Praktyka

### Ćwiczenie 3.2.1: Przetwarzanie formularza

1. Utwórz plik `formularz_obliczeń.html`:

```html
<!DOCTYPE html>
<html>
<body>

<h2>Formularz dane pracownika</h2>

<form method="POST" action="obliczeń.php">
  <label>Imię: <input type="text" name="imie"></label><br>
  <label>Nazwisko: <input type="text" name="nazwisko"></label><br>
  <label>Wiek: <input type="number" name="wiek"></label><br>
  <button type="submit">Wyślij</button>
</form>

</body>
</html>
```

2. Utwórz plik `obliczeń.php`:

```php
<?php
  require 'config.php';
  
  // Pobierz dane z formularza
  $imie = isset($_POST['imie']) ? trim($_POST['imie']) : '';
  $nazwisko = isset($_POST['nazwisko']) ? trim($_POST['nazwisko']) : '';
  $wiek = isset($_POST['wiek']) ? trim($_POST['wiek']) : '';
  
  if ($imie && $nazwisko && $wiek) {
      echo "Dane pracownika:<br>";
      echo "Imię: " . $imie . "<br>";
      echo "Nazwisko: " . $nazwisko . "<br>";
      echo "Wiek: " . $wiek . " lat<br>";
  } else {
      echo "Nie wszystkie pola wypełnione!";
  }
  
  mysqli_close($conn);
?>
```

3. Wejdź na `http://localhost/formularz_obliczeń.html`

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Sprawdzania czy dane zostały przesłane (`isset()`)
- ✅ Czyszczenia danych (`trim()`)
- ✅ Bezpiecznego pobierania danych z formularza

**Przejdź do 3.3 aby nauczyć się walidacji danych!**
