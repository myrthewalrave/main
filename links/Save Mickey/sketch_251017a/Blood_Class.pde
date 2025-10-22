class Blood {
  float x, y, w, h;
  float startY;
  float targetY; //when it should stop rising
  //float speed = 0; //how fast blood is rising
  float startTime;
  float duration;
  
  
  Blood (float bloodX, float bloodY, float bloodW, float bloodH) {
    x = bloodX;
    y = bloodY;
    w = bloodW; //width
    h = bloodH; //height
  }  
  
  void drawBlood() {
    fill (#DB1616);
    noStroke();
    rect(x, y, w, h+rising*40);
  }
  
  void update () {
 rising += 1;
  }
}
