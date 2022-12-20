// コードをリアルタイムで表示
function inputCheck() {
    inputValue = $('#js-inputForm').val();
    inputValue = inputValue.split("\n").join("<br>");
    document.getElementById("js-check").innerHTML = inputValue;
}