
class Circle{
  Coord center;
  color c;
  float radius = 5, alpha = 255;
  boolean flag;
  Circle(Coord _center, color _c){
     center = _center;
     c = _c;
  }
  
  void setFlag(){
    flag = true;
  }
  
  void display(){
     fill(background_c, alpha);
     stroke(c,alpha);
     ellipse(center.x, center.y, radius, radius);
     spread();
  }
  
  void spread(){
    if(alpha>0){
        if(!flag){
          radius++;
          alpha--;
        }else{
          alpha--;
        }
    }
  }
}