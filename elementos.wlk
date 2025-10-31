import plagas.*
class Hogar {
    var nivelDeMugre
    const confort
    method nivelDeMugre() = nivelDeMugre
    method confort() = confort

    method esBueno() = nivelDeMugre <= confort / 2

    method recibirAtaque(unaPlaga) {
        nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDaño()
    }
}
class Huerta {
    var capacidadDeProduccion
    method capacidadDeProduccion() = capacidadDeProduccion

    method esBueno() = capacidadDeProduccion > nivelPromedio.capacidadDeProduccion()

    method recibirAtaque(unaPlaga) {
        capacidadDeProduccion -= unaPlaga.nivelDeDaño() * 0.1 + if(unaPlaga.transmitenEnfermedades()) 10 else 0
    }
}

class Mascota {
    var nivelDeSalud
    method nivelDeSalud() = nivelDeSalud

    method esBueno() = nivelDeSalud > 250
    method recibirAtaque(unaPlaga) {
        if(unaPlaga.transmitenEnfermedades()){
            nivelDeSalud -= unaPlaga.nivelDeDaño()
        }
    }
}

object nivelPromedio {
    var capacidadDeProduccion = 0
    method capacidadDeProduccion() = capacidadDeProduccion

    method capacidadDeProduccion(unaCantidad) {
        capacidadDeProduccion = unaCantidad
        }
}

class Barrio {
    const elementos = []
    method elementos() = elementos

    method esCopado() = elementos.count({x=>x.esBueno()}) > elementos.count({x=>!x.esBueno()})
    method agregarElementos(unElemento) {
        elementos.add(unElemento)
    }
}