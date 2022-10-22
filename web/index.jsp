<%-- 
    Document   : index
    Created on : 22/10/2021, 02:14:26 PM
    Author     : Bryan Llontop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/style.css">

        <title>Login UNPRG</title>
    </head>
    <body>

        <%
            String nombre = "";
            String ruta = "ControladorLogin?accion=regresar";
            if (session.getAttribute("n") != null || session.getAttribute("t") != null || session.getAttribute("codigo") != null) {
                nombre = (String) request.getSession().getAttribute("n");
                if (session.getAttribute("t").equals("director")) {
                    ruta = "ControladorLogin?accion=volver";
                }
        %> 
        <div class="login-box">
            <div class="card"> 
                <div class="card-body login-card-body">
                    <p class="login-box-msg"><b>CONFIRMAR</b></p>
                    <p> Actualmente ha iniciado sesión como <%= nombre%>, necesita salir
                        antes de volver a entrar con un usuario diferente.</p>
                    <a type="button" class="btn btn-block btn-outline-danger btn-sm" href="salir.jsp" >Cerrar Sesion</a>
                    <a href="<%= ruta%>" >Cancelar</a><br>
                </div>
            </div>  
        </div>
        <% } else { %>
        
        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('images/imgFont2.jpg');"></div>
            <div class="contents order-2 order-md-1">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7">
                            <img style="padding-left:160px; padding-bottom: 10px " height="150px" src="images/logo_unprg1.png" alt=""/>
                            <h3>Login to <strong>UNPRG</strong></h3>    

                            <form action="ControladorLogin" method="post">
                                <input readonly type="hidden" name="opcion" value="login">
                                <div class="form-group first">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" placeholder=" 150122H" name="username">
                                </div>
                                <div class="form-group last mb-3">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" placeholder="Your Password" name="password">
                                </div>

                                <div class="d-flex mb-5 align-items-center">
                                    <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                                        <input type="checkbox" checked="checked"/>
                                        <div class="control__indicator"></div>
                                    </label>
                                    <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                                </div>

                                <input type="submit" value="Log In" class="btn btn-block btn-primary">

                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>
         <% }%>


        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        
    </body>
</html>
