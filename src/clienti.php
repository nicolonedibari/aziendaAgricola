<?php include "db.php"; ?>

<form method="POST">
Nome: <input name="nome"><br>
Nickname: <input name="nick"><br>
Telefono: <input name="telefono"><br>
Email: <input name="email"><br>
<button name="add">Inserisci</button>
</form>

<?php
if(isset($_POST['add'])){
$conn->query("INSERT INTO Cliente(nome,nickname,telefono,email)
VALUES('{$_POST['nome']}','{$_POST['nick']}','{$_POST['telefono']}','{$_POST['email']}')");
}

$res=$conn->query("SELECT * FROM Cliente");
while($r=$res->fetch_assoc()){
echo $r['nome']."<br>";
}
?>
