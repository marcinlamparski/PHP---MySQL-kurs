# 3.1 Formularze HTML i metody GET/POST

## 📚 Teoria

Formularz HTML to sposób na zbieranie danych od użytkownika. W PHP używamy:
- **GET** — dane widoczne w URL, dla małych ilości danych
- **POST** — dane ukryte, dla większych ilości i danych wrażliwych

## 🎯 Formularz HTML — GET

```html
<form method="GET" action="obliczeń.php">
  <label>Imię: <input type="text" name="imie"></label><br>
  <button type="submit">Wyślij</button>
</form>
```

Dane wysyłane w URL: `http://localhost/obliczeń.php?imie=Piotr`

W PHP pobierz:
```php
$imie = $_GET['imie'];  // Piotr
```

## 🎯 Formularz HTML — POST

```html
<form method="POST" action="obliczeń.php">
  <label>Imię: <input type="text" name="imie"></label><br>
  <button type="submit">Wyślij</button>
</form>
```

Dane wysyłane w tle, dane ukryte w URL.

W PHP pobierz:
```php
$imie = $_POST['imie'];  // Piotr
```

## 📝 Różnice GET i POST

| Cecha | GET | POST |
|-------|-----|------|
| **Dane w URL** | Widoczne | Ukryte |
| **Rozmiar** | do ~2000 znaków | Większy |
| **Bezpieczeństwo** | Mniejsze | Większe |
| **Zakładki** | Można podzielić się URL | Nie można |
| **Do czego** | Wyszukiwanie, filtry | Formularze, dane wrażliwe |

## 🎯 Praktyka

### Ćwiczenie 3.1.1: Prosty formularz GET
Utwórz oba poniższe pliki, połącz się z bazą i sprawdź czy GET działa!
Zamień metodę GET na POST - co się zmieniło?

1. Utwórz plik `formularz_get.php`:

```html
<!DOCTYPE html>
<html>
<head>
  <title>Formularz GET</title>
</head>
<body>

<h2>Przeszukaj samochody</h2>

<form method="GET" action="szukaj.php">
  <label>Szukana marka: 
    <input type="text" name="marka">
  </label>
  <button type="submit">Szukaj</button>
</form>

</body>
</html>
```

2. Utwórz plik `szukaj.php`:

```php
<?php
  require 'config.php';
  
  if (isset($_GET['marka'])) {
      $marka = $_GET['marka'];
      
      $sql = "SELECT * FROM Samochody WHERE marka LIKE '%$marka%'";
      $result = mysqli_query($conn, $sql);
      
      echo "<h2>Wyniki dla: " . $marka . "</h2>";
      
      if (mysqli_num_rows($result) > 0) {
          echo "<table border='1' cellpadding='10'>";
          echo "<tr><th>Marka</th><th>Model</th></tr>";
          
          while ($row = mysqli_fetch_assoc($result)) {
              echo "<tr>";
              echo "<td>" . $row['marka'] . "</td>";
              echo "<td>" . $row['model'] . "</td>";
              echo "</tr>";
          }
          echo "</table>";
      } else {
          echo "Nie znaleziono.";
      }
  }
  
  mysqli_close($conn);
?>
```

### Ćwiczenie 3.1.2: Formularz POST
Utwórz oba poniższe pliki, połącz się z bazą i sprawdź czy POST działa!
1. Utwórz plik `dodaj_kierowce.php`:

```html
<!DOCTYPE html>
<html>
<body>

<h2>Dodaj nowego kierowcę</h2>

<form method="POST" action="przetwórz_kierowce.php">
  <label>Imię: <input type="text" name="imie"></label><br>
  <label>Nazwisko: <input type="text" name="nazwisko"></label><br>
  <label>PESEL: <input type="text" name="pesel"></label><br>
  <button type="submit">Dodaj</button>
</form>

</body>
</html>
```

2. Utwórz plik `przetwórz_kierowce.php`:

```php
<?php
  require 'config.php';
  
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $imie = $_POST['imie'];
      $nazwisko = $_POST['nazwisko'];
      $pesel = $_POST['pesel'];
      
      echo "Otrzymałem:<br>";
      echo "Imię: " . $imie . "<br>";
      echo "Nazwisko: " . $nazwisko . "<br>";
      echo "PESEL: " . $pesel . "<br>";
  }
  
  mysqli_close($conn);
?>
```
Tablica superglobalna $_SERVER w PHP to specjalna tablica asocjacyjna, która zawiera informacje o środowisku serwera oraz szczegóły dotyczące bieżącego żądania HTTP. Jest dostępna w każdym kontekście skryptu bez konieczności wcześniejszego definiowania i przechowuje klucze z takimi danymi jak typ metody żądania (np. GET, POST), adresy IP, ścieżki do wykonywanych skryptów, nagłówki HTTP, dane o przeglądarce użytkownika czy adres URL wywołanego skryptu.

Przykładowo, $_SERVER['REQUEST_METHOD'] zwraca metodę HTTP, jaką wysłano do serwera (np. "POST" lub "GET"), co pozwala na warunkowe wykonywanie kodu w zależności od typu zapytania. Inne popularne klucze to:
- SERVER_NAME – nazwa serwera,
- HTTP_USER_AGENT – informacje o przeglądarce klienta,
- REMOTE_ADDR – adres IP użytkownika,
- REQUEST_URI – żądany URI (adres strony).

Ta tablica jest tworzona przez serwer WWW i jej zawartość może się różnić w zależności od konfiguracji serwera i środowiska, w którym działa skrypt PHP. $_SERVER jest bardzo przydatna do zbierania meta-danych o żądaniu i środowisku, które pozwalają na dynamiczne reagowanie na różne sytuacje w aplikacji webowej.[1][2]

[1](https://kursphp.com/zmienne-superglobalne/)
[2](https://www.php.net/manual/en/language.variables.superglobals.php)

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Różnic między GET i POST
- ✅ Tworzenia formularzy HTML
- ✅ Pobierania danych z $_GET i $_POST
- ✅ Sprawdzania czy formularz został wysłany

**Przejdź do 3.2 aby nauczyć się bardziej zaawansowanej pracy z danymi!**
## link do wysłania zadań: https://www.dropbox.com/request/cfG3R9wNnNkysRWIn3C7
