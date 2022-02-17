function ajax(url, params, callback, method){
const xhttp = new XMLHttpRequest()

method = method.toUpperCase() /*대문자로 변환해 줌*/ 
if(method != 'POST') {
method='GET'
}
if(method == 'GET'){
url = url + "?" +params  /*get이 맞으면 params을 get방식으로 나타내 줌*/
}
xhttp.open(method, url, true)
xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
xhttp.send(method == 'POST' ? params : null) /*get 방식일때는 null이다.*/
xhttp.onreadystatechange = callback
}