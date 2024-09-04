import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0, 2)
	var property seguidor = silvestre

	method image() {
		return if (self.estaAtrapada()) "pepita-gris.png" 
		else if (self.estaEnElNido()) "pepita-grande.png" else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		seguidor.position(game.at( 
			if(position.x() >= 3) position.x() else seguidor.position().x(), 
			seguidor.position().y() ))
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		
		return self.position() == nido.position()
	}

	method estaAtrapada() {
		return seguidor.position() == self.position()
	}
}

