window.onload = function() {
    let status = document.querySelector('#status span');
    document.querySelector('#status').style.background = status.innerText === "Sold" ? "#FF4040" : "lightgreen";
}