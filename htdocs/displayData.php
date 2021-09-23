<?php
$host = "localhost";
$user = "root";
$pass = "";

$dbname = "test_technique";
$mysqli = new mysqli($host, $user, $pass, $dbname);

$listCompanyQuery = "SELECT id, nom FROM company";
$resultCompany = $mysqli->query($listCompanyQuery);

if ($resultCompany->num_rows > 0) {
    while($row = $resultCompany->fetch_assoc()) {
        // display avoir table
        echo "<div style='display: flex; justify-content: space-around;'>
    <div>
        <h3>Tableau des avoirs</h3>
        <table>
        <tr>
        <td><b>" . $row["nom"] . "</b></td>
        <td><b>Somme</b></td>
        </tr>";
        $listDeclarationQuery = "SELECT declaration_id, somme FROM avoir WHERE declaration_id = " . $row["id"];
        $resultDeclarartion1 = $mysqli->query($listDeclarationQuery);
        if ($resultDeclarartion1->num_rows > 0) {
            while($rowAvoir = $resultDeclarartion1->fetch_assoc()) {
                echo "<tr>
                    <td>Citeo</td>
                    <td>" . $rowAvoir["somme"] . " €</td>
                </tr>";
            }
        }
        echo "</table>
    </div>

    <div>
        <h3>Tableau des régularisations</h3>
        <table>
        <tr>
        <td><b>" . $row["nom"] . "</b></td>
        <td><b>Somme</b></td>
        </tr>";
        $listDeclarationQuery = "SELECT declaration_id, total FROM regularisation WHERE declaration_id = " . $row["id"];
        $resultDeclarartion = $mysqli->query($listDeclarationQuery);
        if ($resultDeclarartion->num_rows > 0) {
            while($rowReg = $resultDeclarartion->fetch_assoc()) {
        echo "<tr>
            <td>Adelphe</td>
            <td>" . $rowReg["total"] . " €</td>
        </tr>";
            }
        }
        echo "</table>
    </div>
</div>";
    }
}
