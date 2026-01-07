class GameOver {
  int x = 0;
  int y = 0;
  GameOver(int X, int Y) {
    x = X;
    y = Y;
  }
  void display() {
    background(#542e2e);
    
    noStroke();
    fill(255,255,255,91);
    ellipse(x, y+82, 747, 509);
    
    //BLOOD
    fill(#b70909);
    ellipse(x, y+71, 622, 115);
    ellipse(x+111, y+102, 215, 88);
    ellipse(x+237, y-9, 72, 30);
    ellipse(x-123, y+171, 133, 61);
    ellipse(x, y+32, 217, 112);
    ellipse(x-41, y+198, 35, 24);
    ellipse(x-24, y+164, 15, 11);
    ellipse(x-248, y-6, 24, 19);
    ellipse(x+213, y+104, 89, 42);
    ellipse(x+171, y-8, 27, 16);
    ellipse(x+199, y-34, 20, 12);
    ellipse(x-196, y+109, 185, 42);
    ellipse(x-208, y-32, 57, 42);

    strokeWeight(1);

    //HEAD
    fill(#830505);
    circle(x-50, y-50, 60);//left ear
    circle(x+50, y-50, 60);//right ear
    circle(x, y, 100);//head
    fill(#ff6e6e);
    ellipse(x, y+15, 92, 66);//skin down part of the face
    noStroke();
    ellipse(x-17, y-8, 30, 53); //skin eye left
    ellipse(x+17, y-8, 30, 53); //skin eye right
    stroke(1);
    fill(#ff6e6e);
    noStroke();
    ellipse(x, y+12, 60, 28);//skin mouth
    stroke(1);
    fill(#830505);
    ellipse(x, y+7, 20, 12); //nose
    arc(x, y+37, 29, 28, PI, TWO_PI);//mouth
    fill(#ff6e6e);
    arc(x, y+40, 32, 10, PI, TWO_PI);//mouth shape
    fill(#F00000);
    quad(x-24, y-2, x-7, y-23, x-11, y-28, x-28, y-6);//X cross eye left 1
    quad(x-8, y-6, x-24, y-28, x-29, y-25, x-13, y-2);//X cross eye left 2
    quad(x+24, y-2, x+7, y-23, x+11, y-28, x+28, y-6);//X cross eye right 1
    quad(x+8, y-6, x+24, y-28, x+29, y-25, x+12, y-2);//X cross eye right 2

    //TEXT (GAME OVER)
    fill(#ef4a4a);
    textSize(150);
    textAlign(CENTER);
    text("GAME OVER", width/2, 200);

    //brightness(#FFFFFF);
    //circle(x, y, 200);//spot light
  }
}
