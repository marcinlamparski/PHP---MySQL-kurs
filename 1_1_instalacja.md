# 1.1 Instalacja i konfiguracja XAMPP/WAMP

## 📚 Teoria

Aby pracować z PHP i MySQL, potrzebujemy środowiska, które zawiera:
- **Apache** (serwer HTTP)
- **MySQL** (system bazy danych)
- **PHP** (język programowania)
- **PhpMyAdmin** (narzędzie do zarządzania bazą)

**XAMPP** i **WAMP** to gotowe pakiety zawierające wszystko powyżej.

## 🛠️ Instalacja XAMPP

### Kroki instalacji:

1. **Pobierz XAMPP**
   - Wejdź na: https://www.apachefriends.org/
   - Pobierz wersję dla Twojego systemu operacyjnego (Windows/Mac/Linux)

2. **Uruchom instalator**
   - Kliknij na pobrany plik `.exe` (Windows)
   - Postępuj zgodnie z instrukcjami kreatora
   - Zaznacz komponenty: Apache, MySQL, PHP

3. **Wybierz folder instalacji**
   - Domyślnie: `C:\xampp` (Windows) lub `/Applications/XAMPP` (Mac)
   - Zapamiętaj tę ścieżkę!

4. **Zakończ instalację**
   - Kliknij "Finish"
   - XAMPP powinien się otworzyć automatycznie

## 🚀 Uruchamianie XAMPP

### Windows:
1. Otwórz folder XAMPP (domyślnie `C:\xampp`)
2. Kliknij **XAMPP Control Panel** (xampp-control.exe)
3. W oknie kliknij **Start** przy Apache i MySQL

### Mac/Linux:
```bash
sudo /Applications/XAMPP/xamppfiles/xampp start
```

## ✅ Weryfikacja instalacji

Po uruchomieniu Apache i MySQL:

1. Otwórz przeglądarki
2. Wejdź na: `http://localhost`
3. Powinna się wyświetlić strona witająca XAMPP
4. Kliknij na zakładkę **phpMyAdmin**
5. Powinna się załadować aplikacja phpMyAdmin

## 📁 Gdzie umieszczać projekty?

Wszystkie pliki PHP muszą być w folderze **htdocs**:
- **Windows**: `C:\xampp\htdocs\`
- **Mac**: `/Applications/XAMPP/xamppfiles/htdocs/`
- **Linux**: `/opt/xampp/htdocs/`

Każdy plik `.php` umieszczony tam będzie dostępny pod adresem: `http://localhost/nazwa_pliku.php`

## 🎯 Praktyka

### Ćwiczenie 1.1.1: Pierwszy plik PHP

1. Otwórz notatnik lub edytor tekstu (Visual Studio Code, Sublime Text, Notepad++)
2. Wpisz:

```php
<?php
  echo "Cześć! Moja pierwsza aplikacja w PHP!";
?>
```

3. Zapisz plik jako `test.php` w folderze `C:\xampp\htdocs\` (Windows)
4. Wejdź na: `http://localhost/test.php`
5. Powinna się wyświetlić wiadomość

### Ćwiczenie 1.1.2: Weryfikacja PHP

Utwórz plik o nazwie `info.php`:

```php
<?php
  phpinfo();
?>
```

Wejdź na `http://localhost/info.php`. Powinna się wyświetlić szczegółowa informacja o PHP i jego konfiguracji.

## 🐛 Rozwiązywanie problemów

### Problem: "Strona nie znaleziona" (404)
- Sprawdź, czy plik jest w folderze `htdocs`
- Sprawdzić, czy Apache jest włączony (zielone światło w XAMPP Control Panel)

### Problem: "Nie mogę się połączyć"
- Upewnij się, że zarówno Apache jak i MySQL są uruchomione
- Spróbuj zresetować serwery (Stop, a następnie Start)

### Problem: "Błąd portu"
- Inne aplikacje mogą używać port 80 (Apache) lub 3306 (MySQL)
- W XAMPP Control Panel możesz zmienić porty w konfiguracji

## 📝 Podsumowanie

W tej lekcji:
- ✅ Zainstalowałeś XAMPP
- ✅ Uruchomiłeś Apache i MySQL
- ✅ Zweryfikowałeś działanie PHP
- ✅ Wiesz gdzie umieszczać pliki projektu

**Teraz jesteś gotowy do nauki PHP! Przejdź do następnego modułu.**
