<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="BEANS.BeansCurso"%>
<%@page import="DAO.DAO"%>
<%  String nombre = "";
    String codigo = "";
    if (session.getAttribute("n") != null || session.getAttribute("t") != null || session.getAttribute("codigo") != null) {
        if (session.getAttribute("t").equals("estudiante")) {
            nombre = (String) request.getSession().getAttribute("n");
            codigo = (String) request.getSession().getAttribute("codigo");
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
                            <h1>Área personal</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li class="active">Vista general de curso</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content mt-3">
                <!-- Anuncio-->
                <div class="col-sm-12">
                    <div class="alert  alert-success alert-info fade show" role="alert">
                        <span class="badge badge-pill badge-info">Importante</span> Responder las encuestas de desempeño de docente en cada curso.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>

                <%
                    DAO daoc1 = new DAO();
                    List<BeansCurso> list1 = daoc1.CursosxEstudiante(codigo);
                    Iterator<BeansCurso> iter1 = list1.iterator();
                    BeansCurso c1 = null;
                    while (iter1.hasNext()) {
                        c1 = iter1.next();

                %>
                <div class="col-lg-3 col-md-6">
                    <div class="social-box ">
                        <a href="ControladorLogin?accion=encuesta&curso=<%= c1.getId_curso()%>"><i class="fa fa-book"></i></a>
                        <ul> 
                            <li> <span><%= c1.getCiclo()%></span> </li>
                        </ul>
                        <ul>    
                            <span><%= c1.getNombre_curso()%></span>
                        </ul>

                    </div>
                    <!--/social-box-->
                </div>
                <!--/.col-->
                <%}%>    


            </div> <!-- .content -->
        </div><!-- /#right-panel -->

        <!-- Right Panel -->

        <script src="vendors/jquery/dist/jquery.min.js"></script>
        <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
        <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>

