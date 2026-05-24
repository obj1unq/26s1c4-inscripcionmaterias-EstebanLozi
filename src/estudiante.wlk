import materiaAprobada.*
import materia.*
class Estudiante{
    const nombreE
    var property carreras = #{}
    var materiasAprobadas = #{}
    var property inscripto = #{}

    method nombreE() = nombreE
    method aprobar(materia, nota) {
      if (self.aprobo(materia)){
        self.error("Ya esta aprobada")
      }
      materiasAprobadas.add({new MateriaAprobada(materia = materia, nota = nota)})
    }
    method aprobo(materia){
        return materiasAprobadas.any({materias => materias.materia() == materia})
    }
    method cantMateriasAprobadas() = materiasAprobadas.size()
    method promedioNota() {
        return materiasAprobadas.fold(0, {promedio, materiaAprobada => promedio + materiaAprobada.nota()}) / self.cantMateriasAprobadas()
    }
    method inscribir(materia){
        if (carreras.any({carrera => carrera.esDeLaCarrera(materia)}) && 
            not(self.aprobo(materia)) && 
            not(inscripto.any({inscripcion => inscripcion == materia})) &&
            materia.requisitos().all({_materia => self.aprobo(_materia)}) &&
            materia.cupos() > 0){
            inscripto.add(materia)
            materia.cupos(materia.cupos()-1)
        }else{
            // Falta agregar el error
        }
    }
    method aproboRequisitos(materia){

    }
}