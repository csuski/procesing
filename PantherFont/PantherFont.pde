PFont f;
PFont f2;
int Y_AXIS = 1;
int X_AXIS = 2; 
void setup() {
  fullScreen();
  f = createFont("BEYNO.ttf", 200);
  f2 = createFont("ModernWakandan-Bold.ttf", 200);
  textAlign(CENTER, CENTER);
}

color b1 = color(45, 125, 172);
color b2 = color(186,33,249);
boolean wakandan = true;

void draw() {
  
  setGradient(0, 0, width, height, b1, b2, X_AXIS);
  int heightbuffer = 0;
  if(wakandan) {
    textFont(f2);
    heightbuffer = -8;
  }
  else {
    textFont(f);
  }
  text("Black Panther", width/2, height/2+heightbuffer); 
}




void mouseClicked() {
  wakandan = !wakandan;
  delay(100);
  int heightbuffer = 0;
  if(wakandan) {
    textFont(f2);
    heightbuffer = -8;
  }
  else {
    textFont(f);
  }
  text("Black Panther", width/2, height/2+heightbuffer); 
  delay(100);
}


void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
  
}
  
