<%-- 
    Document   : MainController
    Created on : 20-feb-2021, 2:00:16
    Author     : isra9
--%>
<%@page import="Auxiliar.Constantes"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Auxiliar.Captcha"%>
<%@page import="Auxiliar.passwordEncryption"%>
<%
    //LOGIN
    if (request.getParameter("Login") != null) {
        String email = request.getParameter("email");
        String password = passwordEncryption.MD5(request.getParameter("password"));

        //CAPTCHA GOOGLE
        boolean captcha = true;
        if (session.getAttribute("captchaActivo") != null) {
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            captcha = Captcha.verificar(gRecaptchaResponse);
        }
        //COMPROBAMOS QUE EXISTE EL USUARIO
        ConexionEstatica.nueva();
        Usuario usuarioActivo = ConexionEstatica.existeUsuario(email, password);
        if (usuarioActivo != null && captcha) {

            session.setAttribute("usuarioActivo", usuarioActivo);
            //ADMIN
            if (usuarioActivo.getRol() == 2) {
                if (usuarioActivo.isFirstTime()) {
                    // response.sendRedirect("../Views/encuesta.jsp");
                } else {
                    response.sendRedirect("../Views/elegirAdmin.jsp");
                }

                //USUARIO
            } else {
                //Si el usuario no está activado lanzara el mensaje
                if (!usuarioActivo.isActive()) {
                    session.setAttribute("mensaje", "¡Cuenta desactivada!");
                    response.sendRedirect("../index.jsp");
                    //Usuario activado
                } else {
                    if (usuarioActivo.isFirstTime()) {
                        response.sendRedirect("../Views/preferencias.jsp");
                    } else {//MODIFICAR EN FUTURO
                        response.sendRedirect("../Views/inicio.jsp");
                    }
                    //else {
                    //  response.sendRedirect("Vistas/encuesta.jsp");
                    //}
                }
            }

        } else {
            if (session.getAttribute("captchaActivo") != null) {
                session.setAttribute("mensaje", "Captcha no válido");
            } else {
                session.setAttribute("mensaje", "Usuario o contraseña incorrectos");
            }
            session.removeAttribute("captchaActivo");
            response.sendRedirect("../index.jsp");
        }
    }

    //Ir a registro
    if (request.getParameter("Registrar") != null) {

    }
%>