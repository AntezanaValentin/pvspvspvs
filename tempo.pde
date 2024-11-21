class Temporizador {
  int duracion;
  int ultimoEvento;

  Temporizador(int p_duracion) {
    duracion = p_duracion;
    ultimoEvento = millis();
  }

  boolean elTiempoPaso() {
    int tiempoActual = millis();
    if (tiempoActual - ultimoEvento >= duracion) {
      return true;
    } else return false;
  }

  void actualizarVariables() {
    ultimoEvento = millis();
  }

  float tiempoPrendido() {
    return((millis() - ultimoEvento) / duracion);
  }
}
