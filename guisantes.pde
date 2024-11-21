class Guisante {
  PVector pos;
  PVector vel;
  int r;
  int damage;
  PVector lentitud;
  int type;

  Guisante(PVector otro, int tipo) {
    pos = new PVector(otro.x + 25, otro.y + 5);
    vel = new PVector(2, 0);
    r = 18;
    type = tipo;
  }



  void mover() {
    pos.add(vel);
  }

  void guisanteNormal() {
    fill(0, 220, 0);
    circle(pos.x, pos.y, r);
    damage = 2;
    lentitud = new PVector(1, 0);
  }

  void guisanteHielo() {
    fill(110, 255, 150);
    circle(pos.x, pos.y, r);
    damage = 1;
    lentitud = new PVector(0.5, 0);
  }

  void guisanteFuego() {
    fill(255, 0, 0);
    circle(pos.x, pos.y, r);
    damage = 3;
    lentitud = new PVector(1, 0);
  }

  void mostrar() {
    switch(type) {
    case 2:
      guisanteNormal();
      break;
    case 3:
      guisanteFuego();
      break;
    case 4:
      guisanteHielo();
      break;
    }
  }
}
