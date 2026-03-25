<?php include "db.php"; ?>

<form method="POST">
Cliente: <input name="cliente"><br>
Prodotto: <input name="prodotto"><br>
Quantità: <input name="quantita"><br>
<button name="vendi">Vendi</button>
</form>

<?php
if(isset($_POST['vendi'])){
$idP=$_POST['prodotto'];
$q=$_POST['quantita'];
$idC=$_POST['cliente'];

$r=$conn->query("SELECT prezzoUnitario FROM Prezzo WHERE idProdotto=$idP ORDER BY dataInizioValidita DESC LIMIT 1");
$p=$r->fetch_assoc()['prezzoUnitario'];

$tot=$p*$q;

$conn->query("INSERT INTO Acquisto(idCliente,dataAcquisto,totaleCalcolato,totalePagato)
VALUES($idC,NOW(),$tot,$tot)");

$idA=$conn->insert_id;

$conn->query("INSERT INTO Dettaglio_Acquisto(idAcquisto,idProdotto,quantita,prezzoApplicato)
VALUES($idA,$idP,$q,$p)");

$conn->query("UPDATE Prodotto SET giacenza=giacenza-$q WHERE idProdotto=$idP");

echo "OK";
}
?>
