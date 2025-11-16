# 6.1 do 6.4 — Moduł 6: Zaawansowane techniki i optymalizacja

## 📚 Moduł 6 zawiera

### 6.1 — Indeksy i optymalizacja
Indeksy przyspieszają wyszukiwanie:
```sql
CREATE INDEX idx_marka ON Samochody(marka);
```

### 6.2 — Transakcje
Grupy operacji które albo wszystkie się powodzą, albo wszystkie się cofają:

```php
<?php
  mysqli_begin_transaction($conn);
  
  try {
      $sql1 = "UPDATE Kierowcy SET ...";
      $sql2 = "INSERT INTO Zlecenia ...";
      
      if (mysqli_query($conn, $sql1) && mysqli_query($conn, $sql2)) {
          mysqli_commit($conn);
          echo "✅ Operacja OK";
      } else {
          throw new Exception("Błąd");
      }
  } catch (Exception $e) {
      mysqli_rollback($conn);
      echo "❌ Cofnięto";
  }
?>
```

### 6.3 — Obsługa wyjątków i logowanie
```php
try {
    $result = mysqli_query($conn, $sql);
} catch (Exception $e) {
    error_log("Błąd: " . $e->getMessage());
}
```

### 6.4 — Procedury składowane
Zapytania SQL zapisane na serwerze:

```sql
DELIMITER //
CREATE PROCEDURE GetSamochodyByMarka(IN p_marka VARCHAR(50))
BEGIN
  SELECT * FROM Samochody WHERE marka = p_marka;
END//
DELIMITER ;
```

Wywołanie z PHP:
```php
$sql = "CALL GetSamochodyByMarka('Toyota')";
$result = mysqli_query($conn, $sql);
```

## 📝 Podsumowanie Modułu 6

- ✅ Indeksy do optymalizacji
- ✅ Transakcje (ACID)
- ✅ Obsługa błędów
- ✅ Procedury składowane

**To kończy Moduł 6. Przejdź do ostatniego Modułu 7!**
