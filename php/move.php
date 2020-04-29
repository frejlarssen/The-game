<?php
    $direction = $_GET['direction'];

    $user = $_COOKIE['user_id'];

    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql_user = "SELECT * FROM ( tbl_users 
                    LEFT JOIN tbl_positions
                        ON tbl_users.position_id = tbl_positions.position_id)
                    WHERE user_id = $user
                ;";

    $result_user = $conn->query($sql_user);
    $row_user = $result_user->fetch_assoc();

    $x_coordinate = $row_user['x_coordinate'];
    $y_coordinate = $row_user['y_coordinate'];

    switch($direction) {
        case 'north':
            $y_coordinate ++;
        break;
        case 'west':
            $x_coordinate --;
        break;
        case 'east':
            $x_coordinate ++;
        break;
        case 'south':
            $y_coordinate --;
        break;
    }

    $sql_position = "SELECT * FROM tbl_positions WHERE x_coordinate = $x_coordinate && y_coordinate = $y_coordinate";
    $result_positon = $conn->query($sql_position);
    $row_position = $result_positon->fetch_assoc();

    $position_id = $row_position['position_id'];

    $sql_update = "UPDATE tbl_users SET position_id = $position_id WHERE user_id = $user";

    if ($conn->query($sql_update) === TRUE) {
        echo 'Posts changed successfully' . "<br>";
    } else {
        echo 'Error changing posts: ' . $conn->error . "<br>";
    }

    header("LOCATION: http://localhost/the-game/php/main.php");
?>