float d = 1; // drag
float g = 1; // gravity
float f = 1.3; // bounce friction
float rr = 1.005; // rolling resistance
PVector v1, vg; // impulse dir
PVector pos;
PVector start;

void setup(){
  size(640,360);
  background(51);
  start = new PVector(width/2, height/8);
  v1 = PVector.random2D().mult(10);
  vg = new PVector(0, .98);
  pos = start;
}

void draw() {
  background(51);
 
  v1.mult(d);
  v1.add(vg);
  
  pos.add(v1);
  
  if (pos.y > height - 16){
    pos.y = height - 16;
    v1.y *= -1 / f;
    v1.x /= rr;
  }
  if (pos.y <= 16){
    pos.y = 16;
    v1.y *= -1 / f;
    v1.x /= rr;
  }
  if (pos.x > width - 16){
    pos.x = width - 16;
    v1.x *= -1 / f;
    v1.y /= rr;
  }
  if (pos.x < 16){
    pos.x = 16;
    v1.x *= -1 / f;
    v1.y /= rr;

}

  stroke(0);
  fill(175);
  ellipse(pos.x,pos.y,16,16);
}