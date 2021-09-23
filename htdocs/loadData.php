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
        $listDeclarationQuery = "SELECT id, total, corrective, isValid FROM declaration WHERE company_id = " . $row["id"];
        $resultDeclarartion = $mysqli->query($listDeclarationQuery);
        if ($resultDeclarartion->num_rows > 0) {
            while($row = $resultDeclarartion->fetch_assoc()) {
                $sub = $row["total"] - $row["corrective"];
                if ($sub > 0) {
                    // die("avoir");
                    // insert avoir table
                    $sql = "INSERT INTO avoir (declaration_id, somme) VALUES (" . $row["id"] . "," . $sub . ")";
                    if(!$mysqli->query($sql)) {
                        var_dump($mysqli->error);
                    }
                } else if ($sub < 0) {
                    // insert regulation table
                    $sql = "INSERT INTO regularisation (declaration_id, total) VALUES (" . $row["id"] . "," . $sub . ")";
                    if(!$mysqli->query($sql)) {
                        var_dump($mysqli->error);
                    }
                }
            }
        }
    }
}

?>
