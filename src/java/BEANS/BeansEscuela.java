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
public class BeansEscuela {
    int id_escuela;
    String nombre_escuela;
//    int fk_id_facultad;
    BeansFacultad facultad;

    public BeansEscuela() {
    }

    public BeansEscuela(int id_escuela, String nombre_escuela, BeansFacultad facultad) {
        this.id_escuela = id_escuela;
        this.nombre_escuela = nombre_escuela;
        this.facultad = facultad;
    }

    public int getId_escuela() {
        return id_escuela;
    }

    public void setId_escuela(int id_escuela) {
        this.id_escuela = id_escuela;
    }

    public String getNombre_escuela() {
        return nombre_escuela;
    }

    public void setNombre_escuela(String nombre_escuela) {
        this.nombre_escuela = nombre_escuela;
    }

    public BeansFacultad getFacultad() {
        return facultad;
    }

    public void setFacultad(BeansFacultad facultad) {
        this.facultad = facultad;
    }
    
    
    
    
    
    
}
