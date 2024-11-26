class Zombie {
  PVector pos;
  PVector vel;
  PVector tam;
  int vida;
  int daño;
  int desaparecer;
  int mordisco;
  boolean comiendo;
  boolean congelado;
  boolean vivo;
  Temporizador putrefaccion;
  Temporizador come;
  Zombie(int i) {
    pos = new PVector(1050, 100 * i);
    vel = new PVector(1, 0);
    tam = new PVector(50, 100);
    vida = 30;
    daño = 1;
    desaparecer = 2000;
    mordisco = 1000;
    vivo = true;
    congelado = false;
  }

  void comer () {
    vel.x *= 0;
    come = new Temporizador(mordisco);
  }

  void dejarDeMover() {
    vel.x *= 0;
    putrefaccion = new Temporizador(desaparecer);
  }

  void mover() {
    if (congelado && vivo && !comiendo) vel.x = 0.5;
    else if (!congelado && vivo && !comiendo) vel.x = 1;
    pos.sub(vel);
  }

  boolean comiendo(PVector otro) {
    if (otro.x + 20 >= pos.x && otro.x <= pos.x && otro.y - 30 == pos.y) {
      comiendo = true;
      comer();
      return true;
    } else
      return false;
  }

  void mostrar() {
    fill(0, 150, 0);
    if (!vivo) fill(0, 150 * putrefaccion.tiempoPrendido(), 0);
    rect(pos.x, pos.y, tam.x, tam.y);
  }
}
