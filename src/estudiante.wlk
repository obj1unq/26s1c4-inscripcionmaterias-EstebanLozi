import materiaAprobada.*
import materia.*
import inscripcionesPorMateria.*
class Estudiante{
    var property carreras = #{}
    const materiasAprobadas = #{}
    var property materiasInscripto = #{}
    var property creditos = 0
    method materiasAprobadas() = materiasAprobadas
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
            materiasInscripto.add(materia)
            inscripcionesPorMateria.agregarInscripcion(materia,self)
            materia.cupos(materia.cupos()-1)
        }else inscripcionesPorMateria.agregarAEspera(materia,self)
    }
    method puedeInscribirse(materia){
        return (carreras.any({carrera => carrera.esDeLaCarrera(materia)}) && 
            not(self.aprobo(materia)) && 
            not(materiasInscripto.any({inscripcion => inscripcion == materia})) &&
            materia.requisitosM().all({_materia => self.aprobo(_materia)}) && materia.requisitosC() <= creditos)
    }
    method darDeBaja(materia){ // No se si funciona, me falta testear
        if (materiasInscripto.any({_materia => _materia == materia})){
            materiasInscripto.remove(materia)
            inscripcionesPorMateria.anotarAlPrimeroEsperando(self, materia)
        }
    }
    method enListaDeEspera(){
        return inscripcionesPorMateria.enEspera().fold(#{}, {enEspera, materia => if (materia.contains(self)) enEspera.add(materia)}) // Falta testear
    }   
    method lasQuePuedeInscribirse(carrera){
        return carrera.materias().fold(#{}, {lasQueSePuedeInscribir, materia => if (self.puedeInscribirse(materia)) lasQueSePuedeInscribir.add(materia)}) // Falta testear
    }

}