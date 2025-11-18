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

## 🎯 Zadanie praktyczne do samodzielnego wykonania

### Projekt 3.2.1: Rejestracja kierowcy — Formularz + Wynik

**Cel**: Utwórz aplikację, która:
1. Wyświetla formularz rejestracji kierowcy
2. Pobiera dane za pomocą POST
3. Wyświetla je na innej stronie

**Wymagania**:
- Formularz powinien zawierać pola:
  - **Imię** (tekst)
  - **Nazwisko** (tekst)
  - **Email** (email)
  - **Nr telefonu** (tekst)
  - **Doświadczenie** (liczba lat, liczba)
  
- Na stronie wynikowej powinny wyświetlić się:
  - Powitanie: "Witaj [Imię] [Nazwisko]!"
  - Pełne dane w formie tabeli HTML
  - Obliczone doświadczenie w latach (np. "15 lat doświadczenia")
  - Link powrotny do formularza

**Kroki do wykonania**:

1. **Krok 1**: Utwórz plik `rejestracja_kierowcy.html` z formularzem

```html
<!DOCTYPE html>
<html>
<head>
    <title>Rejestracja Kierowcy</title>
</head>
<body>

<h2>Formularz rejestracji kierowcy</h2>

<form method="POST" action="przetwórz_rejestracje.php">
  <!-- TODO: Dodaj 5 pól formularza -->
  <!-- Pola: imie, nazwisko, email, telefon, doswiadczenie -->
  
  <button type="submit">Zarejestruj się</button>
</form>

</body>
</html>
```

2. **Krok 2**: Utwórz plik `przetwórz_rejestracje.php` z przetwarzaniem

```php
<?php
  // TODO: 
  // 1. Pobierz wszystkie dane z $_POST za pomocą isset() i trim()
  // 2. Sprawdź czy wszystkie pola są wypełnione
  // 3. Wyświetl dane na stronie:
  //    - Powitanie
  //    - Tabelę HTML
  //    - Lata doświadczenia
  //    - Link powrotny
?>
```

**Struktura wyświetlanej strony powinna wyglądać tak**:

```
Witaj [Imię] [Nazwisko]!

Twoje dane rejestracyjne:
┌─────────────────┬──────────────┐
│ Pole            │ Wartość      │
├─────────────────┼──────────────┤
│ Imię            │ [imie]       │
│ Nazwisko        │ [nazwisko]   │
│ Email           │ [email]      │
│ Telefon         │ [telefon]    │
│ Doświadczenie   │ [dni] lat    │
└─────────────────┴──────────────┘

[Powrót do formularza]
```

---

### 📝 Rozwiązanie (sprawdź po wykonaniu)

**Plik 1: rejestracja_kierowcy.html**

```html
<!DOCTYPE html>
<html>
<head>
    <title>Rejestracja Kierowcy</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        input, button { padding: 8px; margin: 5px 0; width: 300px; }
        button { background: #007bff; color: white; cursor: pointer; }
    </style>
</head>
<body>

<h2>📋 Formularz rejestracji kierowcy</h2>

<form method="POST" action="przetwórz_rejestracje.php">
  
  <label><b>Imię:</b></label><br>
  <input type="text" name="imie" placeholder="np. Piotr" required><br>
  
  <label><b>Nazwisko:</b></label><br>
  <input type="text" name="nazwisko" placeholder="np. Nowak" required><br>
  
  <label><b>Email:</b></label><br>
  <input type="email" name="email" placeholder="np. piotr@example.com" required><br>
  
  <label><b>Nr telefonu:</b></label><br>
  <input type="text" name="telefon" placeholder="np. 123456789" required><br>
  
  <label><b>Lata doświadczenia:</b></label><br>
  <input type="number" name="doswiadczenie" placeholder="np. 5" min="0" required><br>
  
  <button type="submit">✅ Zarejestruj się</button>
  
</form>

</body>
</html>
```

**Plik 2: przetwórz_rejestracje.php**

```php
<?php
  // Pobierz dane z formularza
  $imie = isset($_POST['imie']) ? trim($_POST['imie']) : '';
  $nazwisko = isset($_POST['nazwisko']) ? trim($_POST['nazwisko']) : '';
  $email = isset($_POST['email']) ? trim($_POST['email']) : '';
  $telefon = isset($_POST['telefon']) ? trim($_POST['telefon']) : '';
  $doswiadczenie = isset($_POST['doswiadczenie']) ? (int)$_POST['doswiadczenie'] : 0;
  
  // Sprawdzenie czy wszystkie pola są wypełnione
  if (empty($imie) || empty($nazwisko) || empty($email) || empty($telefon) || $doswiadczenie < 0) {
      die("❌ Błąd: Wszystkie pola są wymagane!");
  }
?>

<!DOCTYPE html>
<html>
<head>
    <title>Potwierdzenie rejestracji</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        table { border-collapse: collapse; width: 500px; }
        table, th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background: #f0f0f0; }
        .success { color: green; font-weight: bold; }
        a { color: #007bff; text-decoration: none; }
    </style>
</head>
<body>

<h2 class="success">✅ Witaj <?php echo $imie . " " . $nazwisko; ?>!</h2>

<p>Twoja rejestracja została potwierdzona.</p>

<h3>📊 Twoje dane rejestracyjne:</h3>

<table>
  <tr>
    <th>Pole</th>
    <th>Wartość</th>
  </tr>
  <tr>
    <td><b>Imię</b></td>
    <td><?php echo $imie; ?></td>
  </tr>
  <tr>
    <td><b>Nazwisko</b></td>
    <td><?php echo $nazwisko; ?></td>
  </tr>
  <tr>
    <td><b>Email</b></td>
    <td><?php echo $email; ?></td>
  </tr>
  <tr>
    <td><b>Telefon</b></td>
    <td><?php echo $telefon; ?></td>
  </tr>
  <tr>
    <td><b>Doświadczenie</b></td>
    <td>
      <?php 
        if ($doswiadczenie == 1) {
            echo "1 rok";
        } elseif ($doswiadczenie < 5) {
            echo $doswiadczenie . " lata";
        } else {
            echo $doswiadczenie . " lat";
        }
      ?>
    </td>
  </tr>
</table>

<br>

<h3>📌 Podsumowanie:</h3>
<p>Jako kierowca z <?php echo $doswiadczeniem; ?>-letnim doświadczeniem jesteś gotów do pracy!</p>

<br>

<a href="rejestracja_kierowcy.html">← Powrót do formularza</a>

</body>
</html>
```

---

## 🎯 Co nauczą się uczniowie?

✅ Pobieranie danych z POST  
✅ Używanie isset() i trim()  
✅ Walidacja danych  
✅ Wyświetlanie danych na nowej stronie  
✅ Logika warunkowa (jeśli pola puste)  
✅ Formatowanie wyników (tabela HTML)  
✅ Wracanie do formularza (link)  

---

**Przejdź do 3.3 aby nauczyć się walidacji danych!**
