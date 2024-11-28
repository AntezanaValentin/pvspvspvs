class CortaPasto {
  PVector pos;
  PVector tam;
  PVector vel;

  CortaPasto(float x, float y) {
    pos = new PVector(x, y);
    tam = new PVector(100, 100);
    vel = new PVector(0, 0);
  }

  void mover() {
    pos.add(vel);
  }

  boolean pisaPiqueteros(PVector otro) {
    if (otro.x <= pos.x + 100 && otro.y == pos.y) {
      vel.x = 10;
      return true;
    } else
      return false;
  }

  void mostrar() {
    fill(255, 0, 0);
    rect(pos.x + 20, pos.y + 60, tam.x-40, tam.y - 70);
    triangle(pos.x + 80, pos.y + 90, pos.x + 80, pos.y + 60, pos.x + 100, pos.y + 90);
    fill(50, 50, 50);
    circle(pos.x + 20, pos.y + 90, 20);
    circle(pos.x + 80, pos.y + 90, 20);
    fill(100, 100, 100);
    circle(pos.x + 20, pos.y + 90, 10);
    circle(pos.x + 80, pos.y + 90, 10);
    rect(pos.x + 20, pos.y + 10, 10, tam.y - 50);
    rect(pos.x + 40, pos.y + 50, tam.x-80, tam.y - 90);
  }
}
