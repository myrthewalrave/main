void draw() {
  background(255);
  
  
  if (!GameOver) {
    mouse.display(); //This the mickey, its y can be a variable
    }
    
  if (GameStart && !GameOver) {
    blood.drawBlood();
    
  }

  if (!GameOver) {

    b.display();
  }

  if (rising >= 4) {
    GameOver = true;
  }
  if(!GameOver){
  for (int i = 0; i < spatterCount; i++) {
    spatters[i].drawSpatter();
  }
  }
  if (GameOver){
    dead.display();//this can be in the if loop (it is the Game Over)
  }
  if (GameStart && !GameOver){
    // if dot exists, draw it
  if (currentDot != null) {
    currentDot.display();
  }

  // timing
  if (GameStart) {
    // if dot exists and time passed
    if (currentDot != null && millis() - currentDot.spawnTime > dotVisibleDuration) {

      if (!currentDot.clicked) {
        
      }

      // remove the dot after time is up
      currentDot = null;
      lastDotTime = millis();
          blood.update();
    if (rising<= 2){
    y += 100;
    } 
    else {
    y += 30;
    }
    
    for (int i = 0; i < 5; i++) {
    if (spatterCount < spatters.length) {
      float x = random (width);
      float y = random (height);
      float d = random (10,200);
      float a = random (50,200); //random transparency
      spatters[spatterCount] = new Bloodspatter(x, y, d, a);
      spatterCount++;
    }
  }
    }

    // spawn next dot after delay
    if (currentDot == null && millis() - lastDotTime > dotDelay) {
      spawnNextDot();
      dotVisibleDuration -= 20;
    }
  }

  
  }
  
  
}
