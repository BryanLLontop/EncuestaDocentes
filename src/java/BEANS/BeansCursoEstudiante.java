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
public class BeansCursoEstudiante {
    int id_cursoestudiante;
    BeansEstudiante estudiante;
    BeansCurso curso;

    public BeansCursoEstudiante() {
    }

    public BeansCursoEstudiante(int id_cursoestudiante, BeansEstudiante estudiante, BeansCurso curso) {
        this.id_cursoestudiante = id_cursoestudiante;
        this.estudiante = estudiante;
        this.curso = curso;
    }

    public int getId_cursoestudiante() {
        return id_cursoestudiante;
    }

    public void setId_cursoestudiante(int id_cursoestudiante) {
        this.id_cursoestudiante = id_cursoestudiante;
    }

    public BeansEstudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(BeansEstudiante estudiante) {
        this.estudiante = estudiante;
    }

    public BeansCurso getCurso() {
        return curso;
    }

    public void setCurso(BeansCurso curso) {
        this.curso = curso;
    }
    
    
}
