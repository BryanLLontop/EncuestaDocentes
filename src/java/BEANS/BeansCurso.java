/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEANS;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bryan Llontop
 */
public class BeansCurso {
    int id_curso;
    String nombre_curso;
    String ciclo;
    BeansDocente docente;
    List<String> preguntas;
    public BeansCurso() {
        preguntas= new ArrayList<>();
        preguntas.add("Explica de manera clara los contenidos de la asignatura.");
        preguntas.add("Relaciona los contenidos de la asignatura con los contenidos de otras.");
        preguntas.add("Resuelve las dudas relacionadas con los contenidos de la asignatura.");
        preguntas.add("Propone ejemplos o ejercicios que vinculan la asignatura con la práctica profesional.");
        preguntas.add("Explica la utilidad de los contenidos teóricos y prácticos para la actividad profesional.");
        preguntas.add("Cumple con los acuerdos establecidos al inicio de la asignatura.");
        preguntas.add("Durante el curso establece las estrategias adecuadas necesarias para lograr el aprendizaje deseado.");
        preguntas.add("El programa presentado al principio de la asignatura se cubre totalmente.");
        preguntas.add("Incluye experiencias de aprendizaje en lugares diferentes al aula (talleres, laboratorios, empresa, comunidad, etc.).");
        preguntas.add("Utiliza para el aprendizaje las herramientas de interacción de las tecnologías actuales de la información (correo electrónico, chats, plataformas, etc.).");
        preguntas.add("Organiza actividades que me permiten ejercitar mi expresión oral y escrita.");
        preguntas.add("Relaciona los contenidos de la asignatura con la industria y la sociedad a nivel local, regional, nacional e internacional.");
        preguntas.add("Usa ejemplos y casos relacionados con la vida real.");
        preguntas.add("Adapta las actividades para atender los diferentes estilos de aprendizaje de los estudiantes.");
        preguntas.add("Promueve el autodidactismo y la investigación.");
        preguntas.add("Se involucra en las actividades propuestas al grupo.");
        preguntas.add("Presenta y expone las clases de manera organizada y estructurada.");
        preguntas.add("Identifica los conocimientos y habilidades de los estudiantes al inicio de la asignatura o de cada unidad.");
        preguntas.add("Proporciona información para realizar adecuadamente las actividades de evaluación.");
        preguntas.add("Toma en cuenta las actividades realizadas y los productos como evidencias para la calificación y acreditación de la asignatura");
       
    }

    public BeansCurso(int id_curso, String nombre_curso, String ciclo, BeansDocente docente) {
        this.id_curso = id_curso;
        this.nombre_curso = nombre_curso;
        this.ciclo = ciclo;
        this.docente = docente;
        this.preguntas= new ArrayList<>();
    }

    public int getId_curso() {
        return id_curso;
    }

    public void setId_curso(int id_curso) {
        this.id_curso = id_curso;
    }

    public String getNombre_curso() {
        return nombre_curso;
    }

    public void setNombre_curso(String nombre_curso) {
        this.nombre_curso = nombre_curso;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public BeansDocente getDocente() {
        return docente;
    }

    public void setDocente(BeansDocente docente) {
        this.docente = docente;
    }

    public List<String> getPreguntas() {
        return preguntas;
    }

    public void setPreguntas(List<String> preguntas) {
        this.preguntas = preguntas;
    }
    
    
}
