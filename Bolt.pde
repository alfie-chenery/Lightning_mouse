class Bolt{
  ArrayList<segment> parts;
  ArrayList<segment> prev;
  int iterations;
  int iter;
  PVector source;
  PVector goal;
  float offset;
  int age;
  
  Bolt(float X, float Y){
    parts = new ArrayList();
    prev = new ArrayList();
    
    iterations = 3;
    iter = 0;
    offset = 25;
    age = int(random(0,life));

    source = new PVector(width/2,height/2);
    goal = new PVector(X,Y);
  
    segment direct = new segment(source,goal,offset);
    parts.add(direct);
    
    
    //generate points
    //offset -= (25/iterations); //decrease random offset with each iteration
    while (iter<iterations){
      iter++;
      //clone parts to prev
      prev.clear();
      for(int i=0; i<parts.size(); i++){
        prev.add(i,parts.get(i));
      }
      parts.clear();
      for(segment s : prev){
        PVector split = s.midpoint();
        segment halfone = new segment(s.start,split,offset);
        segment halftwo = new segment(split,s.end,offset);
        parts.add(halfone);
        parts.add(halftwo);
        
        //float chance = random(3);//change 3 to affect prob of branch occuring
        //if(chance<=1){//~1 in 3 chance of branch occuring
        //  float theta = halfone.findAngle(); //calculating angle is wrong
        //  PVector shoot = PVector.fromAngle(theta);
        //  float size = halfone.findLength();
        //  float magnitude = random(0.6*size,0.9*size);
        //  shoot.setMag(magnitude);
        //  PVector branchEnd = split.add(shoot);
        //  segment branch = new segment(split,branchEnd);
        //  parts.add(branch);
        //}  
        
      }
    }
  }
  
  void show(){
    for(segment i : parts){
      i.showGlow();
    }
    for(segment i : parts){
      i.showCore();
    }
  }
  
  
}
