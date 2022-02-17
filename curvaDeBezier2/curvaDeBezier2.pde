float t;
boolean indo1, indo2, indo3;
int x, y, x2, y2,a,b,a2,b2;

void setup() {
  size(600, 420);
  x = 50;
  y = 400;
}

void draw() {
  background(250,245,245);
    fill(19,42,87);
rect(0,215,width,height);
  movLinear();
  movBezier();
  
  a = int(map(y,400,248,200,50));
  noStroke();
  fill(21, 245, 172);
  ellipse(width/3,a,30,30);
  
  a2 = int(map(y2,400,227,200,50));
   fill(185, 115, 230);
  ellipse(width/1.5,a2,30,30);
  
  

  t = (frameCount/250.0%1);
  

}


//primeiramente fiz a bola se mover, depois fiz linhas que se conectam nos pontos onde a bola muda de direção
void movLinear() {
  if (x <= 200 && y >= 50) {
    x = x +2;
    y = y -2;
  } else {
    x = x +2;
  }
  if (x >= 400 && y >= 50) {
    y = y +2;
  }
  if (x >= 550) {
    x = 50;
    y = 400;
  }

  stroke(21, 245, 172);
  strokeWeight(5);
  line(50, 400, 200, 248);
  line(200, 248, 400, 248);
  line(400, 248, 550, 400);


  noStroke();
  fill(21, 245, 172);
  ellipse(x, y, 20, 20);
}


/*movimenta a elipse em cima da curva bézier, a posição X e Y da elipse é determinada pelos
pontos da curva, através da função bezierPoint()
*/

void movBezier() {
  noFill();
  stroke(185, 115, 230);
  bezier(50, 400, 130, 170, 470, 170, 550, 400);
  x2 = (int)bezierPoint(50, 150, 450, 550, t);
  y2 = (int)bezierPoint(400, 170, 170, 400, t);
  fill(185, 115, 230);
  noStroke();
  ellipse(x2, y2, 20, 20);
  
  println(bezierPoint(50, 150, 450, 550, 0.5));
}
