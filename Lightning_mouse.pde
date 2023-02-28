int life = 5; //average number of frames bolt lasts for
int N = 1;
color glow = color(100,50,255); //alpha 75
color white;

boolean rainbow_mode = false;
float speed = 0.1;
float Hue = 0;

ArrayList<Bolt> bolts;

void setup(){
  size(850,850);
  
  bolts = new ArrayList<Bolt>();
  
  if(rainbow_mode){
    colorMode(HSB,120);
    glow = color(Hue,120,120);
    white = color(0,0,120);
  }else{
    white = color(255); 
  }

}

void draw(){
  background(0);
  
  if(mousePressed){
    for (int i=0; i<N; i++){
      Bolt b = new Bolt(mouseX,mouseY);
      bolts.add(b);
    }
  }
  
  for(int i=0;i<bolts.size();i++){
    if(bolts.get(i).age<life){
      bolts.get(i).show();
      bolts.get(i).age++;
    }else{
      bolts.remove(i);
    }
  }
  
  if(rainbow_mode){
    Hue+=speed;
    glow = color(Hue,120,120);
    if (Hue >= 120){
      Hue = 0; 
    }
  }
}
