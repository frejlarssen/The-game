
function viewMainImage(surroundingId, imgType) {
    url = "../images/surroundings/" + surroundingId + "." + imgType;
    document.getElementById("image-container").style.backgroundImage = `url(${url})`;
}

function logout() {
    document.cookie = "user_id=; expires=Thu, 18 Dec 2013 12:00:00; path=/the-game";
    window.location.href = "../";
}

function move(direction) {
    window.location.href = "move.php/?direction=" + direction;
}