class Mickey {

  Mickey(int X, int Y) {
    x = X;
    y = Y;
  }
  void display() {
    //rope
    strokeWeight(7);
    stroke(#773e0c);
    line(700, 0, x, y-50);//rope
    stroke(#000000);
    strokeWeight(1);
    //HEAD
    fill(#000000);
    circle(x, y, 100);//head
    circle(x-50, y-50, 60);//left ear
    circle(x+50, y-50, 60);//right ear
    fill(#FFE7D1);
    ellipse(x, y+15, 92, 66);//skin down part of the face
    noStroke();
    ellipse(x-17, y-8, 30, 53); //skin eye left
    ellipse(x+17, y-8, 30, 53); //skin eye right
    stroke(1);
    fill(#FFFFFF);
    ellipse(x-17, y-8, 16, 33); //eye left
    ellipse(x+17, y-8, 16, 33); //eye right
    fill(#000000);
    ellipse(x-14, y-14, 4, 11); //eyeball left
    ellipse(x+14, y-14, 4, 11); //eyeball right
    fill(#FFE7D1);
    noStroke();
    ellipse(x, y+12, 60, 28);//skin mouth
    stroke(1);
    fill(#000000);
    ellipse(x, y+7, 20, 12); //nose
    arc(x, y+37, 29, 28, PI, TWO_PI);//mouth
    fill(#FFE7D1);
    arc(x, y+40, 32, 10, PI, TWO_PI);//mouth shape

    //BODY

    //torso
    fill(#000000);
    quad(x-16, y+46, x+16, y+46, x+33, y+135, x-33, y+135); // body torso

    quad(x-16, y+46, x-16, y+61, x-92, y+36, x-71, y+32); // arm left 1
    quad(x-38, y-27, x-54, y-22, x-92, y+36, x-71, y+31); // arm left 2
    quad(x+16, y+46, x+16, y+61, x+92, y+36, x+71, y+32); // arm right 1
    quad(x+38, y-27, x+54, y-22, x+92, y+36, x+71, y+31); // arm right 2
    fill(#FFFFFF);
    ellipse(x-46, y-27, 27, 23);//hand left
    ellipse(x+46, y-27, 27, 23);//hand right
    fill(#000000);
    quad(x-51, y-9, x-45, y-26, x-32, y-27, x-36, y-16); //hand detail left
    quad(x+51, y-9, x+45, y-26, x+32, y-27, x+36, y-16); //hand detail right

    //legs
    fill(#A72424);
    quad(x-28, y+111, x+28, y+111, x+38, y+163, x-38, y+162); // pants
    fill(#000000);
    rect(x-20, y+216, 20, 60);//leg left
    rect(x+20, y+216, 20, 60);//leg right
    noStroke();
    fill(#A72424);
    rect(x-21, y+171, 34, 32, 10); // pants leg left
    rect(x+21, y+171, 34, 32, 10); // pants leg right
    rect(x, y+167, 10, 16); // pants leg middle
    stroke(1);
    fill(#ebd200);
    ellipse(x-33, y+252, 47, 33); //shoe left
    ellipse(x+33, y+252, 47, 33); //shoe righ
    fill(#FFFFFF);
    ellipse(x-14, y+137, 17, 27);//circle in pant left
    ellipse(x+14, y+137, 17, 27);//circle in pant righ

    //rope 2
    strokeWeight(4);
    stroke(#773e0c);
    rect(x, y+48, 31, 1, 8);
    stroke(#000000);
  }
}
