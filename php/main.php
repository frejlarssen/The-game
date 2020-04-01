<?php
    $user = $_COOKIE['user_id'];

    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql_user = "SELECT * 
                    FROM (((tbl_users
                        LEFT JOIN tbl_map
                            ON tbl_users.y_coordinate = tbl_map.y_coordinate)
                        LEFT JOIN tbl_characters
                            ON tbl_users.x_coordinate = tbl_characters.x_coordinate && tbl_users.y_coordinate = tbl_characters.y_coordinate)
                        LEFT JOIN tbl_users_places
                            ON tbl_users.x_coordinate = tbl_users_places.x_coordinate && tbl_users.y_coordinate = tbl_users_places.y_coordinate)
                    WHERE tbl_users.`user_id` = $user
                ;";

    $result_user = $conn->query($sql_user);
    $row_user = $result_user->fetch_assoc();

    $x_coordinate = $row_user['x_coordinate'];

    $surrounding_id = $row_user[$x_coordinate];

    $sql_surrounding = "SELECT * FROM tbl_surroundings WHERE surrounding_id = '$surrounding_id'";
    $result_surrounding = $conn->query($sql_surrounding);
    $row_surrounding = $result_surrounding->fetch_assoc();

    $main_img_type = $row_surrounding['img_type'];

    $character_id = $row_user['character_id'];
    $character_img_type = $row_user['img_type'];
    $visited = $row_user['visited'];
?>

<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>The Game</title>
    <link type="text/css" rel="stylesheet" href="../styles/style.css">
    <link type="text/css" rel="stylesheet" href="../styles/surroundings.css">
</head>
<body>
    <div id="container">
        <p class="rub"><?php echo $row_surrounding['name']?></p>
        <div id="image-container">
            <img id="character-img" src="../images/characters/<?php echo $character_id . '.' . $character_img_type?>">
            <div id="chat-box"></div>
        </div>
        <p class="description"><?php echo $row_surrounding['description']?></p>
    </div>
    <div id="logout" onclick="logout()">
        Logga ut
    </div>
    <div id="navigation">
        <div class="row">
            <div id="north" class="direction" onclick="move('north')"></div>
        </div>
        <div class="row">
            <div id="west" class="direction" onclick="move('west')"></div>
            <div id="middle" class="direction"></div>
            <div id="east" class="direction" onclick="move('east')"></div>
        </div>
        <div class="row">
            <div id="south" class="direction" onclick="move('south')"></div>
        </div>
    </div>
    <script src="../scripts/script.js"></script>
</body>
</html>

<?php
    echo "<script>viewMainImage($surrounding_id, '$main_img_type');</script>";
    
    if ($visited == 0) {
        $row_line = $row_user['line_1'];

        echo "<script>
            document.getElementById('chat-box').style.visibility = 'visible';
            document.getElementById('chat-box').innerHTML = '$row_line';
            </script>";
    }
?>