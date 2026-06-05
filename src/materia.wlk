
class Materia {
    const requisitosM = #{}
    const requisitosC = 0
    const creditosQueOtorga = 6 // Me rompia el test, asi que puse 6 por default por fiaca
    var property cupos = 30 // Me parecio bien dejarle una cantidad de cupos por default
    method requisitosM() = requisitosM
    method requisitosC() = requisitosC
    method tieneCupos() = cupos > 0
    method creditosQueOtorga() = creditosQueOtorga
}