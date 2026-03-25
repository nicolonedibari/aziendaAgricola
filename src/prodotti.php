<?php include "db.php"; ?>

<form method="POST">
Nome: <input name="nome"><br>
Tipo: <input name="tipo"><br>
Unità: <input name="unita"><br>
Giacenza: <input name="giacenza"><br>
Categoria: <input name="categoria"><br>
<button name="add">Inserisci</button>
</form>

<?php
if(isset($_POST['add'])){
$conn->query("INSERT INTO Prodotto(nome,tipo,unitaMisura,giacenza,idCategoria)
VALUES('{$_POST['nome']}','{$_POST['tipo']}','{$_POST['unita']}',{$_POST['giacenza']},{$_POST['categoria']})");
}

$res=$conn->query("SELECT * FROM Prodotto");
while($r=$res->fetch_assoc()){
echo $r['nome']." ".$r['giacenza']."<br>";
}
?>
