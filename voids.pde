Temporizador tempZomb = new Temporizador(10000);
Temporizador tempSol = new Temporizador(10000);
Temporizador tempMordisco = new Temporizador(1000);
Boolean isSeleccionada = false;
Carta cartaSeleccionada;
Planta cuandoArrastro;


void mousePressed() {
  if (estado > 2) {
    int mx = mouseX;
    int my = mouseY;
    isSeleccionada = false;
    cartaSeleccionada = null;
    cuandoArrastro = null;
    for (Carta c : cartas) {
      if (mx > c.pos.x &&
        mx < c.pos.x + c.tam.x &&
        my > c.pos.y &&
        my < c.pos.y + c.tam.y) {
        cartaSeleccionada = c;
        isSeleccionada = true;
      }
    }


    for (Sol s : soles) {
      if (mouseX <= s.pos.x + (s.r/2) &&
        mouseX >= s.pos.x - (s.r/2) &&
        mouseY <= s.pos.y + (s.r/2) &&
        mouseY >= s.pos.y - (s.r/2)) {
        float distancia = s.pos.x - 25;
        s.agarrado(distancia);
      }
    }
  } else if (estado == 1) {
    if (mouseX >= width/2 - 50 && mouseX <= width/2 + 50 && mouseY >= height/2 - 20 && mouseY <= height/2 + 20) estado = 2;
  } else if (estado == 2) {
    if (mouseX >= width/2 - 200 && mouseX <= width/2 - 100 && mouseY >= height/2 - 20 && mouseY <= height/2 + 20) estado = 3;
    else if (mouseX >= width/2 - 50 && mouseX <= width/2 + 50 && mouseY >= height/2 - 20 && mouseY <= height/2 + 20) estado = 4;
    else if (mouseX >= width/2 + 100 && mouseX <= width/2 + 200 && mouseY >= height/2 - 20 && mouseY <= height/2 + 20) estado = 5;
  }
}

void mouseReleased() {
  if (estado > 1) {
    PVector mouse = new PVector(mouseX, mouseY);
    if (isSeleccionada == true) {
      cuandoArrastro.mostrar();

      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 5; j++) {
          if (mouse.x > baldosa[i][j].pos.x &&
            mouse.x < baldosa[i][j].pos.x + baldosa[i][j].tam.x &&
            mouse.y > baldosa[i][j].pos.y &&
            mouse.y < baldosa[i][j].pos.y + baldosa[i][j].tam.y && baldosa[i][j].plantado == false && points - cartaSeleccionada.coste >= 0) {
            plantas.add(new Planta(baldosa[i][j].pos, cartaSeleccionada.lvl));
            baldosa[i][j].plantado = true;
            int a = plantas.size() - 1;
            Planta p = plantas.get(a);
            points -= p.costo;
          } else if (mouse.x > baldosa[i][j].pos.x &&
            mouse.x < baldosa[i][j].pos.x + baldosa[i][j].tam.x &&
            mouse.y > baldosa[i][j].pos.y &&
            mouse.y < baldosa[i][j].pos.y + baldosa[i][j].tam.y && baldosa[i][j].plantado == true || cartaSeleccionada.coste - points <= 0) {
            println("Ocupado");
          }
          isSeleccionada = false;
        }
      }
    }
    cartaSeleccionada = null;
    cuandoArrastro = null;
  }
}

void creaGuisantes() {
  for (Planta p : plantas) {
    if (p.crea.elTiempoPaso() && p.type > 1) {
      p.crea.actualizarVariables();
      for (Zombie z : zombies) {
        if (z.pos.x <= width && z.pos.x + z.tam.x >= p.pos.x && z.pos.y == p.pos.y - 30) guisantes.add(new Guisante(p.pos, p.type));
      }
    }
  }
}

void creaSoles() {
  for (Planta pS : plantas) {
    if (pS.crea.elTiempoPaso() && pS.type == 1) {
      pS.crea.actualizarVariables();
      soles.add(new Sol(pS.pos));
    }
  }
  if (tempSol.elTiempoPaso()) {
    tempSol.actualizarVariables();
    soles.add(new Sol());
  }
}

void colisionGuisZomb() {
  for (int i = guisantes.size() - 1; i >= 0; i--) {
    Guisante g = guisantes.get(i);
    if (g.pos.x - g.r/2 >= width)
      guisantes.remove(g);
  }
  for (int i = zombies.size() - 1; i >= 0; i--) {
    Zombie z = zombies.get(i);
    for (int j = guisantes.size() - 1; j >= 0; j--) {
      Guisante g = guisantes.get(j);
      if (g.pos.x >= z.pos.x  && g.pos.x <= z.pos.x + z.tam.x && g.pos.y - 35 == z.pos.y) {
        if (g.type ==  4 && z.vivo) z.congelado = true;
        if (z.vida >= 0) {
          z.vida -= g.damage;
        }
        guisantes.remove(g);
      }
    }
  }
}

void etapasDeZombie() {
  for (Zombie z : zombies) {
    if (z.vida <= 0 && z.vivo) {
      z.vivo = false;
      z.dejarDeMover();
    }
  }
}

void desaparecen() {
  for (int i = zombies.size() - 1; i >= 0; i--) {
    Zombie z = zombies.get(i);
    if (!z.vivo && z.putrefaccion.elTiempoPaso()) {
      zombies.remove(z);
    }
  }
}

void sistSoles() {
  for (int i = soles.size() - 1; i >= 0; i--) {
    Sol s = soles.get(i);
    if (s.pos.x <= 50 && s.pos.y <= 50) {
      soles.remove(s);
      points += 25;
    }
    if (s.cuantoVive.elTiempoPaso()) {
      s.cuantoVive.actualizarVariables();
      soles.remove(s);
    }
  }
}

void creaZombies() {
  if (tempZomb.elTiempoPaso() && millis() >= 10000) {
    tempZomb.actualizarVariables();
    zombies.add(new Zombie(int(random(1, 6)), estado-2));
  }
}

void lasPlantasSiendoComidasPorZombie() {
  for (int i = plantas.size() - 1; i >= 0; i--) {
    Planta p = plantas.get(i);
    for (Zombie z : zombies) {
      if (z.comiendo(p.pos)) {
        z.comer();
        if (tempMordisco.elTiempoPaso()) {
          tempMordisco.actualizarVariables();
          p.vida -= z.daño;
        }
      } else {
        z.come = null;
      }
    }
    if (p.vida <= 0) {
      for (int j = 0; j < 9; j++) {
        for (int k = 0; k < 5; k++) {
          if (baldosa[j][k].pos == p.pos) {
            baldosa[j][k].plantado = false;
          }
        }
      }
      plantas.remove(p);
      for (Zombie z : zombies)
        z.comiendo = false;
    }
  }
}


void sistCortapastos() {
  for (CortaPasto cyp : cortapastos) {
    for (Zombie z : zombies) {
      if (cyp.pisaPiqueteros(z.pos)) {
        z.vivo = false;
        z.dejarDeMover();
      }
    }
  }

  for (int i = cortapastos.size() - 1; i >= 0; i--) {
    CortaPasto cp = cortapastos.get(i);
    if (cp.pos.x >= width - 50) cortapastos.remove(cp);
  }
}

void sistBaldosas() {
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 5; j++) {
      baldosa[i][j].mostrar();
    }
  }
}

void cartasDisponibles() {
  for (int i = 1; i <= 4; i++) {
    cartas.add(new Carta(i));
  }
  for (Carta c : cartas) {
    plantasParaElegir.add(new Planta(c.pos, c.lvl));
  }
}


void actualizarCartasyPlantas() {
  fill(139, 69, 19);
  rect(0, 0, 500, 100);
  for (Carta c : cartas) {
    c.mostrar();
  }
  for (Planta p : plantasParaElegir) {
    p.mostrar();
  }
}

void mostrarTodo() {

  sistBaldosas();

  for (Guisante g : guisantes) {
    g.mover();
    g.mostrar();
  }
  for (Planta p : plantas) {
    p.mostrar();
  }
  for (Zombie z : zombies) {
    z.mover();
    z.mostrar();
  }
  for (CortaPasto cp : cortapastos) {
    cp.mover();
    cp.mostrar();
  }
  PVector mouse = new PVector(mouseX - 47, mouseY - 30);

  if (isSeleccionada == true) {
    for (Carta c : cartas) {
      cuandoArrastro = new Planta(mouse, c.lvl);
    }
  }

  for (Sol s : soles) {
    s.mover();
    s.mostrar();
  }
}

void inicio() {
  background(0, 150, 0);
  textSize(100);
  textAlign(CENTER);
  fill(0, 0, 0);
  text("Plantaversusonvi", width/2, height/2 - 100);
  fill(160, 0, 0);
  rect(width/2 - 50, height/2 - 20, 100, 60);
  fill(25, 25, 25);
  textSize(30);
  text("Jugar", width/2, height/2 + 20);
}

void niveles() {
  background(0, 150, 0);
  textSize(100);
  textAlign(CENTER);
  fill(0, 0, 0);
  text("Niveles", width/2, height/2 - 100);


  fill(160, 0, 0);
  rect(width/2 - 200, height/2 - 20, 100, 60);
  fill(25, 25, 25);
  textSize(30);
  text("Nivel 1", width/2 - 150, height/2 + 20);


  fill(160, 0, 0);
  rect(width/2 - 50, height/2 - 20, 100, 60);
  fill(25, 25, 25);
  textSize(30);
  text("Nivel 2", width/2, height/2 + 20);

  fill(160, 0, 0);
  rect(width/2 + 100, height/2 - 20, 100, 60);
  fill(25, 25, 25);
  textSize(30);
  text("Nivel 3", width/2 + 150, height/2 + 20);
}

void juego() {
  background(150, 150, 150);
  actualizarCartasyPlantas();
  sistBaldosas();
  sistCortapastos();
  creaGuisantes();
  creaSoles();
  creaZombies();
  sistSoles();
  lasPlantasSiendoComidasPorZombie();
  colisionGuisZomb();
  etapasDeZombie();
  desaparecen();
  mostrarTodo();
  fill(255);
  textSize(40);
  textAlign(LEFT);
  text(points, 30, 60);
  for (Zombie z : zombies) {
    if (z.pos.x <= -50) {
      estado = 6;
    }
  }
}
void perder() {
  background(100, 0, 0);
  textSize(100);
  textAlign(CENTER);
  text("PERDISTE", width/2, height/2);
}
