ArrayList<Dyr> ark = new ArrayList<Dyr>();

int timer = 0;

void setup(){
  surface.setResizable(true);
  size(1920,1080);
}

void draw(){
  background(55,140,75);
  
  //hegn
  rectMode(CENTER);
  noFill();
  strokeWeight(10);
  rect(width/3+50, height/3, 300,300,50);
  rect(width/3*2+50, height/3,300,300,50);
  rect(width/3+50, height/3*2,300,300,50);
  rect(width/3*2+50, height/3*2,300,300,50);
  strokeWeight(2);
  rectMode(CORNER);
  
  for(Dyr a: ark){
  a.display();
  a.move();
  }
  fill(255);
  text("Tryk 1 for ko, tryk 2 for gris, tryk 3 for hest, tryk 4 for får", 10,10);
  text("Tryk mellemrum for larm",10,20);
  timer--;
  
  if(ark.size() > 40)
  ark.remove(0);
  
}

void keyPressed(){
  Dyr d;
  if(key=='1'){d = new Ko();ark.add(d);}
  if(key=='2'){d = new Gris(20);ark.add(d);}
  if(key=='3'){d = new Hest(10);ark.add(d);}
  if(key=='4'){d = new For(30);ark.add(d);}
  if(key==' '){for(Dyr a: ark){a.larm();}}
  
}

class Dyr{
float x = random(0,width),y = random(0,height);
float hjorneX = 100, hjorneY = 100;
int l,i;
String lyd;
float B;
int dirX,dirY, dd = 60;

  void display(){
    rect(x,y,l,50,B);
    ellipse(x+l*i,y,50,50);
    
    if(timer > 0){
    text(lyd,x+l*i,y-30);
    }
  }
  
  void move(){
    
      dd--;
  if(dd == 0){
  dirX = int(random(-2,2));
  dirY = int(random(-2,2));
  dd = int(random(40,100));
  }
    
  if(dist(hjorneX,hjorneY,x,y)>50){
  if(hjorneX > x){x++; i = 1;}
  if(hjorneX < x){x--; i = 0;}
  if(hjorneY > y){y++;}
  if(hjorneY < y){y--;}
  }
  else{
  x += dirX;
  y += dirY;
  }
}
  
  void larm(){
    timer = 200;
  }
}

class Ko extends Dyr{
  Ko(float B_ind){B=B_ind;};
  Ko(){B=0;};
  
  void display(){
    l=100;
    lyd = "Muuh";
    fill(255);
    hjorneX = width/3; hjorneY = height/3;
    super.display();
  }
  
}

class Gris extends Dyr{
  Gris(float B_ind){B=B_ind;};
  Gris(){B=0;};

  void display(){
    l=70;
    lyd = "Oink";
    fill(255,205,230);
    hjorneX = width/3; hjorneY = height/3*2;
    super.display();
  }
  
}

class Hest extends Dyr{
  Hest(float B_ind){B=B_ind;};
  Hest(){B=0;};

  void display(){
    l=120;
    lyd = "Brrr";
    fill(89, 35, 20);
    hjorneX = width/3*2; hjorneY = height/3;
    super.display();
  }
  
}

class For extends Dyr{
  For(float B_ind){B=B_ind;};
  For(){B=0;};
  
  void display(){
    l=80;
    lyd = "Meeh";
    fill(255);
    hjorneX = width/3*2; hjorneY = height/3*2;
    super.display();
  }
  
}
