<?php
    $user = $_COOKIE['user_id'];

    $servername = 'localhost';
    $dbusername = 'the_game_user';
    $dbpassword = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

    $sql_users_items = "DELETE FROM tbl_users_items WHERE user_id = $user";

    if ($conn->query($sql_users_items)) {
        echo 'Users items deleted successfully' . "<br>";
    } else {
        echo 'Error deleting users items: ' . $conn->error . "<br>";
    }

    $sql_users_positions = "DELETE FROM tbl_users_positions WHERE user_id = $user";

    if ($conn->query($sql_users_positions)) {
        echo 'Users positions deleted successfully' . "<br>";
    } else {
        echo 'Error deleting users positions: ' . $conn->error . "<br>";
    }

    $sql_users = "DELETE FROM tbl_users WHERE user_id = $user";

    if ($conn->query($sql_users)) {
        echo 'User deleted successfully' . "<br>";
    } else {
        echo 'Error deleting user: ' . $conn->error . "<br>";
    }
?>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <script src="../scripts/script.js"></script>
    <script>logout()</script>
</body>
</html>