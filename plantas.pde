class Planta {
  PVector pos;
  PVector tam;
  int type;
  int creaObj;
  int vida;
  int costo;
  Temporizador crea;

  Planta(PVector otro, int tipo) {
    pos = new PVector(otro.x + 47, otro.y + 30);
    tam = new PVector(6, 60);
    type = tipo;
    switch(type) {
    case 1:
      girasol();
      break;
    case 2:
      lanzaGuisante();
      break;
    case 3:
      lanzaGuisanteF();
      break;
    case 4:
      lanzaGuisanteH();
      break;
    }
    crea = new Temporizador(creaObj);
  }

  void mostrar() {
    switch(type) {
    case 1:
      mostrarGir();
      break;
    case 2:
      mostrarLG();
      break;
    case 3:
      mostrarLGF();
      break;
    case 4:
      mostrarLGH();
      break;
    }
  }

  void mostrarLG() {
    fill(0, 255, 0);
    rect(pos.x, pos.y, tam.x, tam.y);
    fill(0, 150, 0);
    rect(pos.x - 22, pos.y + 55, 50, 6);
    fill(0, 255, 0);
    rect(pos.x, pos.y - 5, 40, 20);
    fill(0, 230, 0);
    circle(pos.x + 3, pos.y, 40);
  }

  void mostrarLGF() {
    fill(0, 255, 0);
    rect(pos.x, pos.y, tam.x, tam.y);
    fill(0, 150, 0);
    rect(pos.x - 22, pos.y + 55, 50, 6);
    fill(200, 0, 0);
    rect(pos.x, pos.y - 5, 40, 20);
    fill(240, 0, 0);
    circle(pos.x + 3, pos.y, 40);
  }

  void mostrarLGH() {
    fill(0, 255, 0);
    rect(pos.x, pos.y, tam.x, tam.y);
    fill(0, 150, 0);
    rect(pos.x - 22, pos.y + 55, 50, 6);
    fill(100, 255, 190);
    rect(pos.x, pos.y - 5, 40, 20);
    fill(120, 255, 190);
    circle(pos.x + 3, pos.y, 40);
  }

  void mostrarGir() {
    fill(0, 255, 0);
    rect(pos.x, pos.y, tam.x, tam.y);
    fill(0, 150, 0);
    rect(pos.x - 22, pos.y + 55, 50, 6);
    fill(230, 230, 0);
    circle(pos.x + 3, pos.y, 50);
    fill(180, 120, 0);
    circle(pos.x + 3, pos.y, 30);
  }

  void lanzaGuisante() {
    vida = 10;
    creaObj = 1500;
    costo = 75;
    type = 2;
  }

  void lanzaGuisanteH() {
    vida = 12;
    creaObj = 1500;
    costo = 100;
    type = 3;
  }

  void lanzaGuisanteF() {
    vida = 15;
    creaObj = 1500;
    costo = 100;
    type = 4;
  }

  void girasol() {
    vida = 8;
    creaObj = 10000;
    costo = 25;
    type = 1;
  }

}
