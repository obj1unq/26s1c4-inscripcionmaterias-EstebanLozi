import estudiante.*
import materia.*
/*
    Prop: 
          * Conocer estudiantes inscriptos por materia y estudiantes en listas de espera. 
          * Anotar al primer alumno en lista de espera si un estudiante se da de baja
        (Me parecio que poner esto en materia y hacer bidireccional entre materia estudiante estaba mal y solo se me ocurrio esto)
*/
object inscripcionesPorMateria{
    var property estsPorMateria = new Dictionary()
    var property enEspera = new Dictionary()

    method agregarInscripcion(materia, estudiante){
        if (not (estsPorMateria.containsKey(materia))){
            estsPorMateria.put(materia, new Set())
        } estsPorMateria.get(materia).add(estudiante)
    }
    method agregarAEspera(materia, estudiante){
        if (not(enEspera.containsKey(materia))){
            enEspera.put(materia, new List())
        } enEspera.get(materia).add(estudiante)
    }
    method anotarAlPrimeroEsperando(estudiante, materia){ // Falta testear
        estsPorMateria.get(materia).remove(estudiante)
        if (!(enEspera.get(materia).isEmpty())){
            estsPorMateria.get(materia).add(enEspera.get(materia).first())
            enEspera.get(materia).remove(enEspera.get(materia).first()) // Se ve mal pero puse drop(1) en vez de remove(enEspera.get(materia).first()) y no me funcionaba
        }
    }
}