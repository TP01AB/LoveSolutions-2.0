/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function validateLogin() {
    const form = document.getElementById("Login");
    const mail = document.getElementById("email");
    const mailError = document.querySelector('#email + span.error');

    form.addEventListener('submit', function (event) {
        if (!mail.validity.valid) {
            errorMail();
            event.preventDefault();
        }
    });

    mail.addEventListener('blur', function (event) {
        if (mail.validity.valid) {
            mailError.innerHTML = '';
            mailError.className = 'error';
        } else {
            errorMail();
        }
    });

    function errorMail() {
        //Campo vacío
        if (mail.validity.valueMissing) {
            mailError.textContent = 'Debe introducir una dirección de correo electrónico.';
            //No cumple los requisitos del campo email
        } else if (mail.validity.typeMismatch) {
            mailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico.';
            //Datos demasiado cortos
        }
        // Establece el estilo apropiado
        mailError.className = 'error active';
    }


}
