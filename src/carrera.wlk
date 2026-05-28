class Carrera{
    const nombreC
    const materias
    method materias() = materias
    method esDeLaCarrera(materia){
        return materias.any({laMateria => laMateria == materia})
    }
    method nombreC() = nombreC
}