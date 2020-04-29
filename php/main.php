<?php
    $user = $_COOKIE['user_id'];

    $servername = 'localhost';
    $username = 'the_game_user';
    $password = 'the_game_password';
    $dbname = 'the_game';

    $conn = new mysqli($servername, $username, $password, $dbname);

    $sql_user = "SELECT * 
                    FROM (((tbl_users
                        LEFT JOIN tbl_positions
                            ON tbl_users.position_id = tbl_positions.position_id)
                        LEFT JOIN tbl_surroundings
                            ON tbl_positions.surrounding_id = tbl_surroundings.surrounding_id)
                        LEFT JOIN tbl_users_positions
                            ON tbl_users.position_id = tbl_users_positions.position_id && tbl_users.user_id = tbl_users_positions.user_id)
                    WHERE tbl_users.`user_id` = $user
                ;";

    if ($result_user = $conn->query($sql_user)) {
        $row_user = $result_user->fetch_assoc();
    }
    else {
        echo $conn->error;
    }

    $position_id = $row_user['position_id'];
    $surrounding_id = $row_user['surrounding_id'];

    $sql_character = "SELECT * FROM tbl_characters WHERE position_id = $position_id";
    $result_character = $conn->query($sql_character);
    $row_character = $result_character->fetch_assoc();

    $header = $row_user['name'];
    $description = $row_user['description'];
    $main_img_type = $row_user['img_type'];

    $choice1 = $row_user['choice_1'];
    $choice2 = $row_user['choice_2'];

    if ($row_character != null) {
        $character_id = $row_character['character_id'];
        $character_img_type = $row_character['img_type'];
        $lines = array($row_character['line_0'], $row_character['line_1'], $row_character['line_2']);
    }

    $visited = $row_user['visited'];
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
        <p class="rub"><?php echo $header?></p>
        <div id="image-container">
            <img id="character-img" src="../images/characters/<?php echo $character_id . '.' . $character_img_type?>">
            <div id="chat-box"></div>
        </div>
        <div id="button-container">
            <div id="choice1" class="button choice" onclick="buttonClicked(1)">
                <?php echo $choice1?>
            </div>
            <div id="choice2" class="button choice" onclick="buttonClicked(2)">
                <?php echo $choice2?>
            </div>
        </div>
        <p class="description"><?php echo $description?></p>
    </div>
    <div id="logout" class="button" onclick="logout()">
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
    <script>
        function buttonClicked(choice) {
            showLine(choice);
            setVisited(<?php echo $position_id ?>);
        }

        function showLine(line) {
            viewChatBox();
            switch (line) {
                case 0:
                    document.getElementById("chat-box").innerHTML = "<?php echo $lines[0]?>";
                    break;
                case 1:
                    document.getElementById("chat-box").innerHTML = "<?php echo $lines[1]?>";
                    break;
                case 2:
                    document.getElementById("chat-box").innerHTML = "<?php echo $lines[2]?>";
                    break;
            }
        }
    </script>
</body>
</html>

<?php
    echo "<script>viewMainImage($surrounding_id, '$main_img_type');</script>";

    if ($visited == 0) {
        echo "<script>
            document.getElementById('chat-box').style.visibility = 'visible';
            showLine(0);
            </script>";
    }
?>