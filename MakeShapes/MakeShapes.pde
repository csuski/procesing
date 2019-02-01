// Press a key to change shape
// unknown key shows help
// text fades after 5 seconds
  
  
  
// Run the code at the full dimensions of the screen currently
// selected inside the Preferences window

int x = 0;
int y = 0;


void setup() {
  //size(600,400);
  fullScreen();
  background(0);

}

void draw() {
  fill(random(0, 255),random(0, 255),random(0, 255));
  makeRect();
  delay(50);
}


void mousePressed() {
  stroke(random(0, 255),random(0, 255),random(0, 255));
  fill(random(0, 255),random(0, 255),random(0, 255));
  makeLine();
}


void keyPressed() {
  if (key == 's') {
    save("test" + millis() + ".jpg");
  }
}

void makeRect() {
  rect(mouseX, mouseY, 20, 20); 
}

void makeLine() {
   line(mouseX, mouseY, mouseX + 20, mouseY + 20); 
}

void makeArc() {
   arc(mouseX, mouseY, 20, 20, 0, HALF_PI); 
}

void makeCircle() {
  ellipse(mouseX, mouseY, 20, 20);
  
}

void makePoint() {
   point(mouseX, mouseY);  
}
