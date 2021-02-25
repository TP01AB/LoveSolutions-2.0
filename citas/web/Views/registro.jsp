<%-- 
    Document   : registro
    Created on : 20-feb-2021, 11:35:44
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Love Solutions - Registro</title>
        <link rel="stylesheet" href="../Style/style.css">
    </head>
    <body onload="validateRegister()">
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">

                <img src="../sources/Logo.png" class="imagenLogo"/>
                <img src="../sources/Nombre.png" class="imagenTitulo"/>

            </div>
        </header>
        <main class="centrado">
            <div class="col-m-4"></div>
            <form name="registro" id="registro" action="../controlador.jsp" class="col-m-6 col-l-4" novalidate> 
                <h1>Registrate</h1>
                <div class=" row">
                    <div class="col-m-6">
                        <label for="email">
                            <span>email </span>
                            <input class="input" type="email" name="email" id="email" minlength="10" maxlength="25" required />
                            <span class="error" aria-live="polite"></span>   
                        </label>
                    </div>
                    <div class="col-m-6">

                        <label for="password">
                            <span>contraseña </span>
                            <input class="input" type="password" name="password" id="password" required minlength="8" maxlength="15"/>
                            <span class="error" aria-live="polite"></span>   
                        </label>
                    </div>
                </div>
                <hr>
                <div class="row m1">
                    <div class="col-m-6">
                        <label for="dni">
                            <span>dni: </span>
                            <input class="input" class="input" type="text" name="dni" id="dni" required pattern="^[0-9]{2}\.[0-9]{3}\.[0-9]{3}-[A-Z]$"/>
                            <span class="error" aria-live="polite"></span>   
                        </label>

                    </div>
                    <div class="col-m-6">
                        <label for="nick">
                            <span>nick: </span>
                            <input class="input" class="input" type="text" name="nick" id="nick" required minlength="5" maxlength="15"/>
                            <span class="error" aria-live="polite"></span>   
                        </label>
                    </div>
                </div>
                <div class="m1 row">
                    <div class="col-m-6">
                        <label for="tfn">
                            <span>teléfono: </span>
                            <input class="input" type="text" name="tfn" id="tfn" pattern="^[0-9]{3}-[0-9]{3}-[0-9]{3}$" required/>
                            <span class="error" aria-live="polite"></span>   
                        </label>
                    </div>
                    <div class="col-m-6">
                        <label for="age">
                            <span>edad: </span>
                            <input class="input" type="text" name="age" id="age" pattern="^[0-9]{1,3}$" required/>
                            <span class="error" aria-live="polite"></span>   
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-m-3"></div>
                    <div class="col-m-6">
                        <canvas id="captcha"></canvas>  
                    </div>
                    <div class="col-m-3">
                        <input type="button" id="refresh" value="Recargar" onclick="captcha();" class="boton"/>  
                    </div>
                </div>

                <div class="m1">
                    <input type="text" id="txtInput"/>
                    <input id="button1" type="button" value="Comprobar" onclick="validCaptcha('txtInput');" class="boton"/>
                    <span class="error" id="mensajeCaptcha"></span>                     
                </div>

                <div class="m1"><input type="submit" name="register" value="Confirmar" class="boton"/></div>
                <hr>
                <div class="m1"><a href="../index.jsp"><input type="button" name="back" value="Volver" class="boton"/></a></div>
            </form>
            <div class="col-m-3  col-l-4"></div>
        </main>
    </body>
    <script src="../Script/validate.js"></script>
</html>
