ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() 
{
  fullScreen();
  noStroke();
  frameRate(30);
  // Set the starting position of the shape
  balls.add(new Ball(width/2, height/2));
}

void draw() 
{
  background(0);
  for(int i =0; i < balls.size(); i++) {
    Ball b1 = balls.get(i);
    for(int j = 0; j< balls.size(); j++) {
      if(i == j) continue;
      Ball b2 = balls.get(j);  
      if(b1.CheckCollision(b2)) {
        continue;
        //b1.GetAngle(b2);
        //b1.ReverseDirection();
      }
      
    }
    
  }
  
  for (Ball b : balls) {
    b.Update();
    b.Draw();
  }
  
   //<>//
 
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY));
}

void keyPressed() {
  if (key == ' ') {
    balls.clear();
  }
}
