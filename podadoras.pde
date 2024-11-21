class CortaPasto {
  PVector pos;
  PVector tam;
  PVector vel;
  
  CortaPasto(float x, float y) {
    pos = new PVector(x,y);
    tam = new PVector(100,100);
    vel = new PVector(0,0);
  }
  
  void mover() {
    pos.add(vel);
  }
  
  boolean pisaPiqueteros(PVector otro) {
    if(otro.x <= pos.x + 100 && otro.y == pos.y) {
      vel.x = 10;
      return true;
    }
    else 
    return false;
  }
  
  void mostrar() {
    fill(255,0,0);
    rect(pos.x, pos.y,tam.x,tam.y);
  }
  
}
