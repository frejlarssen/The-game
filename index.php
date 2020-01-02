<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>The Game</title>
    <link type="text/css" rel="stylesheet" href="styles/style.css">
    <link type="text/css" rel="stylesheet" href="styles/login.css">
    <script></script>
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
                <input name="password"><br>
                <input class="button" type="submit" value="Logga in">
            </form>
            <div id="wrong-password">Fel lösenord</div>
        </div>
        <div class="form">
            <h2>Ny spelare</h2>
            <form>
                <h3>Användarnamn</h3>
                <input name="username">
                <h3>Lösenord</h3>
                <input name="password"><br>
                <input class="button" type="submit" value="Registrera">
            </form>
        </div>
    </div>
    
</body>
</html>

<?php
    echo "<script>
    document.getElementById('wrong-password').style.visibility = 'hidden';
    </script>";
    if(array_key_exists("user_id", $_COOKIE)){
        header("LOCATION: http://localhost/the-game/php/main.php");
    }
    if(array_key_exists('username', $_POST)){
        $username = $_POST["username"];
        $password = $_POST["password"];

        $servername = 'localhost';
        $dbusername = 'the_game_user';
        $dbpassword = 'the_game_password';
        $dbname = 'the_game';

        $conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

        $sql_user = "SELECT * FROM tbl_users WHERE username = '$username'";

        $result_user = $conn->query($sql_user);

        $row_user = $result_user->fetch_assoc();

        if($password === $row_user["password"]){
            setcookie("user_id", $row_user["user_id"]);
            header("LOCATION: http://localhost/the-game/php/main.php");
        }
        else{
            echo "<script>
            document.getElementById('wrong-password').style.visibility = 'visible';
            </script>";
        }
    }
?>