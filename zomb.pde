class Zombie {
  PVector pos;
  PVector vel;
  PVector tam;
  int vida;
  int daño;
  int desaparecer;
  int mordisco;
  int type;
  boolean comiendo;
  boolean congelado;
  boolean vivo;
  Temporizador putrefaccion;
  Temporizador come;


  Zombie(int i, int nivel) {
    pos = new PVector(1050, 100 * i);
    vel = new PVector(1, 0);
    tam = new PVector(50, 100);
    type = nivel;

    switch(type) {
    case 1:
      znormalstats();
      break;
    case 2:
      zconostats();
      break;
    case 3:
      zcascostats();
      break;
    }
  }


  void mostrar() {
    switch(type) {
    case 1:
      znormal();
      break;
    case 2:
      zcono();
      break;
    case 3:
      zcasco();
      break;
    }
  }

  void comer () {
    vel.x *= 0;
    come = new Temporizador(1000);
  }

  void dejarDeMover() {
    vel.x *= 0;
    putrefaccion = new Temporizador(desaparecer);
  }

  void mover() {
    if (congelado && vivo && !comiendo) vel.x = 0.5;
    else if (!congelado && vivo && !comiendo) vel.x = 0.75;
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

  void znormal() {
    if (vivo) {
      fill(0, 150, 0);
      rect(pos.x + 15, pos.y, tam.x - 15, tam.y - 60);
      fill(125, 0, 0);
      rect(pos.x, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 50, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 15, pos.y + 40, tam.x - 15, tam.y - 70);
      fill(255, 255, 255);
      rect(pos.x + 25, pos.y + 40, tam.x - 35, tam.y - 70);
      fill(180, 0, 0);
      rect(pos.x + 30, pos.y + 40, tam.x - 45, tam.y - 75);
      fill(0, 0, 140);
      rect(pos.x + 15, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 35, pos.y + 70, tam.x - 35, tam.y - 80);
      fill(100, 100, 100);
      rect(pos.x + 15, pos.y + 90, tam.x - 35, tam.y - 90);
      rect(pos.x + 35, pos.y + 90, tam.x - 35, tam.y - 90);
    } else if (!vivo) {
      fill(0, 150 * putrefaccion.tiempoPrendido(), 0);
      rect(pos.x + 15, pos.y, tam.x - 15, tam.y - 60);
      rect(pos.x, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 50, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 15, pos.y + 40, tam.x - 15, tam.y - 70);
      rect(pos.x + 25, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 30, pos.y + 40, tam.x - 45, tam.y - 75);
      rect(pos.x + 15, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 35, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 15, pos.y + 90, tam.x - 35, tam.y - 90);
      rect(pos.x + 35, pos.y + 90, tam.x - 35, tam.y - 90);
    }
  }

  void zcono() {
    if (vivo) {
      fill (255, 120, 0);
      triangle(pos.x + 15, pos.y + 15, pos.x + tam.x/2 + 10, pos.y - tam.y/4, pos.x + tam.x, pos.y + 15);
      fill(0, 150, 0);
      rect(pos.x + 15, pos.y + 15, tam.x - 15, tam.y - 60);
      fill(125, 0, 0);
      rect(pos.x, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 50, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 15, pos.y + 40, tam.x - 15, tam.y - 70);
      fill(255, 255, 255);
      rect(pos.x + 25, pos.y + 40, tam.x - 35, tam.y - 70);
      fill(180, 0, 0);
      rect(pos.x + 30, pos.y + 40, tam.x - 45, tam.y - 75);
      fill(0, 0, 140);
      rect(pos.x + 15, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 35, pos.y + 70, tam.x - 35, tam.y - 80);
      fill(100, 100, 100);
      rect(pos.x + 15, pos.y + 90, tam.x - 35, tam.y - 90);
      rect(pos.x + 35, pos.y + 90, tam.x - 35, tam.y - 90);
    } else if (!vivo) {
      fill(0, 150 * putrefaccion.tiempoPrendido(), 0);
      triangle(pos.x + 15, pos.y + 15, pos.x + tam.x/2 + 10, pos.y - tam.y/4, pos.x + tam.x, pos.y + 15);
      rect(pos.x + 15, pos.y + 15, tam.x - 15, tam.y - 60);
      rect(pos.x, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 50, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 15, pos.y + 40, tam.x - 15, tam.y - 70);
      rect(pos.x + 25, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 30, pos.y + 40, tam.x - 45, tam.y - 75);
      rect(pos.x + 15, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 35, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 15, pos.y + 90, tam.x - 35, tam.y - 90);
      rect(pos.x + 35, pos.y + 90, tam.x - 35, tam.y - 90);
    }
  }

  void zcasco() {
    if (vivo) {
      fill (50, 50, 50);
      rect(pos.x + 12, pos.y, tam.x - 10, tam.y - 70);
      fill(0, 150, 0);
      rect(pos.x + 15, pos.y + 30, tam.x - 15, tam.y - 60);
      fill(125, 0, 0);
      rect(pos.x, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 50, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 15, pos.y + 40, tam.x - 15, tam.y - 70);
      fill(255, 255, 255);
      rect(pos.x + 25, pos.y + 40, tam.x - 35, tam.y - 70);
      fill(180, 0, 0);
      rect(pos.x + 30, pos.y + 40, tam.x - 45, tam.y - 75);
      fill(0, 0, 140);
      rect(pos.x + 15, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 35, pos.y + 70, tam.x - 35, tam.y - 80);
      fill(100, 100, 100);
      rect(pos.x + 15, pos.y + 90, tam.x - 35, tam.y - 90);
      rect(pos.x + 35, pos.y + 90, tam.x - 35, tam.y - 90);
    } else if (!vivo) {
      fill(0, 150 * putrefaccion.tiempoPrendido(), 0);
      rect(pos.x + 12, pos.y, tam.x - 10, tam.y - 70);
      rect(pos.x + 15, pos.y + 30, tam.x - 15, tam.y - 60);
      rect(pos.x, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 50, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 15, pos.y + 40, tam.x - 15, tam.y - 70);
      rect(pos.x + 25, pos.y + 40, tam.x - 35, tam.y - 70);
      rect(pos.x + 30, pos.y + 40, tam.x - 45, tam.y - 75);
      rect(pos.x + 15, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 35, pos.y + 70, tam.x - 35, tam.y - 80);
      rect(pos.x + 15, pos.y + 90, tam.x - 35, tam.y - 90);
      rect(pos.x + 35, pos.y + 90, tam.x - 35, tam.y - 90);
    }
  }

  void znormalstats() {
    vida = 30;
    daño = 1;
    desaparecer = 2000;
    mordisco = 1000;
    vivo = true;
    congelado = false;
  }

  void zconostats() {
    vida = 40;
    daño = 3;
    desaparecer = 2000;
    mordisco = 1000;
    vivo = true;
    congelado = false;
  }

  void zcascostats() {
    vida = 30;
    daño = 5;
    desaparecer = 2000;
    mordisco = 1000;
    vivo = true;
    congelado = false;
  }
}
