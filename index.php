<?php
    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql_select = "SELECT * FROM tbl_places WHERE place_id = 1";

    $result_select = $conn->query($sql_select);

    $row_select = $result_select->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>The Game</title>
    <link type="text/css" rel="stylesheet" href="styles/style.css">
</head>
<body>
    <div id="container">
        <p class="rub">Gläntan</p>
        <img class="main-img" src="images/1.<?php echo $row_select["img_type"]; ?>">
        <p class="description">Du vaknar upp i en glänta i skogen och vet inte var du är eller vem du är. Det är nog bäst att börja se sig om.</p>
    </div>
</body>
</html>