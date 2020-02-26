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

    $x_coordinate = $row_user['x_coordinate'];
    $y_coordinate = $row_user['y_coordinate'];

    $sql_map = "SELECT * FROM tbl_map WHERE y_coordinate = '$y_coordinate'";
    $result_map = $conn->query($sql_map);
    $row_map = $result_map->fetch_assoc();

    $surrounding_id = $row_map[$x_coordinate];

    $sql_surrounding = "SELECT * FROM tbl_surroundings WHERE surrounding_id = '$surrounding_id'";
    $result_surrounding = $conn->query($sql_surrounding);
    $row_surrounding = $result_surrounding->fetch_assoc();

    $sql_character = "SELECT * FROM tbl_characters WHERE x_coordinate = '$x_coordinate' and y_coordinate = '$y_coordinate'";
    $result_character = $conn->query($sql_character);
    $row_character = $result_character->fetch_assoc();

    $main_img_type = $row_surrounding['img_type'];

    $character_id = $row_character['character_id'];
    $character_img_type = $row_character['img_type'];
    
    $sql_visited = "SELECT * FROM tbl_users_places WHERE x_coordinate = '$x_coordinate' and y_coordinate = '$y_coordinate'";
    $result_visited = $conn->query($sql_visited);
    $row_visited = $result_visited->fetch_assoc();

    $visited = $row_visited['visited'];
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
            <img id="character-img" src="../images/characters/<?php echo $character_id . '.' . $character_img_type?>" onclick="viewLine(1)">
            <div id="chat-box">
                Hölasjgöfkljsdöf klgjsöfklgjölsdfjgkl
            </div>
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
        echo "<script>
            document.getElementById('chat-box').style.visibility = 'visible';
            </script>";
        
        $row_line = $row_character['line_1'];

        echo "<script>
            document.getElementById('chat-box').innerHTML = '$row_line';
            </script>";
    }
?>