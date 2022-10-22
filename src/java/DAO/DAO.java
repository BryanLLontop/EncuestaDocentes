/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import BEANS.BeansCurso;
import BEANS.BeansDocente;
import BEANS.BeansEscuela;
import BEANS.BeansEstudiante;
import BEANS.BeansUsuario;
import Config.Conexion;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bryan Llontop
 */
public class DAO {

    Conexion cn;
    Connection con;
    BeansEstudiante e;
    BeansCurso c;
    BeansCurso c1;
    BeansUsuario u;
    CallableStatement cs;
    private ResultSet rs;

    public DAO() throws SQLException, IOException {
        this.cn = new Conexion();
    }

    public BeansEstudiante BuscarEstudiante(int idusuario) throws SQLException {
        try {
            String sql = "call desempeño_docentes.BUSCAR_ESTUDIANTE(?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            cs.setInt(1, idusuario);
            rs = cs.executeQuery();
            while (rs.next()) {
                BeansEscuela e1 = new BeansEscuela();
                BeansUsuario u = new BeansUsuario();

                e = new BeansEstudiante();
                e.setCodigo_estudiante(rs.getString(1));
                e.setNombres_estudiante(rs.getString(2));
                e.setApellidos_estudiante(rs.getString(3));
                e1.setId_escuela(rs.getInt(4));
                e1.setNombre_escuela(rs.getString(5));
                u.setId_usuario(rs.getInt(6));
                e.setEscuela(e1);
                e.setUsuario(u);

            }
            cs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
        return e;
    }

    public BeansEstudiante BuscarEstudiante(String codigo) throws SQLException {
        try {
            String sql = "call desempeño_docentes.CONSULT_ESTUDIANTE(?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            cs.setString(1, codigo);
            rs = cs.executeQuery();
            while (rs.next()) {
                BeansEscuela e1 = new BeansEscuela();
                BeansUsuario u = new BeansUsuario();

                e = new BeansEstudiante();
                e.setCodigo_estudiante(rs.getString(1));
                e.setNombres_estudiante(rs.getString(2));
                e.setApellidos_estudiante(rs.getString(3));
                e1.setId_escuela(rs.getInt(4));
                e1.setNombre_escuela(rs.getString(5));
                u.setId_usuario(rs.getInt(6));
                e.setEscuela(e1);
                e.setUsuario(u);

            }
            cs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
        return e;
    }

    public List CursosxEstudiante(String codigo) throws SQLException {
        ArrayList<BeansCurso> list = new ArrayList<>();
        try {
            String sql = "call desempeño_docentes.CURSOS_ESTUDIANTE(?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            cs.setString(1, codigo);
            rs = cs.executeQuery();
            BeansDocente d;
            while (rs.next()) {
                d = new BeansDocente();
                c = new BeansCurso();
                c.setId_curso(rs.getInt(3));
                c.setNombre_curso(rs.getString(4));
                c.setCiclo(rs.getString(5));

                d.setCodigo_docente(rs.getString(6));
                d.setNombre_docente(rs.getString(7));
                d.setApellido_docente(rs.getString(8));
                c.setDocente(d);

                list.add(c);
            }
            cs.close();
            con.close();

        } catch (SQLException e) {
            throw e;
        }

        return list;
    }

    public List CursosxDocente(String codigo) throws SQLException {
        ArrayList<BeansCurso> list = new ArrayList<>();
        try {
            String sql = "call desempeño_docentes.CURSOS_DOCENTE(?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            cs.setString(1, codigo);
            rs = cs.executeQuery();
            BeansDocente d;
            while (rs.next()) {
                d = new BeansDocente();
                c = new BeansCurso();
                c.setId_curso(rs.getInt(1));
                c.setNombre_curso(rs.getString(2));
                c.setCiclo(rs.getString(3));

                d.setCodigo_docente(rs.getString(4));
                d.setNombre_docente(rs.getString(5));
                d.setApellido_docente(rs.getString(6));
                c.setDocente(d);

                list.add(c);
            }
            cs.close();
            con.close();

        } catch (SQLException e) {
            throw e;
        }

        return list;
    }
    public List ReadDocentes() throws SQLException {
        ArrayList<BeansDocente> list = new ArrayList<>();
        try {
            String sql = "call desempeño_docentes.READ_Docente();";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            rs = cs.executeQuery();
            BeansDocente d;
            while (rs.next()) {
                d = new BeansDocente();
                d.setCodigo_docente(rs.getString(1));
                d.setNombre_docente(rs.getString(2));
                d.setApellido_docente(rs.getString(3));

                list.add(d);
            }
            cs.close();
            con.close();

        } catch (SQLException e) {
            throw e;
        }

        return list;
    }
    public BeansUsuario BuscarUsuarioPorClave(String usuario, String contraseña) throws SQLException {

        try {
            String sql = "call desempeño_docentes.BUSCAR_USUARIO(?,?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            cs.setString(1, usuario);
            cs.setString(2, contraseña);
            rs = cs.executeQuery();
            u = new BeansUsuario();
            if (rs.next()) {
                u.setId_usuario(rs.getInt(1));
                u.setUsuario(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setTipo(rs.getString(4));
            } else {
                u.setId_usuario(-1);
            }
            cs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
        return u;
    }

    public BeansCurso BuscarCurso(int idcurso) throws SQLException {
        try {
            String sql = "call desempeño_docentes.CONSULT_CURSO(?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            cs.setInt(1, idcurso);
            rs = cs.executeQuery();
            while (rs.next()) {
                BeansDocente d = new BeansDocente();
                c1 = new BeansCurso();
                c1.setId_curso(rs.getInt(1));
                c1.setNombre_curso(rs.getString(2));
                c1.setCiclo(rs.getString(3));
                d.setCodigo_docente(rs.getString(4));
                d.setNombre_docente(rs.getString(5));
                d.setApellido_docente(rs.getString(6));
                c1.setDocente(d);
            }
            cs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
        return c1;
    }

    public void GuardarResultadoCurso(double puntaje, int curso, String codigoestudiante) throws SQLException {
        try {
            String sql = "call desempeño_docentes.SAVE_RESULT(?,?,?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);

            cs.setDouble(1, puntaje);
            cs.setInt(2, curso);
            cs.setString(3, codigoestudiante);

            cs.execute();
            cs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public String ConsultarResultadoEstudiante(String codigoestudiante, int curso) throws SQLException {
        String result = "";
        try {
            String sql = "call desempeño_docentes.CONSULT_RESULTADOS(?,?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            cs.setString(1, codigoestudiante);
            cs.setInt(2, curso);
            rs = cs.executeQuery();
            if (rs.next()) {
                result = "SI";
            } else {
                result = "NO";
            }
            cs.execute();
            cs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
        return result;
    }
     public double ResultadoCurso(int curso) throws SQLException {
        double result =0;
        int i=0;
        try {
            String sql = "call desempeño_docentes.RESULTADOS_CURSO(?);";
            con = cn.getConexion();
            cs = con.prepareCall(sql);
            cs.setInt(1, curso);
            rs = cs.executeQuery();
            while (rs.next()) {
                i++;
                result = result + rs.getDouble(2);
                result = result / i;
            }
            cs.execute();
            cs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
        return result;
    }
}
