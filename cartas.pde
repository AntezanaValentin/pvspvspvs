class Carta {
  PVector pos;
  PVector tam;
  int lvl;
  int coste;  

  Carta(int i) {
    pos = new PVector(100 * i, 0);
    tam = new PVector(100, 100);
    lvl = i;
    if(i == 1) coste = 25;
    else if (i == 2) coste = 75;
    else if (i == 3 || i == 4) coste = 100;
}

  void mostrar() {
    fill(50 * lvl, 51, 10);
    rect(pos.x + 10, pos.y + 10, tam.x - 20, tam.y - 20);
  }
}
