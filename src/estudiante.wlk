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
        var promedio
        return materiasAprobadas.foreach({materiaAprobada => promedio = promedio + materiaAprobada.nota()}) / self.cantMateriasAprobadas()
    }
    method inscribir(materia){
        if (carreras.any({carrera => carrera.esDeLaCarrera(materia)}) && not(self.aprobo(materia)) && inscripto.any({inscripcion => inscripcion == materia})){
            inscripto.add(materia)
        }
    }
    method aproboRequisitos(materia){

    }
}