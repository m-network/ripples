ArrayList<Ripple>ripples;

color background_c = color(0);

void setup(){
  size(1000,600);
  smooth();
  ripples = new ArrayList<Ripple>();
}

void draw(){
  background(background_c);
  for(Ripple r:ripples)
    r.display();
  checkCollision();
  removeFinishedRipple();
  fill(color(255,0,0));
}

void keyPressed(){
   generateRipple();
}

void mousePressed(){
  Coord center = new Coord(mouseX,mouseY);
  ripples.add(new Ripple(center));
}

void removeFinishedRipple(){
  for(int i = 0; i<ripples.size(); i++){
    if(ripples.get(i).getInnerAlpha() <= 0){
        ripples.remove(i--);
    }
  }
}

void generateRipple(){
  int offset = 50;
  Coord center = new Coord(random(offset+(width-offset)),random(offset+(height-offset)));
  ripples.add(new Ripple(center));
}

void checkCollision(){
  for(int i = 0; i<ripples.size(); i++){
     float rad = ripples.get(i).boundary().radius;
     Coord c = ripples.get(i).center;
     for(int j = 0; j<ripples.size(); j++){
        if(i != j && !ripples.get(i).flag && !ripples.get(j).flag){
         float rad1 = ripples.get(j).boundary().radius;
         Coord c1 = ripples.get(j).center;
         float dist = sqrt(sq(c.x-c1.x)+sq(c.y-c1.y))*2;
         if(dist <= rad1+rad){
           // Collision 
            println("Radius1: "+rad1);
            println("Radius: "+rad);
            println("Distance: "+dist);
            ripples.get(i).disappear();
            ripples.get(j).disappear();
         }
        }
     }
  }
}


boolean withinRange(float x, float y, float range){
  return (x >= y-range && x <= y+range);
}