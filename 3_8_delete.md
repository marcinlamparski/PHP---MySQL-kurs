# 3.8 DELETE — Usuwanie danych

## 📚 Teoria

DELETE usuwa rekordy z bazy. ZAWSZE używaj WHERE!

```sql
DELETE FROM tabela WHERE warunek;
```

## 🎯 Praktyka

```php
<?php
  require 'config.php';
  
  $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
  
  if (isset($_GET['confirm']) && $_GET['confirm'] == 'yes') {
      $sql = "DELETE FROM Samochody WHERE id_samochodu=$id";
      
      if (mysqli_query($conn, $sql)) {
          echo "✅ Samochód usunięty!";
      } else {
          echo "❌ Błąd: " . mysqli_error($conn);
      }
  } else {
      echo "Czy na pewno usunąć?<br>";
      echo "<a href='?id=$id&confirm=yes'>Tak</a> | <a href='javascript:history.back()'>Nie</a>";
  }
  
  mysqli_close($conn);
?>
```

**Przejdź do 3.9!**
