/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

/**
 *
 * @author Bryan Llontop
 */
public class BeansEstudiante {
    String codigo_estudiante;
    String nombres_estudiante;
    String apellidos_estudiante;
    BeansEscuela escuela;
    BeansUsuario usuario;

    public BeansEstudiante() {
    }

    public BeansEstudiante(String codigo_estudiante, String nombres_estudiante, String apellidos_estudiante, BeansEscuela escuela, BeansUsuario usuario) {
        this.codigo_estudiante = codigo_estudiante;
        this.nombres_estudiante = nombres_estudiante;
        this.apellidos_estudiante = apellidos_estudiante;
        this.escuela = escuela;
        this.usuario = usuario;
    }

    public String getCodigo_estudiante() {
        return codigo_estudiante;
    }

    public void setCodigo_estudiante(String codigo_estudiante) {
        this.codigo_estudiante = codigo_estudiante;
    }

    public String getNombres_estudiante() {
        return nombres_estudiante;
    }

    public void setNombres_estudiante(String nombres_estudiante) {
        this.nombres_estudiante = nombres_estudiante;
    }

    public String getApellidos_estudiante() {
        return apellidos_estudiante;
    }

    public void setApellidos_estudiante(String apellidos_estudiante) {
        this.apellidos_estudiante = apellidos_estudiante;
    }

    public BeansEscuela getEscuela() {
        return escuela;
    }

    public void setEscuela(BeansEscuela escuela) {
        this.escuela = escuela;
    }

    public BeansUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(BeansUsuario usuario) {
        this.usuario = usuario;
    }
    
    
    
    
    
}
