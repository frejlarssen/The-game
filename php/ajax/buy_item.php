<?php
    $user = $_COOKIE['user_id'];
    $item_id = $_POST['item_id'];

    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql_items = "SELECT * FROM tbl_items WHERE item_id = $item_id";
    $sql_users = "SELECT * FROM tbl_users WHERE user_id = $user";

    if ($result_items = $conn->query($sql_items)) {
        $row_item = $result_items->fetch_assoc();
    }
    else {
        echo $conn->error;
    }

    if ($result_users = $conn->query($sql_users)) {
        $row_user = $result_users->fetch_assoc();
    }
    else {
        echo $conn->error;
    }

    $cost = $row_item['cost'];
    $gold = $row_user['gold'];

    if ($gold >= $cost) {
        $gold -= $cost;
        $sql_update_users_items = "UPDATE tbl_users_items SET status = 'bought' WHERE user_id = $user && item_id = $item_id";
        $sql_update_users = "UPDATE tbl_users SET gold = $gold WHERE user_id = $user";
        echo 'can buy';
        if ($conn->query($sql_update_users_items)) {
            if ($conn->query($sql_update_users)) {
            }
            else {
                echo 'failed to update users: ' . $conn->error;
            }
        }
        else {
            echo 'failed to update users_items: ' . $conn->error;
        }
    }
    else {
        echo 'can not buy';
    }
?>