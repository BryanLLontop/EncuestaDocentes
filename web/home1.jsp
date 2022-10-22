<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="BEANS.BeansCurso"%>
<%@page import="DAO.DAO"%>
<%  String nombre = "";
    String codigo = "";
    BeansCurso ocurso = new BeansCurso();
    if (session.getAttribute("n") != null || session.getAttribute("t") != null || session.getAttribute("codigo") != null) {
         if (session.getAttribute("t").equals("estudiante")) {
            nombre = (String) request.getSession().getAttribute("n");
            codigo = (String) request.getSession().getAttribute("codigo");
             ocurso = (BeansCurso) request.getAttribute("curso");
        } else {
            response.sendRedirect("admin.jsp");
        }
       
    } else {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Área personal</title>

        <link rel="apple-touch-icon" href="apple-icon.png">
        <link rel="shortcut icon" href="favicon.ico">

        <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">

        <link rel="stylesheet" href="assets/css/style.css">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    </head>

    <body>

        <!-- Left Panel -->

        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-angle-double-left"></i>
                    </button>
                    <a class="navbar-brand" href="home.jsp"><img style="height: 50px" src="images/logo_unprg1.png" alt="Logo"></a>
                </div>


                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#"> <i class="menu-icon fa fa-dashboard"></i>Área personal </a>
                        </li>
                        <h3 class="menu-title">Mis Cursos</h3><!-- /.menu-title -->
                        <%
                            DAO daoc = new DAO();
                            List<BeansCurso> list = daoc.CursosxEstudiante(codigo);
                            Iterator<BeansCurso> iter = list.iterator();
                            BeansCurso c = null;
                            while (iter.hasNext()) {
                                c = iter.next();

                        %>
                        <li>
                            <a href="ControladorLogin?accion=encuesta&curso=<%= c.getId_curso()%>"> <i class="menu-icon fa fa-graduation-cap"></i> <%= c.getNombre_curso()%> </a>
                        </li>
                        <%}%>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>
        </aside><!-- /#left-panel -->

        <!-- Left Panel -->

        <!-- Right Panel -->

        <div id="right-panel" class="right-panel">

            <!-- Header-->
            <header id="header" class="header">

                <div class="header-menu">

                    <div class="col-sm-7">
                        <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                        <div class="header-left">
                            <!-- BUSCAR-->
                            <button class="search-trigger"><i class="fa fa-search"></i></button>
                            <div class="form-inline">
                                <form class="search-form">
                                    <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                    <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                                </form>
                            </div>
                            <!-- NOTIFICACIONES-->
                            <div class="dropdown for-notification">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-bell"></i>
                                    <span class="count bg-danger">5</span>
                                </button>
                            </div>
                            <!-- MENSAJES-->
                            <div class="dropdown for-message">
                                <button class="btn btn-secondary dropdown-toggle" type="button"
                                        id="message"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="ti-email"></i>
                                    <span class="count bg-primary">9</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-5">
                        <div class="user-area dropdown float-right"> 
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i><%= nombre%></i> 
                                <img class="user-avatar rounded-circle" src="images/usuario.png" alt="User">
                            </a>

                            <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="#"><i class="fa fa-user"></i> My Profile</a>

                                <a class="nav-link" href="#"><i class="fa fa-user"></i> Notifications <span class="count">14</span></a>

                                <a class="nav-link" href="#"><i class="fa fa-cog"></i> Settings</a>

                                <a class="nav-link" href="salir.jsp"><i class="fa fa-power-off"></i> Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </header><!-- /header -->

            <!-- Header-->

            <div class="breadcrumbs">
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1><%= ocurso.getNombre_curso()%></h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li class="active"><%= ocurso.getDocente().getNombre_docente()%> <%= ocurso.getDocente().getApellido_docente()%></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content mt-3">
                <%
                    DAO od = new DAO();
                    if (od.ConsultarResultadoEstudiante(codigo, ocurso.getId_curso()).equalsIgnoreCase("SI")) {
                %>
                <div class="col-sm-12">
                    <div class="align-content-center" >
                        <span class="badge badge-pill badge-danger">Encuesta Desempeño de Docente REALIZADA, THANKS!</span>                        
                    </div>
                </div>

                <%} else { %> 
                <div class="col-sm-12">
                    <div class="align-content-center" >
                        <span class="badge badge-pill badge-success">Encuesta Desempeño de Docente</span>                        
                    </div>
                </div>
                <!-- ENCUESTA-->
                <div class="container">

                    <!-- FORMULARIOOOOOO-->
                    <form action="ControladorLogin" method="post">
                        <input readonly type="hidden" name="opcion" value="votar">
                        <input readonly type="hidden" name="curs" value="<%= ocurso.getId_curso()%>">
                        <input readonly type="hidden" name="cod" value="<%= codigo%>">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">PREGUNTA</th>
                                    <th scope="col">Muy en desacuerdo</th>
                                    <th scope="col">En desacuerdo</th>
                                    <th scope="col">Indiferente</th>
                                    <th scope="col">De acuerdo</th>
                                    <th scope="col">Muy de acuerdo</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    for (int i = 0; i < ocurso.getPreguntas().size(); i++) {
                                %>
                                <tr>                            
                                    <th scope="row"><%= i + 1%></th>
                                    <td><%= ocurso.getPreguntas().get(i)%></td>
                                    <td>
                                        <div class="form-check form-check-inline"> 
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions<%= i%>" id="inlineRadio" value="1">
                                            <label class="form-check-label" for="inlineRadio1">1</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-check form-check-inline"> 
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions<%= i%>" id="inlineRadio" value="2">
                                            <label class="form-check-label" for="inlineRadio1">2</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-check form-check-inline"> 
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions<%= i%>" id="inlineRadio" value="3">
                                            <label class="form-check-label" for="inlineRadio1">3</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-check form-check-inline"> 
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions<%= i%>" id="inlineRadio" value="4">
                                            <label class="form-check-label" for="inlineRadio1">4</label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-check form-check-inline"> 
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions<%= i%>" id="inlineRadio" value="5">
                                            <label class="form-check-label" for="inlineRadio1">5</label>
                                        </div>
                                    </td>

                                </tr>
                                <% }%>

                            </tbody>

                        </table>
                        <input type="submit" value="Enviar Respuestas" class="btn btn-block btn-outline-info">
                    </form>
                    <p></p>
                    <p></p>
                    <p></p>
                    <p></p>
                    <p></p>
                    <p></p>

                </div>
                <% }%>

            </div> <!-- .content -->
        </div><!-- /#right-panel -->

        <!-- Right Panel -->

        <script src="vendors/jquery/dist/jquery.min.js"></script>
        <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
        <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>

