# 1.2 Podstawy PHP

## 📚 Teoria

PHP (Hypertext Preprocessor) to język programowania działający po stronie serwera. Oznacza to, że kod PHP jest wykonywany na serwerze, a do przeglądarki wysyłany jest wynik (zazwyczaj HTML).

### Podstawowe znaczniki PHP

Każdy kod PHP musi być otoczony znacznikami:

```php
<?php
  // Twój kod PHP tutaj
?>
```

## 📝 Zmienne

Zmienna to pojemnik przechowujący dane. W PHP zmienne zaczynają się od znaku `$`.

### Deklaracja zmiennej:

```php
<?php
  $imie = "Piotr";           // Tekst (string)
  $wiek = 25;                // Liczba całkowita (int)
  $pensja = 3500.50;         // Liczba z przecinkiem (float)
  $czyAktywny = true;        // Wartość logiczna (boolean)
?>
```

### Wyświetlanie zmiennych:

```php
<?php
  $imie = "Piotr";
  echo $imie;                // Wyświetli: Piotr
  echo "Mam na imię " . $imie;  // Połączenie tekstów (.)
?>
```

## 🎯 Praktyka

### Ćwiczenie 1.2.1: Zmienne

Utwórz plik `zmienne.php`:

```php
<?php
  // Deklarujesz zmienne
  $imie = "Anna";
  $nazwisko = "Nowak";
  $wiek = 28;
  
  // Wyświetlasz informacje
  echo "Imię: " . $imie . "<br>";
  echo "Nazwisko: " . $nazwisko . "<br>";
  echo "Wiek: " . $wiek . "<br>";
?>
```

Wejdź na `http://localhost/zmienne.php`

## 🧮 Operatory

### Operatory arytmetyczne:

```php
<?php
  $a = 10;
  $b = 3;
  
  echo $a + $b;  // 13 (dodawanie)
  echo $a - $b;  // 7 (odejmowanie)
  echo $a * $b;  // 30 (mnożenie)
  echo $a / $b;  // 3.33... (dzielenie)
  echo $a % $b;  // 1 (reszta z dzielenia)
?>
```

### Operatory porównania:

```php
<?php
  $a = 10;
  $b = 10;
  
  $a == $b;   // true (równe)
  $a === $b;  // true (równe i tego samego typu)
  $a != $b;   // false (nie równe)
  $a < 20;    // true (mniejsze)
  $a > 5;     // true (większe)
?>
```

### Operatory logiczne:

```php
<?php
  $a = true;
  $b = false;
  
  $a && $b;   // false (AND - oba muszą być true)
  $a || $b;   // true (OR - przynajmniej jedno musi być true)
  !$a;        // false (NOT - negacja)
?>
```

## 🎯 Praktyka

### Ćwiczenie 1.2.2: Operatory

Utwórz plik `operatory.php`:

```php
<?php
  $cena = 100;
  $rabat = 0.1;  // 10%
  
  // Obliczanie ceny po rabacie
  $cenaPoRabacie = $cena * (1 - $rabat);
  
  echo "Cena orygginalna: " . $cena . " zł<br>";
  echo "Rabat: " . ($rabat * 100) . "%<br>";
  echo "Cena po rabacie: " . $cenaPoRabacie . " zł<br>";
?>
```

## 🔄 Instrukcja warunkowa (if/else)

Umożliwia wykonywanie różnych czynności w zależności od warunku.

```php
<?php
  $wiek = 25;
  
  if ($wiek >= 18) {
      echo "Jesteś pełnoletni";
  } else {
      echo "Jesteś niepełnoletni";
  }
?>
```

### Bardziej zaawansowany przykład:

```php
<?php
  $ocena = 3;
  
  if ($ocena == 5) {
      echo "Bardzo dobrze!";
  } elseif ($ocena == 4) {
      echo "Dobrze!";
  } elseif ($ocena == 3) {
      echo "Średnio";
  } else {
      echo "Słabo";
  }
?>
```

## 🎯 Praktyka

### Ćwiczenie 1.2.3: Instrukcje warunkowe

Utwórz plik `warunki.php`:

```php
<?php
  $temperatura = 15;
  
  if ($temperatura > 25) {
      echo "Gorąco! Ubierz się lekko.";
  } elseif ($temperatura > 15) {
      echo "Przyjemnie. Weź lekką kurtkę.";
  } elseif ($temperatura > 5) {
      echo "Zimno. Weź grubą kurtkę.";
  } else {
      echo "Bardzo zimno! Weź czapkę i szalik.";
  }
?>
```

## 🔁 Pętle

Pętle pozwalają powtarzać kod wiele razy.

### Pętla for:

```php
<?php
  for ($i = 1; $i <= 5; $i++) {
      echo "Numer: " . $i . "<br>";
  }
?>
```

### Pętla while:

```php
<?php
  $i = 1;
  while ($i <= 5) {
      echo "Numer: " . $i . "<br>";
      $i++;  // Zwiększ $i o 1
  }
?>
```

## 🎯 Praktyka

### Ćwiczenie 1.2.4: Pętle

Utwórz plik `petle.php`:

```php
<?php
  echo "<h2>Tabliczka mnożenia liczby 5</h2>";
  
  for ($i = 1; $i <= 10; $i++) {
      $wynik = 5 * $i;
      echo "5 × " . $i . " = " . $wynik . "<br>";
  }
?>
```

## 📚 Tablice (Arrays)

Tablica przechowuje wiele wartości w jednej zmiennej.

```php
<?php
  // Tablica indeksowana (zaczyna się od 0)
  $owoce = array("Jabłko", "Banana", "Pomarańcza");
  
  echo $owoce[0];  // Jabłko
  echo $owoce[1];  // Banana
  
  // Tablica asocjacyjna (klucze tekstowe)
  $pracownik = array(
      "imie" => "Piotr",
      "nazwisko" => "Nowak",
      "wiek" => 25
  );
  
  echo $pracownik["imie"];  // Piotr
?>
```

### Pętle w tablicach:

```php
<?php
  $kierowcy = array("Piotr", "Anna", "Marek");
  
  foreach ($kierowcy as $kierowca) {
      echo "Kierowca: " . $kierowca . "<br>";
  }
?>
```

## 🎯 Praktyka

### Ćwiczenie 1.2.5: Tablice

Utwórz plik `tablice.php`:

```php
<?php
  $samochody = array(
      "marka" => "Toyota",
      "model" => "Corolla",
      "rok" => 2022,
      "przebieg" => 120000
  );
  
  echo "<h2>Informacje o samochodzie</h2>";
  echo "Marka: " . $samochody["marka"] . "<br>";
  echo "Model: " . $samochody["model"] . "<br>";
  echo "Rok: " . $samochody["rok"] . "<br>";
  echo "Przebieg: " . $samochody["przebieg"] . " km<br>";
?>
```

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Składni PHP
- ✅ Deklarowania zmiennych
- ✅ Używania operatorów
- ✅ Instrukcji warunkowych (if/else)
- ✅ Pętli (for, while)
- ✅ Tablic i foreach

**Przejdź do 1.3 aby nauczyć się SQL-a!**
