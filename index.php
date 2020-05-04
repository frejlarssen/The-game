<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>The Game</title>
    <link type="text/css" rel="stylesheet" href="styles/style.css">
    <link type="text/css" rel="stylesheet" href="styles/login.css">
</head>
<body>
    <div id="container">
        <h1>The Game</h1>
        <div class="form">
            <h2>Logga in</h2>
            <form action="index.php" method="post">
                <h3>Användarnamn</h3>
                <input name="username">
                <h3>Lösenord</h3>
                <input name="password" type="password"><br>
                <input class="button" name="type" type="submit" value="Logga in">
            </form>
            <div id="wrong-password">Fel användarnamn eller lösenord</div>
        </div>
        <div class="form">
            <h2>Ny spelare</h2>
            <form action="index.php" method="post">
                <h3>Användarnamn</h3>
                <input name="username">
                <h3>Lösenord</h3>
                <input name="password" type="password"><br>
                <input class="button" name="type" type="submit" value="Registrera">
            </form>
            <div id="reg-message"></div>
        </div>
    </div>

</body>
</html>

<?php
    function register($username, $password, $conn) {
        $sql_insert = "INSERT INTO tbl_users (username, password, position_id) VALUES ('$username', '$password', 85)";

        if ($conn->query($sql_insert)) {
            echo "Database updated successfully<br>";
        }
        else {
            echo "Problem updating database: " . $conn->error . "<br>";
        }

        $sql_user = "SELECT * FROM tbl_users WHERE username = '$username'";

        $result_user = $conn->query($sql_user);

        $row_user = $result_user->fetch_assoc();

        $user_id = $row_user['user_id'];

        for ($position_id = 1; $position_id <= 169; $position_id++) {
            $sql_users_positions = "INSERT INTO tbl_users_positions (user_id, position_id) VALUES ($user_id, $position_id)";

            if ($conn->query($sql_users_positions)) {
                echo "tbl_users_positions inserted successfully";
            }
            else {
                echo "Problem inserting tbl_users_positions: " . $conn->error . "<br>";
            }
        }
        return $user_id;
    }

    if (array_key_exists("user_id", $_COOKIE)) {
        header("LOCATION: http://localhost/the-game/php/main.php");
    }
    echo "<script>
    document.getElementById('wrong-password').style.visibility = 'hidden';
    </script>";
    if (array_key_exists("type", $_POST)) {
        $username = $_POST["username"];
        $password = $_POST["password"];

        $servername = 'localhost';
        $dbusername = 'the_game_user';
        $dbpassword = 'the_game_password';
        $dbname = 'the_game';

        $conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

        if ($_POST["type"] === "Logga in") {
            $sql_user = "SELECT * FROM tbl_users WHERE username = '$username'";

            $result_user = $conn->query($sql_user);

            $row_user = $result_user->fetch_assoc();

            if ($row_user == null || $password !== $row_user["password"]) {
                echo "<script>
                document.getElementById('wrong-password').style.visibility = 'visible';
                </script>";
            }
            else {
                $user_id = $row_user['user_id'];
                echo "<script>
                    document.cookie = 'user_id=$user_id';
                    window.location.replace('http://localhost/the-game/php/main.php');
                    </script>";
            }
        }
        else if ($_POST["type"] === "Registrera") {
            if ($username != "" && $password != "") {

                $sql_search = "SELECT * from tbl_users where username = '$username'";

                $result_search = $conn->query($sql_search);
                $row_search = $result_search -> fetch_assoc();

                if ($row_search === null) {

                    $user_id = register($username, $password, $conn);

                    echo "<script>
                    document.cookie = 'user_id=$user_id';
                    window.location.replace('http://localhost/the-game/php/main.php');
                    </script>";
                }
                else {
                    echo "<script>
                    document.getElementById('reg-message').innerHTML = 'Användarnamnet är upptaget'
                    </script>";
                }
            }
            else {
                echo "<script>
                document.getElementById('reg-message').innerHTML = 'Du måste ange användarnamn och lösenord'
                </script>";
            }
        }
    }
?>