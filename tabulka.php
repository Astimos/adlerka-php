<?php
    session_start();
?>
<meta name="viewport" content="width=device-width, initial-scale=1.0"><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="styles.css">
</head>
<?php

if(empty(($_SESSION["jazyk"]))){
    $_SESSION["jazyk"]="sk";

}


if(!empty($_GET["jazyk"])){
    $_SESSION["jazyk"]=$_GET["jazyk"];
}

var_dump($_SESSION["jazyk"]);


?>

<a href = tabulka.php?jazyk=sk>Slovenský</a>
<a href = tabulka.php?jazyk=en>Anglický</a>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "rozvrh";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
if(!empty($_GET["trieda"])){
    $where = " WHERE rozvrh.trieda = '".$_GET["trieda"]."'";
}
else {
    $where = "";
}
$sql = "SELECT *From rozvrh".$where;
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $rozvrh[$row["den"]][$row["hodiny"]] = $row["predmet"];
    }
} else {
    echo "0 results";
}

//mysqli_close($conn);
?>

<table border=1 class="table">
    <tr>
        <td data-label></td>
        <td data-label>0</td>
        <td data-labeld>1</td>
        <td data-label>2</td>
        <td data-label>3</td>
        <td data-label>4</td>
        <td data-label>5</td>
    <tr/>
    <tr>
        <td data-label>Pondelok</td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
    <tr/>
    <tr>
        <td data-label>Utorokd</td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
    <tr/>
    <tr>
        <td data-label>Streda</td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
    <tr/>
    <tr>
        <td data-label>Štvrtok</td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
    <tr/>
    <tr>
        <td data-label>Piatok</td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
        <td data-label></td>
    </tr>
    <tr/>
    <table/>
    <br>
    <?php
    $dni = array('Pondelok', 'Utorok', 'Streda', 'Štvrtok', 'Piatok');
    $rozvrh[4][7] = "Nič";
    $hodiny = array(0, 1, 2, 3, 4, 5, 6, 7);
    ?>

    <table border="1" class="table">
        <tr class="none">
            <td class="none">DEN</td>
            <?php foreach ($hodiny as $i => $hodina): ?>
                <td><?php echo $hodina; ?></td>
            <?php endforeach; ?>
        </tr>
        <?php foreach ($dni as $i =>$den): ?>
            <tr>
                <td><?php echo $den; ?></td>
                <?php foreach ($hodiny as $j=> $hodina): ?>
                    <td> <?php
                        echo@$rozvrh[$i][$j]; ?></td>
                <?php endforeach; ?>
            </tr>
        <?php endforeach; ?>
    </table>

<?php
    $sql = "SELECT trieda from rozvrh GROUP by trieda ORDER by trieda";
    $result = mysqli_query($conn, $sql);
    while($row = mysqli_fetch_assoc($result))
    {
    echo "<a href = tabulka.php?trieda=".$row["trieda"].">".$row["trieda"]."</a>
        <br/>";
    }
?>