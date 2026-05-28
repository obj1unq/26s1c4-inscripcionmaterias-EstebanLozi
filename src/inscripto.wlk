import estudiante.*
import materia.*
/*
    Prop: 
          * Conocer estudiantes inscriptos por materia y estudiantes en listas de espera. 
          * Anotar al primer alumno en lista de espera si un estudiante se da de baja
        (Me parecio que poner esto en materia y hacer bidireccional entre materia estudiante estaba mal y solo se me ocurrio esto)
*/
object inscriptos{
    var property estsPorMateria = new Dictionary()
    var property estsEnEspPorMateria = new Dictionary()

    method agregarInscripcion(materia, estudiante){
        if (not (estsPorMateria.containsKey(materia))){
            estsPorMateria.put(materia, new Set())
        } estsPorMateria.get(materia).add(estudiante)
    }
    method agregarAEspera(materia, estudiante){
        if (not(estsEnEspPorMateria.containsKey(materia))){
            estsEnEspPorMateria.put(materia, new List())
        } estsEnEspPorMateria.get(materia).add(estudiante)
    }
    method anotarAlPrimeroEsperando(materia){ // Falta testear
        if (not(estsEnEspPorMateria.get(materia).isEmpty())){
            estsPorMateria.get(materia).add(estsEnEspPorMateria.get(materia).first())
            estsEnEspPorMateria.get(materia).drop(1)
        }
    }
}