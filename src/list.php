<?php include("../db.php"); ?>

<h2>Clienti</h2>
<a href="add.php">Aggiungi</a>

<table>
<tr><th>Nome</th><th>Telefono</th></tr>

<?php
$res = $conn->query("SELECT * FROM Cliente");
while($row = $res->fetch_assoc()){
    echo "<tr>
        <td>{$row['nome']}</td>
        <td>{$row['telefono']}</td>
    </tr>";
}
?>
</table>


<h2>Prodotti</h2>
<a href="add.php">Aggiungi</a>

<table>
<tr><th>Nome</th><th>Tipo</th></tr>

<?php
$res = $conn->query("SELECT * FROM Prodotto");
while($row = $res->fetch_assoc()){
    echo "<tr>
        <td>{$row['nome']}</td>
        <td>{$row['tipo']}</td>
    </tr>";
}
?>
</table>