import elementos.*
class Plagas {
    var poblacion
    method poblacion() = poblacion
    
    method transmitenEnfermedades() = poblacion >= 10
    method atacar(unElemento) {
        poblacion = poblacion * 1.1
    }
    method atacarUnElemento(elemento) {
        elemento.recibirAtaque(self)
        self.atacar(elemento)
    }
}


class Cucarachas inherits Plagas {
    var pesoPromedio
    method pesoPromedio() = pesoPromedio

    method nivelDeDaño() = poblacion / 2
    override method transmitenEnfermedades() = super() and pesoPromedio >= 10
    override method atacar(unElemento) {
        poblacion = poblacion * 1.1
        pesoPromedio = pesoPromedio + 2
    }
}

class Pulgas inherits Plagas {
    method nivelDeDaño() = poblacion * 2
}

class Garrapatas inherits Pulgas {
    override method atacar(unElemento){
        poblacion = poblacion * 1.2
    }
}

class Mosquitos inherits Plagas {
    method nivelDeDaño() = poblacion
    override method transmitenEnfermedades() = super() and poblacion / 3 == 0 
}