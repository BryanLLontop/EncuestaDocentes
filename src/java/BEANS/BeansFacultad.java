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
public class BeansFacultad {
    int id_facultad;
    String nombre_facultad;

    public BeansFacultad() {
    }

    public BeansFacultad(int id_facultad, String nombre_facultad) {
        this.id_facultad = id_facultad;
        this.nombre_facultad = nombre_facultad;
    }

    public int getId_facultad() {
        return id_facultad;
    }

    public void setId_facultad(int id_facultad) {
        this.id_facultad = id_facultad;
    }

    public String getNombre_facultad() {
        return nombre_facultad;
    }

    public void setNombre_facultad(String nombre_facultad) {
        this.nombre_facultad = nombre_facultad;
    }
    
    
}
