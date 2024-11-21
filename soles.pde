class Sol {
  PVector pos;
  PVector posFinal;
  PVector vel;
  PVector sumando;
  PVector esquina;
  float r;
  int tCuantoVive;
  Temporizador cuantoVive;

  Sol(PVector otro) {
    pos = new PVector(random(otro.x - 10, otro.x + 10), otro.y);
    vel = new PVector(0, 2);
    posFinal = new PVector(0, otro.y + 70);
    sumando = new PVector(50, 50);
    tCuantoVive = 8000;
    cuantoVive = new Temporizador(tCuantoVive);
    r = 30;
  }

  Sol() {
    pos = new PVector(random(100, 1000), 0);
    vel = new PVector(0, 2);
    posFinal = new PVector(0, (100*int(random(1, 6))));
    sumando = new PVector(50, 50);
    tCuantoVive = 18000;
    cuantoVive = new Temporizador(tCuantoVive);
    r = 30;
  }

  void mover() {
    pos.add(vel);
  }

  void agarrado() {
    PVector d = pos.copy();
    d.sub(sumando);
    d.normalize();
    d.mult(-4);
    vel.mult(0);
    vel.lerp(d, 1);
  }


  void mostrar() {
    fill(255, 255, 0);
    circle(pos.x, pos.y, r);
    if (pos.y >= posFinal.y) {
      vel.mult(0);
    }
  }
}
