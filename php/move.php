<?php
    $direction = $_GET['direction'];

    $user = $_COOKIE['user_id'];

    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    

    switch($direction){
        case 'north':
            $sql_update = "UPDATE tbl_users SET y_coordinate = y_coordinate - 1 WHERE user_id = $user";
        break;
        case 'west':
            $sql_update = "UPDATE tbl_users SET x_coordinate = x_coordinate - 1 WHERE user_id = $user";
        break;
        case 'east':
            $sql_update = "UPDATE tbl_users SET x_coordinate = x_coordinate + 1 WHERE user_id = $user";
        break;
        case 'south':
            $sql_update = "UPDATE tbl_users SET y_coordinate = y_coordinate + 1 WHERE user_id = $user";
        break;
    }

    if ($conn->query($sql_update) === TRUE) {
        echo 'Posts changed successfully' . "<br>";
    } else {
        echo 'Error changing posts: ' . $conn->error . "<br>";
    }
    
    header("LOCATION: http://localhost/the-game/php/main.php");
?>