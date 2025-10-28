<?php
$conn = mysqli_connect('localhost', 'root', '', 'kurier');
if (!$conn) die('Błąd połączenia z bazą');

$search = isset($_POST['search_term']) ? $_POST['search_term'] : '';
if ($search !== '') {
  // Wyszukiwanie po marce LUB modelu samochodu 
  $sql = "SELECT * FROM Samochody WHERE marka LIKE '%$search%' OR model LIKE '%$search%'";
  $result = mysqli_query($conn, $sql);
  if (mysqli_num_rows($result) > 0) {
    echo "<table border=1><tr><th>Marka</th><th>Model</th><th>Nr rejestracyjny</th></tr>";
    while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr><td>".$row['marka']."</td><td>".$row['model']."</td><td>".$row['nr_rejestracyjny']."</td></tr>";
    }
    echo "</table>";
  } else {
    echo "<div class='msg'>Brak wyników dla podanego wyszukiwania.</div>";
  }
} else {
  echo "<div class='msg'>Podaj frazę do wyszukania.</div>";
}
mysqli_close($conn);
?>
