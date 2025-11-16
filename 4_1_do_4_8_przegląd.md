# 4.1 do 4.8 — Moduł 4: Prezentacja i filtrowanie danych

## 📚 Krótki przegląd modułu 4

Moduł 4 zawiera:

### 4.1 — Tabele HTML
- Wyświetlanie danych w tabelach
- Formatowanie i stylowanie

### 4.2 — Sortowanie
- ORDER BY ASC/DESC
- Linki do sortowania

```php
$sql = "SELECT * FROM Samochody ORDER BY przebieg DESC";
```

### 4.3 — Filtrowanie
- WHERE do wyszukiwania
- Formularze filtracyjne

```php
$sql = "SELECT * FROM Samochody WHERE przebieg > 100000";
```

### 4.4 — Ćwiczenia
- Praktyka filtrowani i sortowania

### 4.5 — Stronicowanie (Pagination)
- LIMIT i OFFSET
- Nawigacja między stronami

```php
$limit = 5;
$offset = ($strona - 1) * $limit;
$sql = "SELECT * FROM Samochody LIMIT $offset, $limit";
```

### 4.6 — Ćwiczenia stronicowania
- Praktyka pagination

### 4.7 — Szczegóły rekordu
- Pobieranie jednego rekordu
- Wyświetlanie pełnych danych

```php
$id = (int)$_GET['id'];
$sql = "SELECT * FROM Samochody WHERE id_samochodu = $id";
```

### 4.8 — Podsumowanie
- Powtórzenie kluczowych konceptów

## 🎯 Kluczowe funkcje

| Funkcja | Zastosowanie |
|---------|--------------|
| ORDER BY | Sortowanie |
| WHERE | Filtrowanie |
| LIKE | Wyszukiwanie tekstu |
| LIMIT, OFFSET | Stronicowanie |

## 📝 Przykład: Pełna aplikacja

```php
<?php
  require 'config.php';
  
  // Parametry
  $przebieg_min = isset($_GET['przebieg_min']) ? (int)$_GET['przebieg_min'] : 0;
  $sortowanie = isset($_GET['sort']) ? $_GET['sort'] : 'id_samochodu';
  $strona = isset($_GET['page']) ? (int)$_GET['page'] : 1;
  $limit = 5;
  $offset = ($strona - 1) * $limit;
  
  // SQL
  $sql = "SELECT * FROM Samochody WHERE przebieg > $przebieg_min 
          ORDER BY $sortowanie LIMIT $offset, $limit";
  $result = mysqli_query($conn, $sql);
  
  // Wyświetl dane
  while ($row = mysqli_fetch_assoc($result)) {
      echo $row['marka'] . " " . $row['model'] . "<br>";
  }
  
  mysqli_close($conn);
?>
```

**Moduł 4 to praktyczne zastosowanie SELECT z zaawansowanymi funkcjami!**
