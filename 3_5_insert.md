# 3.5 INSERT — Wstawianie danych do bazy

## 📚 Teoria

INSERT to polecenie SQL do wstawiania nowych rekordów do bazy.

### Składnia SQL:

```sql
INSERT INTO tabela (kolumna1, kolumna2) VALUES (wartość1, wartość2);
```

### W PHP:

```php
<?php
  $sql = "INSERT INTO Samochody (marka, model, przebieg, nr_rejestracyjny) 
          VALUES ('Toyota', 'Corolla', 100000, 'WZ 1234A')";
  $result = mysqli_query($conn, $sql);
  
  if ($result) {
      echo "Dodano pomyślnie!";
  } else {
      echo "Błąd: " . mysqli_error($conn);
  }
?>
```

## 🎯 Praktyka

### Ćwiczenie 3.5.1: Dodaj samochód

1. Utwórz `formularz_samochodu.html`:

```html
<!DOCTYPE html>
<html>
<body>
<h2>Dodaj samochód</h2>
<form method="POST" action="dodaj_samochod.php">
  <input type="text" name="marka" placeholder="Marka"><br>
  <input type="text" name="model" placeholder="Model"><br>
  <input type="number" name="przebieg" placeholder="Przebieg"><br>
  <input type="text" name="nr_rejestracyjny" placeholder="Nr rejestracyjny"><br>
  <button type="submit">Dodaj</button>
</form>
</body>
</html>
```

2. Utwórz `dodaj_samochod.php`:

```php
<?php
  require 'config.php';
  
  $marka = isset($_POST['marka']) ? trim($_POST['marka']) : '';
  $model = isset($_POST['model']) ? trim($_POST['model']) : '';
  $przebieg = isset($_POST['przebieg']) ? trim($_POST['przebieg']) : '';
  $nr_reg = isset($_POST['nr_rejestracyjny']) ? trim($_POST['nr_rejestracyjny']) : '';
  
  // Walidacja
  if (empty($marka) || empty($model) || empty($przebieg) || empty($nr_reg)) {
      die("Wszystkie pola wymagane!");
  }
  
  // Wstaw do bazy
  $sql = "INSERT INTO Samochody (marka, model, przebieg, nr_rejestracyjny) 
          VALUES ('$marka', '$model', $przebieg, '$nr_reg')";
  
  if (mysqli_query($conn, $sql)) {
      echo "✅ Samochód dodany pomyślnie!";
  } else {
      echo "❌ Błąd: " . mysqli_error($conn);
  }
  
  mysqli_close($conn);
?>
```

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Polecenia INSERT w SQL
- ✅ Wstawiania danych z formularza do bazy
- ✅ Obsługi błędów INSERT

**Przejdź do 3.6 aby nauczyć się komunikatów dla użytkownika!**

Miejsce do wysłania zadań z modułu 3 kl IV: https://www.dropbox.com/request/b7tDoz5gamOvYBt5f2HP

Miejsce do wysłania zadań z modułu 3 kl V: https://www.dropbox.com/request/D1GY3AWftFu6JaQNf8qe
