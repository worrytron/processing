float i = 50; // initial force
float d = 1; // atmospheric drag
float g = .98; // gravity
float f = 1.3; // bounce friction
float rr = 1.005; // rolling resistance
PVector v1, vg; // impulse direction & gravity vector
PVector pos; // current position


void setup(){
  size(640,360);
  background(51);
  pos = new PVector(width/2, height/8);
  v1 = PVector.random2D().normalize().mult(i);
  vg = new PVector(0, g);
} //<>//

void draw() {
  background(51);
 
  v1.div(d);
  v1.add(vg);
  
  pos.add(v1);
  
  if (pos.y > height - 16){
    pos.y = height - 16;
    v1.y *= -1/f;
    v1.x /= rr;
  }
  if (pos.y <= 16){
    pos.y = 16;
    v1.y *= -1/f;
    v1.x /= rr;
  }
  if (pos.x > width - 16){
    pos.x = width - 16;
    v1.x *= -1/f;
    v1.y /= rr;
  }
  if (pos.x < 16){
    pos.x = 16;
    v1.x *= -1/f;
    v1.y /= rr;
}

  stroke(0);
  fill(175);
  ellipse(pos.x,pos.y,16,16);
}


void mouseClicked(){ //<>//
  pos.x = width/2;
  pos.y = height/8;
  v1 = PVector.random2D().normalize().mult(i);
}