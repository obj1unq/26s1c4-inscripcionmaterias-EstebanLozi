class Carrera{
    const nombreC
    var property materias = #{} 
    method esDeLaCarrera(materia){
        return materias.any({laMateria => laMateria == materia})
    }
    method nombreC() = nombreC
}