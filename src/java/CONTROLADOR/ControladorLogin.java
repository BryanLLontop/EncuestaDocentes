/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import BEANS.BeansCurso;
import BEANS.BeansEstudiante;
import BEANS.BeansUsuario;
import DAO.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bryan Llontop
 */
public class ControladorLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     *
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion = request.getParameter("accion");

        if (opcion.equalsIgnoreCase("logout")) {
            RequestDispatcher destinos = request.getRequestDispatcher("./salir.jsp");
            destinos.forward(request, response);
        }
        if (opcion.equalsIgnoreCase("regresar")) {
            RequestDispatcher destinos = request.getRequestDispatcher("home.jsp");
            destinos.forward(request, response);
        }
        if (opcion.equalsIgnoreCase("volver")) {
            RequestDispatcher destinos = request.getRequestDispatcher("home.jsp");
            destinos.forward(request, response);
        }
        if (opcion.equalsIgnoreCase("encuesta")) {
            RequestDispatcher destinos = request.getRequestDispatcher("home.jsp");
            try {
                int curso = Integer.parseInt(request.getParameter("curso"));
                DAO odao = new DAO();
                BeansCurso ocurso = odao.BuscarCurso(curso);
                request.setAttribute("curso", ocurso);
                destinos = request.getRequestDispatcher("home1.jsp");
            } catch (Exception e) {

            }

            destinos.forward(request, response);
        }

        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion = request.getParameter("opcion");

        if (opcion.equalsIgnoreCase("login")) {
            String u = request.getParameter("username");
            String c = request.getParameter("password");

            int cu = 0, cc = 0;
            cu = u.trim().length();
            cc = c.trim().length();

            if ((cu == 0) || (cc == 0)) {
                RequestDispatcher destinos = request.getRequestDispatcher("index.jsp");
                destinos.forward(request, response);
            }
            try {
                DAO objU = new DAO();
                BeansUsuario user = objU.BuscarUsuarioPorClave(u, c);
                if (user.getId_usuario() != -1) {
                    String nombre, tipo;
                    tipo = user.getTipo();
                    nombre = "";
                    String codigo = "";
                    RequestDispatcher destinos = request.getRequestDispatcher("index.jsp");
                    DAO objU1 = new DAO();
                    if (tipo.equalsIgnoreCase("director")) {

                        nombre = "RECTORADO";
                        destinos = request.getRequestDispatcher("admin.jsp");
                    }
                    if (tipo.equalsIgnoreCase("estudiante")) {
                        BeansEstudiante es = new BeansEstudiante();
                        es = objU1.BuscarEstudiante(user.getId_usuario());
                        nombre = es.getNombres_estudiante() + " " + es.getApellidos_estudiante();
                        codigo = es.getCodigo_estudiante();
                        destinos = request.getRequestDispatcher("home.jsp");
                    }
                    //creamos session
                    HttpSession misession = request.getSession(true);
                    misession.setAttribute("n", nombre);
                    misession.setAttribute("t", tipo);
                    misession.setAttribute("codigo", codigo);
                    destinos.forward(request, response);
                } else {
                    RequestDispatcher destinos = request.getRequestDispatcher("index.jsp");
                    destinos.forward(request, response);
                }

            } catch (SQLException ex) {
                Logger.getLogger(ControladorLogin.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (opcion.equalsIgnoreCase("votar")) {
            
            double promedio = 0;
            int curso = Integer.parseInt(request.getParameter("curs"));
            String codigo = request.getParameter("cod");
            for (int i = 0; i < 20; i++) {
                promedio = promedio + Integer.parseInt(request.getParameter("inlineRadioOptions" + i));
            }
            promedio = promedio / 20.0;
            promedio = (promedio * 20.0) / 5.0;
            try {
                DAO odao = new DAO();
                odao.GuardarResultadoCurso(promedio, curso, codigo);
                RequestDispatcher destinos = request.getRequestDispatcher("home.jsp");
                destinos.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorLogin.class.getName()).log(Level.SEVERE, null, ex);
            }
            

        }

        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
