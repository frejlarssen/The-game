function ajaxNewXhttp() {
    if (window.XMLHttpRequest) {
        // IE7+, Firefox, Chrome, Opera, Safari
        return new XMLHttpRequest();
    } else {
        // IE5, IE6
        return new ActiveXObject('Microsoft.XMLHTTP');
    }
}

function viewMainImage(surroundingId, imgType) {
    url = "../images/surroundings/" + surroundingId + "." + imgType;
    document.getElementById("image-container").style.backgroundImage = `url(${url})`;
}

function viewChatBox() {
    url = "../images/chat_box.png";
    document.getElementById("chat-box").style.backgroundImage = `url(${url})`;
}

function setVisited(position_id) {
    let data = "position_id=" + position_id;

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

function move(direction) {
    window.location.href = "move.php/?direction=" + direction;
}