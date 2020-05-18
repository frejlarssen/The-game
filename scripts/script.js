function ajaxNewXhttp() {
    if (window.XMLHttpRequest) {
        // IE7+, Firefox, Chrome, Opera, Safari
        return new XMLHttpRequest();
    } else {
        // IE5, IE6
        return new ActiveXObject('Microsoft.XMLHTTP');
    }
}

function viewMainImage(surroundingId, imgType, special) {
    let url;
    console.log(special);
    if (special == '') {
        url = "../images/surroundings/" + surroundingId + "." + imgType;
    }
    else if (special == 'shop') {
        url = "../images/shelves.svg";
    }
    document.getElementById("image-container").style.backgroundImage = `url(${url})`;
}

function viewChatBox() {
    url = "../images/chat_box.png";
    document.getElementById("chat-box").style.backgroundImage = `url(${url})`;
}

function setVisited(positionId) {
    let data = "position_id=" + positionId;

    let xhttp = ajaxNewXhttp();
    xhttp.onreadystatechange = function () {
        console.log(this.responseText);
    }
    xhttp.open('POST', '../php/ajax/set_visited.php');
    xhttp.setRequestHeader('Content-Type', "application/x-www-form-urlencoded");
    xhttp.send(data);
}

function logout() {
    document.cookie = "user_id=; expires=Thu, 18 Dec 2013 12:00:00; path=/the-game";
    window.location.href = "../";
}

function deleteAccount() {
    window.location.href = "./delete_account.php";
}

function move(direction) {
    window.location.href = "move.php/?direction=" + direction;
}

function buyItem(itemId) {
    let data = "item_id=" + itemId;

    let xhttp = ajaxNewXhttp();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let response = JSON.parse(this.responseText);
            if (response.status == "can buy") {
                document.getElementById("item-shop-" + itemId).style.visibility = 'hidden';
                let html = '<div id="item-inventory-' + itemId + '" class="item item-inventory" onclick="useItem(' + itemId + ')">' + response.item.name + '<img class="item-img" src="../images/items/' + itemId + '.' + response.item.img_type + '"></div>';
                document.getElementById("inventory").innerHTML += html;
                document.getElementById("gold").innerHTML = 'Riksdaler: ' + response.gold;
            }
        }
    }
    xhttp.open('POST', '../php/ajax/buy_item.php');
    xhttp.setRequestHeader('Content-Type', "application/x-www-form-urlencoded");
    xhttp.send(data);
}