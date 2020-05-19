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
            <div id="algorithm-not-supported"></div>
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

    $algorithms = array( //Sorterat efter vad som helst ska användas, algoritmen högst upp kommer att väljas om det går
        'CRYPT_SHA512' => CRYPT_SHA512,
        'CRYPT_SHA256' => CRYPT_SHA256,
        'CRYPT_BLOWFISH' => CRYPT_BLOWFISH,
        'CRYPT_MD5' => CRYPT_MD5,
        'CRYPT_EXT_DES' => CRYPT_EXT_DES,
        'CRYPT_STD_DES' => CRYPT_STD_DES
    );

    $salts = array(
        'CRYPT_SHA512' => '$6$rounds=5000$anexamplestringforsalt$',
        'CRYPT_SHA256' => '$5$rounds=5000$anexamplestringforsalt$',
        'CRYPT_BLOWFISH' => '$2a$09$anexamplestringforsalt$',
        'CRYPT_MD5' => '$1$somethin$',
        'CRYPT_EXT_DES' => '_S4..some',
        'CRYPT_STD_DES' => 'tw'
    );

    function generate_hash_login($algorithm, $password) {
        global $algorithms, $salts;

        if ($algorithm != 'none') {
            if ($algorithms[$algorithm] == 1) {
                $hash = crypt($password, $salts[$algorithm]);
            }
            else {
                $hash = null; //returnerar null om algoritmen inte stöds
            }
        }
        else if ($algorithm == 'none') {
            $hash = $password;
        }

        return $hash;
    }

    function generate_hash_registration($password) {
        global $algorithms, $salts;

        $hash = array(
            'algorithm' => '',
            'password' => '');
        
        $supported_algorithm_found = false;

        foreach ($algorithms as $name => $algorithm) {

            if ($algorithm == 1 && $supported_algorithm_found == false) { //Kollar om algoritmen stöds och om den tidigare hittat en algoritm som stöds
                $supported_algorithm_found = true;
                $hash['algorithm'] = $name;
                $hash['password'] = crypt($password, $salts[$name]);
            }
        }
        if ($supported_algorithm_found == false) {
            $hash['algorithm'] = 'none';
            $hash['password'] = $password;
        }

        return $hash;
    }

    function register_user($username, $password, $conn) {
        $hash = generate_hash_registration($password);

        $encrypted_password = $hash['password'];
        $algorithm = $hash['algorithm'];

        $sql_insert = "INSERT INTO tbl_users (username, password, hash_algorithm, position_id) VALUES ('$username', '$encrypted_password', '$algorithm', 85)";

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

        $sql_items = "SELECT * FROM tbl_items";
        $result_items = $conn->query($sql_items);

        while ($row_items = $result_items->fetch_assoc()) {
            $item_id = $row_items['item_id'];

            $sql_users_items = "INSERT INTO tbl_users_items (user_id, item_id, status) VALUES ($user_id, $item_id, 'not bought')";

            if ($conn->query($sql_users_items)) {
                echo "tbl_users_items inserted successfully";
            }
            else {
                echo "Problem inserting tbl_users_items: " . $conn->error . "<br>";
            }
        }
        return $user_id;
    }

    function show_wrong_pass() {
        echo "  <script>
                    document.getElementById('wrong-password').style.visibility = 'visible';
                </script>
            ";
    }

    if (array_key_exists("user_id", $_COOKIE)) {
        $url = 'http://' . $_SERVER['SERVER_NAME'] . substr_replace($_SERVER['PHP_SELF'], 'php/main.php', strpos($_SERVER['PHP_SELF'], 'index.php'));
        header("LOCATION: $url");
    }
    echo "  <script>
                document.getElementById('wrong-password').style.visibility = 'hidden';
                document.getElementById('algorithm-not-supported').style.visibility = 'hidden';
            </script>
        ";//TODO: Använd innerHTML istället för visible pga design
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

            if ($row_user == null) {
                show_wrong_pass();
            }
            else {
                $hash = generate_hash_login($row_user['hash_algorithm'], $password);

                if ($hash == null) {
                    echo "  <script>
                                document.getElementById('algorithm-not-supported').innerHTML = 'Tyvärr stöder inte ditt operativsystem den krypteringsalgoritm som användes när du skapade ditt konto. Vilken osis! Vänligen logga in från datorn du använde när du skapade kontot eller skapa ett nytt konto nedan:';
                            </script>
                        ";
                }
                if ($hash !== $row_user["password"]) {
                    show_wrong_pass();
                }
                else {
                    $user_id = $row_user['user_id'];
                    $url = 'http://' . $_SERVER['SERVER_NAME'] . substr_replace($_SERVER['PHP_SELF'], 'php/main.php', strpos($_SERVER['PHP_SELF'], 'index.php'));

                    echo "  <script>
                                document.cookie = 'user_id=$user_id';
                                window.location.replace('$url');
                            </script>
                        ";
                }
            }
        }
        else if ($_POST["type"] === "Registrera") {
            if ($username != "" && $password != "") {

                $sql_search = "SELECT * from tbl_users where username = '$username'";

                $result_search = $conn->query($sql_search);
                $row_search = $result_search -> fetch_assoc();

                if ($row_search === null) { //Kollar om det finns någon med det användarnamnet

                    $user_id = register_user($username, $password, $conn);

                    $url = 'http://' . $_SERVER['SERVER_NAME'] . substr_replace($_SERVER['PHP_SELF'], 'php/main.php', strpos($_SERVER['PHP_SELF'], 'index.php'));

                    echo "<script>
                    document.cookie = 'user_id=$user_id';
                    window.location.replace('$url');
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