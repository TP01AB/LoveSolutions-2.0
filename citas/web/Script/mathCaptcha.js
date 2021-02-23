/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var code;
var CaptchaMatematico = false;
var result = 0;
function captcha() {
    var simbol = new Array('+', '-', '*', '/');
    var i;
    for (i = 0; i < 5; i++) {
        var a = parseInt(Math.random() * 100) + 1;
        var b = parseInt(Math.random() * 100) + 1;
        var s = simbol[Math.floor(Math.random() * simbol.length)];
    }
    if (b < a) {
        code = a + ' ' + s + ' ' + b;
    } else {
        code = b + ' ' + s + ' ' + a;
    }

    switch (s) {
        case '+' :
            result = a + b;
            break;
        case '-' :
            if (b < a) {
                result = a - b;
            } else {
                result = b - a;
            }
            break;
        case '*' :
            result = a * b;
            break;
        case '/' :
            if (b < a) {
                result = parseInt(a / b);
            } else {
                result = parseInt(b / a);
            }
            break;
    }

    creaIMG(code);
}

function validCaptcha(txtInput) {

    if (result == document.getElementById(txtInput).value) {
    CaptchaMatematico = true

            document.getElementById("validar").classList.remove('captcha_Comprobar-enable');
            document.getElementById("validar").classList.add('captcha_Comprobar-disable');
            document.getElementById("txtInput").classList.remove('captcha_introducido-enable');
            document.getElementById("txtInput").classList.add('captcha_introducido-disable');
            document.getElementById("refresh").classList.remove('captcha_refresh-enable');
            document.getElementById("refresh").classList.add('captcha_refresh-disable');
    } else {
    captcha();
            CaptchaMatematico = false;
            document.getElementById("validar").classList.add('captcha_Comprobar-enable');
            document.getElementById("validar").classList.remove('captcha_Comprobar-disable');
            document.getElementById("txtInput").classList.add('captcha_introducido-enable');
            document.getElementById("txtInput").classList.remove('captcha_introducido-disable');
            document.getElementById("refresh").classList.add('captcha_refresh-enable');
            document.getElementById("refresh").classList.remove('captcha_refresh-disable');
    }
    document.cookie = "CaptchaMatematico=" + CaptchaMatematico;
}

function creaIMG(texto) {
    var ctxCanvas = document.getElementById('captcha').getContext('2d');
    var fontSize = "30px";
    var fontFamily = "Arial";
    var width = 250;
    var height = 50;
    //tamaño
    ctxCanvas.canvas.width = width;
    ctxCanvas.canvas.height = height;
    //color de fondo
    ctxCanvas.fillStyle = "whitesmoke";
    ctxCanvas.fillRect(0, 0, width, height);
    //puntos de distorsión
    ctxCanvas.setLineDash([7, 10]);
    ctxCanvas.lineDashOffset = 5;
    ctxCanvas.beginPath();
    var line;
    for (var i = 0; i < (width); i++) {
        line = i * 5;
        ctxCanvas.moveTo(line, 0);
        ctxCanvas.lineTo(0, line);
    }
    ctxCanvas.stroke();
    //formato texto
    ctxCanvas.direction = 'ltr';
    ctxCanvas.font = fontSize + " " + fontFamily;
    //texto posicion
    var x = (width / 9);
    var y = (height / 3) * 2;
    //color del borde del texto
    ctxCanvas.strokeStyle = "yellow";
    ctxCanvas.strokeText(texto, x, y);
    //color del texto
    ctxCanvas.fillStyle = "red";
    ctxCanvas.fillText(texto, x, y);
}


