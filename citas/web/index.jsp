<%-- 
    Document   : index
    Created on : 20-feb-2021, 2:00:48
    Author     : isra9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas Login</title>
        <link rel="stylesheet" href="Style/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Quicksand:wght@300&display=swap" rel="stylesheet">

    </head>
    <body onload="validateLogin()">
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">

                <img src="sources/Logo.png" class="imagenLogo escalado"/>
                <img src="sources/Nombre.png" class="imagenTitulo"/>
                        
            </div>
        </header>
        <main class="row">
            <div class=" col-m-3 col-l-4"></div>
            <form name="Login" id="Login" action="./Controllers/MainController.jsp" class="col-m-6 col-l-4" novalidate> 
                <h1 class="tituloForm">Inicio Sesión</h1>
                <hr>
                <div class="m1">
                    <label for="email">
                        <input class="input col-m-12" type="email" name="email" id="email" placeholder="Introduce tu email" required/>
                        <span class="error " aria-live="polite"></span>
                    </label>

                </div>
                <div class="m1">
                    <label for="password">
                        <input class="input col-m-12" type="password" name="password" id="password" placeholder="Introduce tu contraseña"/>
                        <span class="error " aria-live="polite"></span> 
                    </label>

                </div>
                <div class="m1 centrado"><input   type="submit" name="Login" value="Iniciar" class="boton"></div>
                    <%
                        session.removeAttribute("captchaActivo");
                        int az = (int) (Math.random() * 3);

                        if (az == 0) {
                            session.setAttribute("captchaActivo", "Si");
                    %>
                <div class="row">
                    <div class="col-m-3"></div>
                    <div class=" col-m-4 g-recaptcha centrado" data-sitekey="6LelKtkZAAAAABYQiYE7QtJFtdqwF0aRzurS7xba"></div>
                </div>
                <%
                    }
                    if (session.getAttribute("mensaje") != null) {
                        String mensaje = (String) session.getAttribute("mensaje");
                %>
                <div class="m1 centrado"><span name="mensaje" id="mensaje"><%=mensaje%></span></div>
                    <%
                        }
                    %>


                <hr>
                <div class="m1 centrado">
                    <a href="Views/olvidada.jsp">He olvidado la contraseña </a> o <a href="Views/registro.jsp">registrarme</a>
                </div>
            </form>
            <div class="col-m-3 col-l-4"></div>
        </main>
        <footer class="footer">
            <p><a href="https://github.com/TP01AB/LoveSolutions-2.0">© Israel Molina Pulpon, 2021</a></p>
        </footer>
    </body>
    <script src="./Script/validate.js"></script>
    <script src="https://www.google.com/recaptcha/api.js"></script>
</html>
