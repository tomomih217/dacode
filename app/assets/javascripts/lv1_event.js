function appendCode(){
  const target = document.getElementById('js-explode');
  const p = document.createElement('p');
  const code = document.createTextNode('def check_num(num)\r\n  return 0\r\n  if num >= 0\r\n    return num\r\n  end\r\n end');
  p.appendChild(code);
  target.append(p);
}

function appendLv1FinishBtn(){
  var appendFinishBtn = document.getElementById('js-append-finish-btn');
  var deleteReturnBtn = document.getElementById('js-delete-return-btn-for-level1');
  var deletebtn = appendFinishBtn.removeChild(deleteReturnBtn);
  var appendClearBtn = document.getElementById('js-append-clear-btn-for-level1');
  appendClearBtn.removeAttribute('style');
}

function lv1FinishBomb(){
  var target = document.getElementById("js-check");
  target.classList.add('bkht');
  sleep(3, function () {
    sparcle();
    target.classList.remove('bkht');
    target.innerHTML = '';
    appendLv1FinishBtn();
  });

}