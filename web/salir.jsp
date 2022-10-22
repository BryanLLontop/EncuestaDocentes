
<%  if (session.getAttribute("n") != null || session.getAttribute("t") != null) {
        session.setAttribute("n", null);
        session.setAttribute("t", null);
        session.setAttribute("codigo", null);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
%>