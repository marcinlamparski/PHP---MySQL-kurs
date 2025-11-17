# 1.5 Zmienne superglobalne w PHP

## 📚 Teoria

Zmienne superglobalne to specjalne zmienne PHP, które **zawsze są dostępne**, **wszędzie**, we **wszystkich plikach** bez konieczności ich wcześniejszej inicjalizacji.

Są to tablice, które przechowują ważne informacje o:
- Danych przesłanych przez formularze
- Pliki cookies
- Sesje użytkownika
- Informacje o serwerze
- Zmienne środowiskowe

## 🎯 Lista wszystkich zmiennych superglobalnych

| Zmienna | Przeznaczenie |
|---------|---|
| **$_GET** | Dane z URL (widoczne) |
| **$_POST** | Dane z formularzy (ukryte) |
| **$_SERVER** | Informacje o serwerze |
| **$_FILES** | Przesłane pliki |
| **$_COOKIE** | Cookies z komputera użytkownika |
| **$_SESSION** | Dane sesji użytkownika |
| **$_ENV** | Zmienne środowiska |
| **$_REQUEST** | Połączenie $_GET + $_POST + $_COOKIE |

## 📖 Szczegółowe omówienie

### 1️⃣ $_GET — Dane z adresu URL

Dane przesyłane w URL są dostępne w `$_GET`. Są **widoczne** dla wszystkich.

#### Przykład URL:
```
http://localhost/szukaj.php?marka=Toyota&model=Corolla
```

#### Pobranie w PHP:
```php
<?php
  $marka = $_GET['marka'];    // Toyota
  $model = $_GET['model'];    // Corolla
  
  echo "Szukam: " . $marka . " " . $model;
?>
```

#### Ćwiczenie 1.5.1: URL z parametrami

1. Utwórz plik `test_get.php`:

```php
<?php
  if (isset($_GET['imie']) && isset($_GET['wiek'])) {
      $imie = $_GET['imie'];
      $wiek = $_GET['wiek'];
      
      echo "Cześć " . $imie . "!<br>";
      echo "Masz " . $wiek . " lat.<br>";
  } else {
      echo "Brakuje parametrów w URL";
  }
?>
```

2. Wejdź na: `http://localhost/test_get.php?imie=Piotr&wiek=25`

### 2️⃣ $_POST — Dane z formularza

Dane przesłane z formularza metodą POST są **ukryte** i dostępne w `$_POST`.

#### Formularz HTML:
```html
<form method="POST" action="obliczeń.php">
  <input type="text" name="imie" placeholder="Imię">
  <input type="email" name="email" placeholder="Email">
  <button type="submit">Wyślij</button>
</form>
```

#### Przetwarzanie w PHP:
```php
<?php
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $imie = $_POST['imie'];
      $email = $_POST['email'];
      
      echo "Dziękuję " . $imie . " za wiadomość!";
  }
?>
```

#### Ćwiczenie 1.5.2: Formularz z $_POST

1. Utwórz plik `formularz_superglobalne.html`:

```html
<!DOCTYPE html>
<html>
<body>

<h2>Formularz testowy</h2>

<form method="POST" action="przetwórz_post.php">
  <label>Imię: <input type="text" name="imie" required></label><br>
  <label>Wiek: <input type="number" name="wiek" required></label><br>
  <label>Email: <input type="email" name="email" required></label><br>
  <button type="submit">Wyślij</button>
</form>

</body>
</html>
```

2. Utwórz plik `przetwórz_post.php`:

```php
<?php
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $imie = isset($_POST['imie']) ? $_POST['imie'] : '';
      $wiek = isset($_POST['wiek']) ? $_POST['wiek'] : '';
      $email = isset($_POST['email']) ? $_POST['email'] : '';
      
      echo "<h3>Otrzymane dane:</h3>";
      echo "Imię: " . $imie . "<br>";
      echo "Wiek: " . $wiek . "<br>";
      echo "Email: " . $email . "<br>";
  } else {
      echo "Formularz nie został wysłany";
  }
?>
```

3. Otwórz `formularz_superglobalne.html` i wyślij formularz

### 3️⃣ $_SERVER — Informacje o serwerze

`$_SERVER` zawiera informacje o serwerze i aktualnym żądaniu HTTP.

#### Najczęściej używane klucze:

```php
<?php
  echo "Plik: " . $_SERVER['PHP_SELF'] . "<br>";           // test.php
  echo "Metoda: " . $_SERVER['REQUEST_METHOD'] . "<br>";   // GET, POST
  echo "IP klienta: " . $_SERVER['REMOTE_ADDR'] . "<br>";  // 127.0.0.1
  echo "Host: " . $_SERVER['HTTP_HOST'] . "<br>";          // localhost
  echo "Ścieżka: " . $_SERVER['DOCUMENT_ROOT'] . "<br>";   // C:\xampp\htdocs
  echo "Czas: " . $_SERVER['REQUEST_TIME'] . "<br>";       // 1734000000
?>
```

#### Ćwiczenie 1.5.3: Informacje o serwerze

1. Utwórz plik `info_server.php`:

```php
<?php
  echo "<h2>Informacje o serwerze</h2>";
  echo "<table border='1' cellpadding='10'>";
  echo "<tr><th>Klucz</th><th>Wartość</th></tr>";
  
  $info = array('PHP_SELF', 'REQUEST_METHOD', 'REMOTE_ADDR', 'HTTP_HOST', 'REQUEST_TIME');
  
  foreach ($info as $klucz) {
      echo "<tr>";
      echo "<td>" . $klucz . "</td>";
      echo "<td>" . $_SERVER[$klucz] . "</td>";
      echo "</tr>";
  }
  
  echo "</table>";
?>
```

2. Wejdź na: `http://localhost/info_server.php`

### 4️⃣ $_REQUEST — Połączenie GET + POST + COOKIE

`$_REQUEST` zawiera wszystkie dane z $_GET, $_POST i $_COOKIE.

```php
<?php
  // Zamiast:
  if (isset($_POST['imie']) || isset($_GET['imie'])) {
      $imie = $_POST['imie'] ?? $_GET['imie'];
  }
  
  // Możesz użyć:
  if (isset($_REQUEST['imie'])) {
      $imie = $_REQUEST['imie'];
  }
?>
```

### 5️⃣ $_FILES — Przesłane pliki

`$_FILES` zawiera informacje o plikach przesłanych przez formularz.

#### Formularz z plikami:
```html
<form method="POST" action="obliczeń.php" enctype="multipart/form-data">
  <input type="file" name="plik">
  <button type="submit">Wyślij</button>
</form>
```

#### Przetwarzanie:
```php
<?php
  if (isset($_FILES['plik'])) {
      $nazwa = $_FILES['plik']['name'];
      $typ = $_FILES['plik']['type'];
      $rozmiar = $_FILES['plik']['size'];
      
      echo "Plik: " . $nazwa . "<br>";
      echo "Rozmiar: " . $rozmiar . " bajtów<br>";
  }
?>
```

### 6️⃣ $_COOKIE — Pliki cookies

Cookies przechowują dane na komputerze użytkownika.

#### Ustawianie:
```php
<?php
  setcookie("username", "Piotr", time() + 3600);  // Ważne 1 godzinę
?>
```

#### Odczytywanie:
```php
<?php
  if (isset($_COOKIE['username'])) {
      echo "Witaj " . $_COOKIE['username'];
  }
?>
```

### 7️⃣ $_SESSION — Dane sesji

Sesje przechowują dane na serwerze dla każdego użytkownika.

#### Uruchomienie sesji:
```php
<?php
  session_start();
  $_SESSION['zalogowany'] = true;
  $_SESSION['id_uzytkownika'] = 123;
?>
```

#### Odczytywanie:
```php
<?php
  session_start();
  if (isset($_SESSION['zalogowany'])) {
      echo "Jesteś zalogowany";
  }
?>
```

## 🔒 Bezpieczne używanie superglobali

### NIGDY nie ufaj danym od użytkownika!

#### ❌ Niebezpieczne:
```php
<?php
  $sql = "SELECT * FROM Samochody WHERE marka = '" . $_GET['marka'] . "'";
?>
```

#### ✅ Bezpieczne:
```php
<?php
  if (isset($_GET['marka'])) {
      $marka = trim($_GET['marka']);
      $marka = htmlspecialchars($marka);  // Czyszczenie
      
      $sql = "SELECT * FROM Samochody WHERE marka = '$marka'";
  }
?>
```
htmlspecialchars() to funkcja w języku PHP, która zamienia specjalne znaki HTML na ich odpowiedniki HTML, co chroni przed atakami typu Cross-Site Scripting (XSS). Dzięki tej funkcji, dane wprowadzane przez użytkownika (np. w formularzach) są wyświetlane jako dosłowny tekst, a nie jako wykonywalny kod

## 📝 Ćwiczenia praktyczne

### Ćwiczenie 1.5.4: Sprawdzenie metody żądania

Utwórz plik `metoda.php`:

```php
<?php
  if ($_SERVER['REQUEST_METHOD'] == 'GET') {
      echo "To jest żądanie GET";
  } elseif ($_SERVER['REQUEST_METHOD'] == 'POST') {
      echo "To jest żądanie POST";
  } else {
      echo "Inna metoda";
  }
?>
```
$_SERVER['REQUEST_METHOD'] to odwołanie do tablicy globalnej $_SERVER której klucz ['REQUEST_METHOD'] który przechowuje metodę żądania HTTP (np. GET lub POST) używaną do załadowania bieżącego skryptu

### Ćwiczenie 1.5.5: isset() vs empty()

Utwórz plik `isset_vs_empty.php`:

```php
<?php
  echo "Testowanie isset() i empty()<br><br>";
  
  // isset() — sprawdzamy czy zmienna istnieje
  if (isset($_GET['test'])) {
      echo "✅ Parametr 'test' istnieje w URL";
  } else {
      echo "❌ Parametr 'test' nie istnieje w URL";
  }
  
  echo "<br><br>";
  
  // empty() — sprawdzamy czy zmienna jest pusta
  if (!empty($_GET['test'])) {
      echo "✅ Parametr 'test' ma jakąś wartość";
  } else {
      echo "❌ Parametr 'test' jest pusty lub nie istnieje";
  }
?>
```

Wejdź na:
- `http://localhost/isset_vs_empty.php` — oba zwrócą false
- `http://localhost/isset_vs_empty.php?test=` — isset zwróci true, empty zwróci true
- `http://localhost/isset_vs_empty.php?test=wartosc` — oba zwrócą true

## 📊 Porównanie: GET vs POST

| Cecha | GET | POST |
|-------|-----|------|
| **Widoczność** | ✅ W URL | ✅ Ukryte |
| **Rozmiar** | Do ~2000 znaków | Nieograniczony |
| **Bezpieczeństwo** | Mniejsze | Większe |
| **Historia** | Zapisywana | Nie |
| **Używamy do** | Filtrów, wyszukiwania | Formularzy, danych wrażliwych |

## ✅ Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Co to są zmienne superglobalne
- ✅ Różne typy superglobali (GET, POST, SERVER, FILES, SESSION, COOKIE)
- ✅ Różnic między GET a POST
- ✅ Funkcji isset() i empty()
- ✅ Bezpiecznego używania danych od użytkownika
- ✅ Praktycznych zastosowań

## 🚀 Dalsze kroki

W module 3 (Formularze) będziesz intensywnie pracować z `$_GET` i `$_POST`. Teraz masz solidną wiedzę na temat superglobali!

**Przejdź do Modułu 2: Łączenie PHP z MySQL!**
