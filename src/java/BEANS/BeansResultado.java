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
public class BeansResultado {
    int id_resultado;
    int puntaje;
    BeansCurso curso;

    public BeansResultado() {
    }

    public BeansResultado(int id_resultado, int puntaje, BeansCurso curso) {
        this.id_resultado = id_resultado;
        this.puntaje = puntaje;
        this.curso = curso;
    }

    public int getId_resultado() {
        return id_resultado;
    }

    public void setId_resultado(int id_resultado) {
        this.id_resultado = id_resultado;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    public BeansCurso getCurso() {
        return curso;
    }

    public void setCurso(BeansCurso curso) {
        this.curso = curso;
    }
    
    
}
