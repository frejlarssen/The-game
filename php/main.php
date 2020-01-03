<?php
    $user = $_COOKIE['user_id'];

    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql_user = "SELECT * FROM tbl_users WHERE user_id = '$user'";
    $result_user = $conn->query($sql_user);
    $row_user = $result_user->fetch_assoc();

    $x_coordinate = $row_user['x-coordinate'];
    $y_coordinate = $row_user['y-coordinate'];

    $sql_map = "SELECT * FROM tbl_map WHERE yCoordinate = '$y_coordinate'";
    $result_map = $conn->query($sql_map);
    $row_map = $result_map->fetch_assoc();

    $place = $row_map[$x_coordinate];

    $sql_place = "SELECT * FROM tbl_places WHERE place_id = '$place'";
    $result_place = $conn->query($sql_place);
    $row_place = $result_place->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>The Game</title>
    <link type="text/css" rel="stylesheet" href="../styles/style.css">
    <link type="text/css" rel="stylesheet" href="../styles/places.css">
</head>
<body>
    <div id="container">
        <p class="rub"><?php echo $row_place['name']?></p>
        <img class="main-img" src="../images/places/<?php echo $row_place['place_id'] . '.' . $row_place['img_type'];?>">
        <p class="description"><?php echo $row_place['description']?></p>
    </div>
    <div id="logout" onclick="logout()">
        Logga ut
    </div>
    <div id="navigation">
        <div class="row">
            <div id="north" class="direction"></div>
        </div>
        <div class="row">
            <div id="west" class="direction"></div>
            <div id="middle" class="direction"></div>
            <div id="east" class="direction"></div>
        </div>
        <div class="row">
            <div id="south" class="direction"></div>
        </div>
    </div>
    <script src="../scripts/script.js"></script>
</body>
</html>