class Bloodspatter {
  float x, y, d;
  float alpha;
  
  Bloodspatter(float spatterX, float spatterY, float spatterD, float spatterAlpha) {
    x = spatterX;
    y = spatterY;
    d = spatterD; //diameter
    alpha = spatterAlpha;
    
  }  
  
  void drawSpatter() {
    fill(219, 22, 22, 150);
    noStroke();
    circle(x, y, d);
  }
}
