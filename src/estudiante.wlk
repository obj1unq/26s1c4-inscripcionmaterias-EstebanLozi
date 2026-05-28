import materiaAprobada.*
import materia.*
import inscripto.*
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
        return materiasAprobadas.fold(0, {promedio, materiaAprobada => promedio + materiaAprobada.nota()}) / self.cantMateriasAprobadas() // Falta testear
    }
    method todasLasMateriasDeLasCarreras(){
        carreras.map(){carrera => carrera.materias()}.flatten().asSet()
    }
    method inscribir(materia){
        if(not (self.puedeInscribirse(materia))) {
            self.error("No se puede anotar")
        }
        if (self.puedeInscribirse(materia) && materia.tieneCupos()){
            inscripto.add(materia)
            inscriptos.agregarInscripcion(materia,self)
            materia.cupos(materia.cupos()-1)
        }else inscriptos.agregarAEspera(materia,self)
    }
    method puedeInscribirse(materia){
        return (carreras.any({carrera => carrera.esDeLaCarrera(materia)}) && 
            not(self.aprobo(materia)) && 
            not(inscripto.any({inscripcion => inscripcion == materia})) &&
            materia.requisitos().all({_materia => self.aprobo(_materia)}))
    }
    method darDeBaja(materia){ // No se si funciona, me falta testear
        inscripto.remove(materia)
        inscriptos.anotarAlPrimeroEsperando(materia)
    }
}