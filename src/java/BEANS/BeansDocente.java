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
public class BeansDocente {
    String codigo_docente;
    String nombre_docente;
    String apellido_docente;

    public BeansDocente() {
    }

    public BeansDocente(String codigo_docente, String nombre_docente, String apellido_docente) {
        this.codigo_docente = codigo_docente;
        this.nombre_docente = nombre_docente;
        this.apellido_docente = apellido_docente;
    }


    public String getCodigo_docente() {
        return codigo_docente;
    }

    public void setCodigo_docente(String codigo_docente) {
        this.codigo_docente = codigo_docente;
    }

    public String getNombre_docente() {
        return nombre_docente;
    }

    public void setNombre_docente(String nombre_docente) {
        this.nombre_docente = nombre_docente;
    }

    public String getApellido_docente() {
        return apellido_docente;
    }

    public void setApellido_docente(String apellido_docente) {
        this.apellido_docente = apellido_docente;
    }   
    
    
    
}
