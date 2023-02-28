class segment{
  PVector start;
  PVector end;
  float offset;
  
  //constructor
  segment(PVector s, PVector e, float o){
    start = s;
    end = e;
    offset = o;
  }
  
  PVector midpoint(){
    float X = ((start.x+end.x)/2)+random(-offset,offset);
    float Y = ((start.y+end.y)/2)+random(-offset,offset);
    PVector mid = new PVector(X,Y);
    return(mid);
  }
  
  float findAngle(){//calculating angle is wrong
    float X = start.x-end.x;
    float Y = start.y-end.y;
    float theta = atan2(Y,X);
    float offset = radians(random(-5,5));
    theta += offset;
    if (theta < 0){
     theta = 360+theta; 
    }
    return theta;
  }
  
  float findLength(){
    float X = abs(start.x-end.x);
    float Y = abs(start.y-end.y);
    float distance = sqrt(X*X+Y*Y);
    return distance;
  }
  
  void showGlow(){
  
    //glow
    stroke(glow);
    strokeWeight(10);
    line(start.x,start.y,end.x,end.y);
  }
  
  void showCore(){
    //core
    stroke(white);
    strokeWeight(2);
    line(start.x,start.y,end.x,end.y);
  }
  
  
}
