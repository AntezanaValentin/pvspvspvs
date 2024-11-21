class Particula {
  PVector pos, vel;
  float r, dur, durM;
  int col1, col2, col3;//diferentes colores rgb dependiendo de la Particula
  Particula (Guisante g, Zombie z) {//cuando los M chocan entre si
    float l = g.r/(g.r+z.tam.x);//no hace falta que entiendas esto, funciona y punto. solo dios sabe que es esto
    pos = PVector.lerp(g.pos, z.pos, l);
    vel = new PVector(random(-1, 1), random(-1, 1));
    r = 3;//radio de la Particula
    dur = 255;//dur siempre tiene que ser 255
    durM = 5;//esto es lo que se le va a restar al dur, la P desaparece al llegar dur <= 0
    col1 = 255;
    col2 = 255;
    col3 = 255;
  }
  
  Particula(Guisante g) {//cuando un M es destruido
    pos = g.pos.copy();
    vel = new PVector(random(-1, 1), random(-1, 1));
    r = 4;//radio de la Particula
    dur = 255;//dur siempre tiene que ser 255
    durM = 5;//esto es lo que se le va a restar al dur, la P desaparece al llegar dur <= 0
    col1 = 255;
    col2 = 255;
    col3 = 255;
  }
  
  void mostrar() {
    push();
    noStroke();
    fill(col1, col2, col3, dur);
    circle(pos.x, pos.y, r);
    pop();
    dur -= durM;//se le resta poco de tanto a tanto para que "desaparezcan" de tanto a tanto
  }
  void mover() {
    pos.add(vel);//se mueve la P
  }
}
