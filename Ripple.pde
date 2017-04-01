class Ripple{
  ArrayList<Circle> circles;
  color c;
  int timer = 0;
  boolean flag = false;
  Coord center;
  Ripple(Coord _center){
    center = _center;
    circles = new ArrayList<Circle>();
    circles.add(new Circle(center, c));
    strokeWeight(5);
    smooth();
    c = color(random(150,255),random(150,255),random(150,255));
  }
  
  void display(){
    for(Circle c:circles)
        c.display();
        
     if(!flag)
       generateCircle();
  }
  
  void generateCircle(){
    if(timer++ % 20 == 0)
      circles.add(new Circle(center, c));
  }
  
  void disappear(){
    flag = true;
    for(Circle c:circles)
      c.setFlag();
  }
  
  Circle boundary(){
     return circles.get(0);
  }
  
  float getInnerAlpha(){
    return circles.get(circles.size()-1).alpha;
  }
}