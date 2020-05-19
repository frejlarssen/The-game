<?php
    error_reporting(E_ERROR | E_PARSE); //En varning som returneras härifrån ger problem när man ska omvandla responsen till ett objekt i JavaScript, därför har jag här stängt av varningar.

    $user = $_COOKIE['user_id'];
    $item_id = $_POST['item_id'];
    $reward = $_POST['reward'];
    $reward_type = $_POST['reward_type'];

    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql_update_item = "UPDATE tbl_users_items SET status = 'used' WHERE user_id = $user && item_id = $item_id";

    if ($conn->query($sql_update_item)) {
        switch ($reward_type) {
            case 'gold':
                $sql_update_user = "UPDATE tbl_users SET gold = (gold + $reward) WHERE user_id = $user";
                if ($conn->query($sql_update_user)) {
                    $response->status = 'Money earned';
                    $response->earned = $reward;
                }
                else {
                }
                break;
            case 'item':
                break;
            case 'line':
                break;
            default:
                $response->status = 'None type';
        }
    }
    else {
        $response->status = 'failed to update users_items: ' . $conn->error;
    }
    $json_response = json_encode($response);
    echo $json_response;
?>