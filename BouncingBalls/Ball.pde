class Ball {
  float size = 6;        // Width of the shape
  float xpos, ypos;    // Starting position of shape    

  float xspeed = 5.8;  // Speed of the shape
  float yspeed = 5.2;  // Speed of the shape
  float r, g, b;
  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom
  
  Ball(int x, int y) {
    xpos = x;
    ypos = y;
    xspeed = random(0, 10);
    yspeed = random(0, 10);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    size = random(1, 26);
    if((int)random(0, 2) == 0) {
      xdirection = -1;
    }
    if((int)random(0, 2) == 0) {
      ydirection = -1;
    }
    
    // This prevents balls from being trapped on the side
    // but it is cool to leave this commented out and click on the end */
    if (xpos > width-size) {
      xpos -= size;
    }
    else if(xpos < size) {
      xpos += size;
    }
    if (ypos > height-size)
    {
      ypos -= size;
    }
    else if(ypos < size) {
      ypos += size;
    }
  }
  
  public void Update() {
    if(collidingBall != null) {
      // Don't move, just reverse direction
      ReverseDirection();
      
      collidingBall = null;
      return;
    }
    
    // Update the position of the shape
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
    
      // Test to see if the shape exceeds the boundaries of the screen
    // If it does, reverse its direction by multiplying by -1
    if (xpos > width-size || xpos < size) {
      xdirection *= -1;
    }
    if (ypos > height-size || ypos < size) {
      ydirection *= -1;
    }
  }
  
  Ball collidingBall = null;
  
  public boolean CheckCollision(Ball b) {
    // check the position after one more step forward
    float nextX = xpos + ( xspeed * xdirection );
    float nextY = ypos + ( yspeed * ydirection );
    
    float nextDistance = dist(nextX, nextY, b.xpos, b.ypos);
    float distance = dist(xpos, ypos, b.xpos, b.ypos);
    boolean collision = nextDistance < (size + b.size) && nextDistance < distance;
    if(collision) {
      collidingBall = b;
    }
    return collision; 
  }
  
  public void GetAngle(Ball b) {
    PVector v1 = new PVector(xpos, ypos);
    PVector v2 = new PVector(b.xpos, b.ypos); 
    float a = PVector.angleBetween(v1, v2);
    println(degrees(a));
  }
  
  public void ReverseDirection() {
    xdirection *= -1;
    ydirection *= -1;
  }
  
  public void Draw() {
      // Draw the shape
      stroke(r, g, b);
      fill(r, g, b);
    ellipse(xpos, ypos, size, size);
  }
  
}
