# 5.1 do 5.4 — Moduł 5: Praca z wieloma tabelami

## 📚 Relacje w bazie danych

Nasze tabele są powiązane:
- **Kierowcy** ma wiele **Zleceń** (jeden kierowca, wiele zleceń)
- **Samochody** ma wiele **Zleceń** (jeden samochód, wiele zleceń)

## 📊 JOIN — Łączenie tabel

### INNER JOIN — tylko powiązane rekordy

```sql
SELECT Zlecenia.*, Kierowcy.imie, Kierowcy.nazwisko, Samochody.marka
FROM Zlecenia
INNER JOIN Kierowcy ON Zlecenia.id_kierowcy = Kierowcy.id_kierowcy
INNER JOIN Samochody ON Zlecenia.id_samochodu = Samochody.id_samochodu;
```

### LEFT JOIN — wszystkie z lewej tabeli

```sql
SELECT Kierowcy.*, COUNT(Zlecenia.id_zlecenia) as liczba_zlecen
FROM Kierowcy
LEFT JOIN Zlecenia ON Kierowcy.id_kierowcy = Zlecenia.id_kierowcy
GROUP BY Kierowcy.id_kierowcy;
```

## 🎯 W PHP

```php
<?php
  require 'config.php';
  
  $sql = "SELECT 
            Zlecenia.id_zlecenia,
            Zlecenia.data_zlecenia,
            Kierowcy.imie,
            Kierowcy.nazwisko,
            Samochody.marka,
            Samochody.model,
            Zlecenia.opis
          FROM Zlecenia
          JOIN Kierowcy ON Zlecenia.id_kierowcy = Kierowcy.id_kierowcy
          JOIN Samochody ON Zlecenia.id_samochodu = Samochody.id_samochodu
          ORDER BY Zlecenia.data_zlecenia DESC";
  
  $result = mysqli_query($conn, $sql);
  
  echo "<table border='1' cellpadding='10'>";
  echo "<tr><th>Data</th><th>Kierowca</th><th>Samochód</th><th>Opis</th></tr>";
  
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['data_zlecenia'] . "</td>";
      echo "<td>" . $row['imie'] . " " . $row['nazwisko'] . "</td>";
      echo "<td>" . $row['marka'] . " " . $row['model'] . "</td>";
      echo "<td>" . $row['opis'] . "</td>";
      echo "</tr>";
  }
  echo "</table>";
  
  mysqli_close($conn);
?>
```

## 📝 Podsumowanie

W module 5 nauczysz się:
- ✅ Związków między tabelami
- ✅ JOIN — łączenia tabel
- ✅ Pobierania danych z wielu źródeł
- ✅ Zaawansowanych zapytań SQL

**To kończy Moduł 5. Przejdź do Modułu 6!**
