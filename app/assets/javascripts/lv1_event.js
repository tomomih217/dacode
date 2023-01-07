function appendCode(){
  const target = document.getElementById('js-append-code');
  const p = document.createElement('p');
  const code = document.createTextNode('def check_num(num)\r\n  return 0\r\n  if num >= 0\r\n    return num\r\n  end\r\n end');
  p.appendChild(code);
  target.append(p);
}