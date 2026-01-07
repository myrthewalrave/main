// This game is made with the words Blender, Mickey Mouse and Scaring. 
//You tap the dots before they disappear, otherwise mickey shall be lowered into the blender because of your actions. 
//The longer you survive, the more difficult it gets. 

//WARNING: don't put your volume at the max :)


boolean GameStart = false;
boolean GameOver  = false;
int AmountLowered = 0;
boolean nextStage = false;
int rising = 0;
Blender b;
Blood blood;
  int x = 0;
  int y = 0;
Mickey mouse = new Mickey(700, 300+y); //the y value shloud be a variable
GameOver dead = new GameOver(700,400);

Bloodspatter[] spatters = new Bloodspatter[500];
int spatterCount = 0;
//dots variables
float dotVisibleDuration = 1100;  // how long dot stays
float dotDelay = 1000;            // delay before next dot
float lastDotTime = 0;
Dot currentDot;

import processing.sound.*;
SoundFile BlenderSound;



void setup() {
  b = new Blender();
  blood = new Blood(700, 600, 1400, 0);
  BlenderSound = new SoundFile(this, "Blender sound.mp3");

  size (1400, 800);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void mousePressed() {
  if ((mouseX-700)*(mouseX-700) + (mouseY-750)*(mouseY-750) <= 4900) {
    GameStart = true;
  BlenderSound.play();
  }
   if (currentDot != null && currentDot.isClicked(mouseX, mouseY)) {
    if (!GameStart) {
      GameStart = true;  // start the game when first dot is clicked
    }
    // dot clicked
    currentDot.clicked = true;
    currentDot = null;       // remove the dot when clicked
    lastDotTime = millis();  // start delay for next dot
  }

  
  
  
}

void spawnNextDot() {
  float margin = 50;
  float x = random(margin, width - margin);
  float y = random(margin, height - margin);
  currentDot = new Dot(x, y, color(0, 0, 255));
}
