
function viewMainImage(surrounding_id, imgType) {
    console.log(surrounding_id);
    console.log(imgType);
    url = "../images/surroundings/" + surrounding_id + "." + imgType;
    document.getElementById("image-container").style.backgroundImage = `url(${url})`;
}

function logout() {
    document.cookie = "user_id=; expires=Thu, 18 Dec 2013 12:00:00; path=/the-game";
    window.location.href = "../";
}

function move(direction) {
    console.log(direction);
    window.location.href = "move.php/?direction=" + direction;
}