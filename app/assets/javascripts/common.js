// コードをリアルタイムで表示
function inputCheck() {
    inputValue = $('#js-inputForm').val();
    inputValue = inputValue.split("\n").join("<br>");
    document.getElementById("js-check").innerHTML = inputValue;
    if (inputValue == '') {
      document.getElementById("js-kusocode-submit-status").setAttribute("disabled", true);
    } else {
      document.getElementById("js-kusocode-submit-status").removeAttribute("disabled");
    }
}