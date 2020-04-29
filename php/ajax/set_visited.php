<?php
    $user = $_COOKIE['user_id'];
    $position_id = $_POST['position_id'];
    
    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql_update = "UPDATE tbl_users_positions SET visited = 1 WHERE user_id = $user && position_id = $position_id";

    if ($result_update = $conn->query($sql_update)) {
        echo 'Updated';
    }
    else {
        echo $conn->error;
    }
?>