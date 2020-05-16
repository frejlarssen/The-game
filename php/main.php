<?php
    function showItemShop($result_items, $item_num) {
        if ($row_item = $result_items->fetch_assoc()) {
            echo '<div id="item-' . $item_num . '" class="item" onclick="buyItem(' . $row_item['item_id'] . ', ' . $item_num . ')">';        
                echo $row_item['item_name'];
                echo '<img class="item-img" src="../images/items/' . $row_item['item_id'] . '.' . $row_item['img_type'] . '">';
                echo '<br>' . $row_item['cost'] . ' riksdaler.';
            echo '</div>';
        }
    }

    function showItemInventory($result_items, $item_num) {
        if ($row_item = $result_items->fetch_assoc()) {
            echo '<div id="item-' . $item_num . '" class="item" onclick="useItem(' . $row_item['item_id'] . ', ' . $item_num . ')">';        
                echo $row_item['item_name'];
                echo '<img class="item-img" src="../images/items/' . $row_item['item_id'] . '.' . $row_item['img_type'] . '">';
            echo '</div>';
        }
    }

    $user = $_COOKIE['user_id'];

    if (array_key_exists('special', $_GET)) {
        $special = $_GET['special'];
    }
    else {
        $special = null;
    }

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

    $sql_items_inventory = "SELECT *
                        FROM (tbl_users_items
                            LEFT JOIN tbl_items
                                ON tbl_users_items.item_id = tbl_items.item_id)
                        WHERE user_id = $user && status = 'bought'
                    ;";
    
    if ($result_items_inventory = $conn->query($sql_items_inventory)) {

    }
    else {
        echo $conn->error;
    }

    if ($special == null) {
        $header = $row_user['name'];
        $description = $row_user['description'];
        $main_img_type = $row_user['img_type'];

        $choice1 = $row_user['choice_1'];
        $choice2 = $row_user['choice_2'];
    }
    else if ($special == 'shop') {
        $header = 'Shoppinghålan';
        $description = 'Här verkar det som man kan shoppa loss!';
        $main_img_type = null;

        $choice1 = 'Utträd ur stugan';
        $choice2 = null;

        $sql_items_shop = "SELECT *
                        FROM (tbl_users_items
                            LEFT JOIN tbl_items
                                ON tbl_users_items.item_id = tbl_items.item_id)
                        WHERE user_id = $user && status = 'not bought'
                    ;";

        if ($result_items_shop = $conn->query($sql_items_shop)) {

        }
        else {
            echo $conn->error;
        }
    }

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
    <?php
        if ($special == 'shop') {
            echo '
    <link type="text/css" rel="stylesheet" href="../styles/shop.css">
            ';
        }
    ?>
</head>
<body>
    <div id="container">
        <div id="inventory">
            <h2 id="inventory-header">Inventarium</h2>
            <?php
                for($item = 0; $item < $result_items_inventory->num_rows; $item++) {
                    showItemInventory($result_items_inventory, $item);
                }
            ?>
        </div>
        <div id="surrounding-container">
            <p class="rub"><?php echo $header?></p>
            <div id="image-container">
            <?php
                if (isset($character_id)) {
                    echo "<img id='character-img' src='../images/characters/$character_id.$character_img_type'>";
                }
                if ($special == 'shop' && $result_items_shop->num_rows > 0) {
                    echo '<div id="shelf-1" class="shelf">';
                        for($item = 0; $item < 5; $item++) {
                            showItemShop($result_items_shop, $item);
                        }
                    echo '</div>';
                    echo '<div id="shelf-2" class="shelf">';
                        for($item = 5; $item < 10; $item++) {
                            showItemShop($result_items_shop, $item);
                        }
                    echo '</div>';
                    echo '<div id="shelf-3" class="shelf">';
                        for($item = 10; $item < 15; $item++) {
                            showItemShop($result_items_shop, $item);
                        }
                    echo '</div>';
                }
            ?>
                <div id="chat-box" style="visibility: hidden"></div>
            </div>
            <p class="description"><?php echo $description?></p>
            <div id="button-container">
                <div id="choice1" class="button choice" onclick="buttonClicked(1)">
                    <?php echo $choice1?>
                </div>
            <?php
                if ($choice2 != null) {
                    echo '
                <div id="choice2" class="button choice" onclick="buttonClicked(2)">' . 
                    $choice2 . '
                </div>
                    ';
                }
            ?>
            </div>
        </div>
        <div id="navigation">
            <div id="logout" class="button" onclick="logout()">
                Logga ut
            </div>
            <div id="delete-account" class="button" onclick="deleteAccount()">
                Radera kontot
            </div>
            <div id="compass">
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
        </div>
    </div>
    <script src="../scripts/script.js"></script>
    <script>
        function buttonClicked(choice) {
            if ('<?php echo $special ?>' == '') {
                if (<?php echo $position_id?> != 98) {
                    showLine(choice);
                    setVisited(<?php echo $position_id ?>);
                }
                else {
                    if (choice == 1) {
                        window.location.href = "main.php?special=shop";
                    }
                    else {

                    }
                }
            }
            else if ('<?php echo $special ?>' == 'shop') {
                if (choice == 1) {
                    window.location.href = "main.php";
                }
                else {

                }
            }
        }

        function showLine(line) {
            viewChatBox();
            switch (line) {
                case 0:
                    document.getElementById("chat-box").innerHTML = "<?php if (isset($lines)) {echo $lines[0];} ?>";
                    break;
                case 1:
                    document.getElementById("chat-box").innerHTML = "<?php if (isset($lines)) {echo $lines[1];} ?>";
                    break;
                case 2:
                    document.getElementById("chat-box").innerHTML = "<?php if (isset($lines)) {echo $lines[2];} ?>";
                    break;
            }
        }

    <?php
        echo "viewMainImage($surrounding_id, '$main_img_type', '$special');";

        if ($visited == 0 && isset($lines) && $special == null) {
            echo "
                document.getElementById('chat-box').style.visibility = 'visible';
                showLine(0);
            ";
        }

        if($special == 'shop') {
            echo "document.getElementById('navigation').style.visibility = 'hidden';";
        }
    ?>
    </script>
</body>
</html>