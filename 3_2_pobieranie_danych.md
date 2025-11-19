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
UWAGA linia:
$imie = isset($_POST['imie']) ? trim($_POST['imie']) : ''; to to samo co:
<?php
if (isset($_POST['imie'])) {
    $imie = trim($_POST['imie']);
} else {
    $imie = '';
}
?>
3. Wejdź na `http://localhost/formularz_obliczeń.html`

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Sprawdzania czy dane zostały przesłane (`isset()`)
- ✅ Czyszczenia danych (`trim()`)
- ✅ Bezpiecznego pobierania danych z formularza

## 🎯 Zadanie praktyczne do samodzielnego wykonania

### Projekt 3.2.2: Rejestracja kierowcy — Formularz + Wynik

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

**Miejsce do wysłania zadań z modułu 3 kl IV:** https://www.dropbox.com/request/b7tDoz5gamOvYBt5f2HP
