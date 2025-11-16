# 2.2 Podstawowe połączenie z bazą danych

## 📚 Teoria

Aby połączyć PHP z MySQL, musimy:
1. Połączyć się z serwerem MySQL
2. Wybrać bazę danych
3. Sprawdzić czy połączenie się powiodło

W tym kursie używamy **MySQLi w stylu proceduralnym**.

## 🔗 Krok po kroku

### Krok 1: Połączenie

```php
<?php
  $conn = mysqli_connect("localhost", "root", "", "kurier");
?>
```

Parametry:
- `"localhost"` — adres serwera (zawsze localhost w XAMPP)
- `"root"` — nazwa użytkownika (domyślnie root)
- `""` — hasło (domyślnie puste)
- `"kurier"` — nazwa bazy danych

### Krok 2: Sprawdzenie połączenia

```php
<?php
  $conn = mysqli_connect("localhost", "root", "", "kurier");
  
  // Sprawdzenie błędu
  if (!$conn) {
      die("Błąd połączenia: " . mysqli_connect_error());
  }
  echo "Połączone pomyślnie!";
?>
```

### Krok 3: Zamknięcie połączenia

```php
<?php
  $conn = mysqli_connect("localhost", "root", "", "kurier");
  
  if (!$conn) {
      die("Błąd połączenia: " . mysqli_connect_error());
  }
  
  // Tutaj Twój kod...
  
  // Zamknięcie połączenia
  mysqli_close($conn);
?>
```

## 📁 Plik konfiguracyjny (najlepiej!)

Zamiast każdorazowo wpisywać dane, lepiej stworzyć plik `config.php`:

```php
<?php
  // config.php
  define("DB_SERVER", "localhost");
  define("DB_USER", "root");
  define("DB_PASSWORD", "");
  define("DB_NAME", "kurier");
  
  // Połączenie
  $conn = mysqli_connect(
      DB_SERVER,
      DB_USER,
      DB_PASSWORD,
      DB_NAME
  );
  
  // Sprawdzenie
  if (!$conn) {
      die("Błąd połączenia: " . mysqli_connect_error());
  }
?>
```

Teraz w każdym pliku możesz dołączyć:

```php
<?php
  require 'config.php';  // Teraz masz dostęp do $conn
  
  // Twój kod...
?>
```

## 🎯 Praktyka

### Ćwiczenie 2.2.1: Pierwsze połączenie

1. Utwórz plik `config.php` w `C:\xampp\htdocs\`:

```php
<?php
  define("DB_SERVER", "localhost");
  define("DB_USER", "root");
  define("DB_PASSWORD", "");
  define("DB_NAME", "kurier");
  
  $conn = mysqli_connect(
      DB_SERVER,
      DB_USER,
      DB_PASSWORD,
      DB_NAME
  );
  
  if (!$conn) {
      die("Błąd połączenia: " . mysqli_connect_error());
  }
?>
```

2. Utwórz plik `test_polaczenie.php`:

```php
<?php
  require 'config.php';
  
  echo "Połączenie z bazą danych powiodło się!";
  echo "<br>";
  echo "Baza: " . DB_NAME;
  echo "<br>";
  echo "Użytkownik: " . DB_USER;
  
  mysqli_close($conn);
?>
```

3. Wejdź na: `http://localhost/test_polaczenie.php`
4. Powinna wyświetlić się wiadomość potwierdzająca połączenie

### Ćwiczenie 2.2.2: Obsługa błędu

1. Utwórz plik `test_blad.php`:

```php
<?php
  // Celowo podaj złe dane
  $conn = mysqli_connect("localhost", "root", "", "zla_baza");
  
  if (!$conn) {
      echo "❌ Nie udało się połączyć: " . mysqli_connect_error();
  } else {
      echo "✅ Połączenie OK";
  }
?>
```

2. Wejdź na ten plik
3. Powinna się wyświetlić wiadomość błędu
4. To pokazuje jak debugować błędy połączenia

## 🔧 Zmienne Unicode

Aby prawidłowo wyświetlać polskie znaki, dodaj tę linię:

```php
<?php
  $conn = mysqli_connect("localhost", "root", "", "kurier");
  
  // Ustaw kodowanie UTF-8
  mysqli_set_charset($conn, "utf8mb4");
?>
```

## 📝 Podsumowanie

W tej lekcji nauczyłeś się:
- ✅ Łączenia PHP z MySQL
- ✅ Sprawdzania błędów połączenia
- ✅ Zamykania połączenia
- ✅ Tworzenia pliku konfiguracyjnego
- ✅ Obsługi polskich znaków

**Przejdź do 2.3 aby nauczyć się pobierania danych!**
