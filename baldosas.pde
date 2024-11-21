class Baldosa {
  PVector pos;
  PVector tam;
  Boolean plantado;
  
  Baldosa(PVector otro){
    pos = new PVector(100 + otro.x,100 + otro.y);
    tam = new PVector(100,100);
    plantado = false;
  }
  
  boolean libre(PVector otro) {
    if(otro.x - 25 == pos.x && otro.y - 10 == pos.y) return true;
    else return false;
  }
  
  void mostrar() {
    fill(20,100,25);
    rect(pos.x, pos.y, tam.x, tam.y);
  }
}
