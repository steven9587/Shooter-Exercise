PImage dog;
PImage meat;
Bullet[] bullets;
int bulletNum = 50;
int bulletPointer = 0;
Meat[] meats;
int meatNum = 3;
int score = 0;
int location_x = 300 ;
int location_y = 500;
import processing.serial.*;
Serial myPort;
byte[] data = new byte[3];
void setup() {
  size(600, 600);
  dog = loadImage("dog.png");
  meat = loadImage("meat.png");
  bullets = new Bullet[bulletNum];
  meats = new Meat[meatNum];
  for (int i=0; i<bulletNum; i++) {
    bullets[i] = new Bullet();
  }
  for (int i=0; i<meatNum; i++) {
    meats[i] = new Meat();
    meats[i].meat(int(random(520)), int(random(3))+3);
  }
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
}
int X, Y, Button;
void draw() {
  getData();
  background(#000000);
  image(dog, location_x, location_y, 80, 80);
  if (keyCode == UP||Button ==1) {
      bullets[bulletPointer].bullet(location_x+40, location_y+40);
      bulletPointer+=1;
      if (bulletPointer >= bulletNum) {
        bulletPointer = 0;
      }
    }
    if (keyCode == LEFT||X ==1) {
      location_x = (location_x-10)%600;
    }
    if (keyCode == RIGHT||Y==1) {
      location_x =(location_x+10)%600;
    }
  for (int i=0; i<bulletNum; i++) {
    bullets[i].show();
    bullets[i].shoot();
  }
  for (int i=0; i<meatNum; i++) {
    meats[i].drop();
    meats[i].show();
    if (meats[i].life == false) {
      meats[i].meat(int(random(520)), int(random(3))+3);
    }
  }
  //hit
  for (int i=0; i<bulletNum; i++) {
    for (int j=0; j<meatNum; j++) {
      if (bullets[i].life == true && meats[j].life == true) {
        if (meats[j].x < bullets[i].x && bullets[i].x < meats[j].x+80 && meats[j].y < bullets[i].y && bullets[i].y < meats[j].y+80) {
          meats[j].life = false;
          bullets[i].life = false;
          score += 5;
        }
      }
    }
  }
  textSize(20);
  fill(0);
  text("SCORE:"+score, 10, 30);
}

void getData() {
  //byte[] data = new byte[3];
  if (  myPort.available()>0) {
    myPort.readBytes(data);
    X = data[0];
    Y = data[1];
    Button = data[2];
    println(X, Y, Button);
  }
}


void keyPressed() {
  if (keyPressed == true) {
    
  }
}
