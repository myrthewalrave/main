class Blender {
  
  int blade = 585;
  void display() {
    //background so the blood doesn't go besides the blender
    fill(255);
    noStroke();
    quad(0,0,470,0,590,800,0,800);
    quad(930,0,810,800,1400,800,1400,0);
    
    // bottom part blender
    stroke(5);
    strokeWeight(8);
    fill(200);
    rect(700,700,300,200,30);
    fill(#FF0000);
    circle(700,750,70);
    textSize(90);
    text("START", 580,700);
    
    // blender glass
    strokeWeight(8);
    line(500,200,560,600);
    line(900,200,840,600);
    
  // handle
  strokeWeight(14);
  noFill();
  strokeJoin(ROUND);
  beginShape();
  vertex(900,250);
  vertex(1000, 250);
  vertex(960, 500);
  vertex(850, 550);
  endShape();
  
  //blades
  strokeWeight(3);
  fill(180);
  rect(700,588, 10, 15);
   noStroke();
  fill(210);
  rect(700, 575, 250, 10);
  
  //shiny part
 
  fill(255);
  rect(blade,575,20,10);
  blade += 20;
  if (blade >= 815){
  blade = 585;
  }
 }
  
}
