//By: Rachel Leong
//For: Ms. Krasteva
//January 14, 2019
//ISP - Paint Program

//I had to add a few more variables and methods to include a "save" function and for the user to be able to see their previous work (variables: savedImg, edit( (methods: saved, previousWork)
//I learned about the get() function from the processing reference website (https://processing.org/reference/get_.html). I used it in my program to allow the user to save their art piece and retrieve it
//I learned how to use the state variable from game dev (MCPT) (https://docs.google.com/presentation/d/1VRCtca3uf4YTlFzzfjcEHo_MfCAthNg-A9nDJnbA4bY/edit#slide=id.g486160d0ea_3_105). I used it to change the screen everytime the user clicks on a button.

String state = "intro"; //sets the state; starts with "intro" by default
boolean drawing = false; //plays saved drawing on drawing screen when true
boolean gameBackground = false; //plays the game background when true
String drawingTool = "line"; //sets the drawing tool; starts with "line" by default
int colour1 = 0; //sets the colour of the drawing tool - the R part of RGB; starts black by default
int colour2 = 0; //sets the colour of the drawing tool - the G part of RGB; starts black by default
int colour3 = 0; //sets the colour of the drawing tool - the B part of RGB; starts black by default
int toolFill = 255; //fills/doesn't fill the drawing tool; starts opaque by default
PFont paint; //font for "paint"; ShowcardGothic-Reg
PFont buttons; //font for all buttons; CenturyGothic
int animationY = -460; //the y-control coordinate so that the paint drips in the intro animation can "move"; starts off the screen
PImage savedImg; //holds the saved image from the drawing screen that the user has drawn
boolean edit = false; //controls if the edit button appears or not in the "previous work" state
int brushX = -100; //moves the paintbrush across the screen in the intro animation by increasing the x-coordinate; starts off the screen
int transparency = 0; //allows the transparency of the splash screen title to change from transparent to opaque; starts opaque

//Introduction With Animation
void intro() {
  if (animationY <= 0) { //makes sure the animation stops when the top of the paint drips reach the top of the screen
    background(255); //white
    noStroke();
    fill(#FF1B0F); //red
    beginShape(); //red paint drip
    curveVertex(600, animationY);
    curveVertex(600, animationY);
    curveVertex(615, animationY+97);
    curveVertex(625, animationY+100);
    curveVertex(628, animationY+126);
    curveVertex(625, animationY+165);
    curveVertex(615, animationY+203);
    curveVertex(625, animationY+227);
    curveVertex(648, animationY+226);
    curveVertex(650, animationY+200);
    curveVertex(635, animationY+150);
    curveVertex(640, animationY+95);
    curveVertex(665, animationY+83);
    curveVertex(690, animationY+71);
    curveVertex(687, animationY+165);
    curveVertex(720, animationY+140);
    curveVertex(736, animationY+150);
    curveVertex(760, animationY+148);
    curveVertex(775, animationY+200);
    curveVertex(800, animationY+225);
    curveVertex(800, animationY);
    curveVertex(600, animationY);
    endShape(CLOSE);

    fill(#FFF529); //yellow
    beginShape(); //yellow paint drip
    curveVertex(200, animationY);
    curveVertex(200, animationY);
    curveVertex(185, animationY+100);
    curveVertex(199, animationY+110);
    curveVertex(202, animationY+165);
    curveVertex(200, animationY+210);
    curveVertex(190, animationY+255);
    curveVertex(189, animationY+276);
    curveVertex(202, animationY+297);
    curveVertex(221, animationY+275);
    curveVertex(220, animationY+249);
    curveVertex(205, animationY+100);
    curveVertex(223, animationY+85);
    curveVertex(245, animationY+115);
    curveVertex(260, animationY+113);
    curveVertex(275, animationY+76);
    curveVertex(285, animationY+85);
    curveVertex(290, animationY+110);
    curveVertex(280, animationY+130);
    curveVertex(290, animationY+149);
    curveVertex(310, animationY+154);
    curveVertex(330, animationY+175);
    curveVertex(350, animationY+265);
    curveVertex(348, animationY+310);
    curveVertex(330, animationY+400);
    curveVertex(360, animationY+425);
    curveVertex(385, animationY+400);
    curveVertex(375, animationY+301);
    curveVertex(377, animationY+200);
    curveVertex(402, animationY+150);
    curveVertex(475, animationY+173);
    curveVertex(530, animationY+123);
    curveVertex(550, animationY);
    curveVertex(200, animationY);
    endShape(CLOSE);

    fill(#0AB0FA); //blue
    beginShape(); //blue paint drip
    curveVertex(0, animationY);
    curveVertex(0, animationY);
    curveVertex(0, animationY+155);
    curveVertex(35, animationY+170);
    curveVertex(30, animationY+220);
    curveVertex(50, animationY+250);
    curveVertex(77, animationY+215);
    curveVertex(60, animationY+155);
    curveVertex(110, animationY+75);
    curveVertex(117, animationY+117);
    curveVertex(130, animationY+130);
    curveVertex(155, animationY+115);
    curveVertex(170, animationY+145);
    curveVertex(185, animationY+130);
    curveVertex(220, animationY+50);
    curveVertex(290, animationY+25);
    curveVertex(310, animationY-10);
    curveVertex(0, animationY);
    endShape(CLOSE);

    fill(#60F540); //green
    beginShape(); //green paint drip
    curveVertex(365, animationY);
    curveVertex(365, animationY);
    curveVertex(370, animationY+15);
    curveVertex(400, animationY+16);
    curveVertex(410, animationY+50);
    curveVertex(426, animationY+60);
    curveVertex(440, animationY+47);
    curveVertex(435, animationY+25);
    curveVertex(470, animationY+35);
    curveVertex(465, animationY+70);
    curveVertex(475, animationY+76);
    curveVertex(485, animationY+60);
    curveVertex(483, animationY+35);
    curveVertex(500, animationY+52);
    curveVertex(490, animationY+90);
    curveVertex(500, animationY+120);
    curveVertex(530, animationY+123);
    curveVertex(550, animationY+225);
    curveVertex(530, animationY+325);
    curveVertex(540, animationY+348);
    curveVertex(573, animationY+310);
    curveVertex(560, animationY+155);
    curveVertex(580, animationY+122);
    curveVertex(615, animationY+97);
    curveVertex(648, animationY+60);
    curveVertex(705, animationY+45);
    curveVertex(730, animationY-10);
    curveVertex(365, animationY);
    endShape(CLOSE);

    animationY += 1; //allows the paint drips to move down the screen
  }
  stroke(0); //black
  PImage splashBackground; //background image after the paint drips
  splashBackground = loadImage("splashBackground.png");
  if (animationY >= 0) { //controls when the title and button appears; after the paint drips stop moving
    if (brushX <= 1200) { //only runs if the paintbrush is on the left/on the screen
      image(splashBackground, 400, 250, width + 6, height + 11); //displays the background
      fill(0, transparency); //black, gradually goes from transparent to opaque
      textFont(paint);
      textSize(100);
      text("Paint", 250, 300); //paint title
      PImage paintbrush; //the paintbrush that moves across the screen
      paintbrush = loadImage("paintbrush.png");
      image(paintbrush, brushX, 15, 750, 750); //displays the paintbrush on the left to the drawing screen
      brushX += 10; //allows the paintbrush to move right across the screen
      if (brushX >= 410) { //only runs once the paintbrush has reached the start of the title
        transparency += 5; //gradually increases the opacity of the title
      }
    } else if (brushX >= 1200) { //runs once the brush has gone off the screen
      if (mouseX >= 350 && mouseX <= 450 && mouseY >= 420 && mouseY <= 460) { //allows the button to become a darker colour when the mouse is on top of it
        fill(150); //grey
      } else {
        fill(200); //light grey
      }
      rect(350, 420, 100, 40); //begin button
      fill(0); //black
      textFont(buttons);
      textSize(30);
      text("Begin", 360, 450);
    }
  }
}

//Main Menu
void mainMenu() {
  PImage menuBackground; //the background image for the main menu state
  menuBackground = loadImage("paintSplatter.jpg"); 
  image(menuBackground, 400, 250, width+100, height+100); //sets the image as the background
  if (mouseX >= 315 && mouseX <= 485 && mouseY >= 200 && mouseY <= 240) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(315, 200, 170, 40); //instructions button
  if (mouseX >= 365 && mouseX <= 435 && mouseY >= 250 && mouseY <= 290) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(365, 250, 70, 40); //play button
  if (mouseX >= 290 && mouseX <= 510 && mouseY >= 300 && mouseY <= 340) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(290, 300, 220, 40); //previous works button
  if (mouseX >= 365 && mouseX <= 435 && mouseY >= 350 && mouseY <= 390) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(365, 350, 70, 40); //exit button
  textAlign(CENTER);
  textSize(50);
  fill(255); //white
  text("Main Menu", 400, 170);
  textSize(30);
  fill(0); //black
  text("Instructions", 400, 230); 
  text("Play", 400, 280);
  text("Previous Work", 400, 330);
  text("Exit ", 400, 380);
}

//Instructions
void instructions() {
  PImage instructionsBackground; //the background image for the instructions state
  instructionsBackground = loadImage("paintSplatter2.jpg");
  image(instructionsBackground, 410, 250, width + 20, height + 20); //sets the image as the background
  if (mouseX >= 300 && mouseX <= 497 && mouseY >= 420 && mouseY <= 450) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(300, 420, 197, 30); //Back to Menu button
  fill(0); //black
  textAlign(CENTER);
  textSize(20);
  text("Back to Main Menu", 400, 443);
  textSize(50);
  text("Instructions", 400, 85);
  textSize(20);
  text("Welcome to Paint! \n In this program, you'll be able to unleash your inner creativity by drawing \n and colouring to your heart's content. To play, click the Play button in \n the main menu. Within this program, you'll be able to select the drawing tool \n of your choice (line/oval/rectangle/star) change its colour, select fill/no fill, \n and of course erase. All this is done by clicking on each corresponding icon. \n If you wish to clear the drawing screen, click on the Clear button at the \n top right corner of the screen. If you wish to go back to the main menu, \n click the Back to Main Menu button at the top left corner. You can save your \n artwork by clicking on the Save button at the top right corner, and you can \n access your latest previous work by clicking on the Previous Work \n button in the main menu. There, you can also edit your saved work. \n Have fun, and keep your creative juices flowing!", 400, 120); //instructions
}

//Paint Program
void game() {
  if (gameBackground) { //so it only plays once when the game background needs to be reset, ensuring the drawing doesn't constantly get replaced by a new background 
    //Background
    PImage gameBorder; //the background/border image
    gameBorder = loadImage("paintSplatter4.jpg");
    image(gameBorder, 400, 250, width, height); //sets the image as the background
    textFont(paint);
    textAlign(CORNER);
    text("Paint", 280, 45); //title
    textFont(buttons);
    fill(255); //white
    rect(50, 50, 550, 400); //drawing screen
    gameBackground = false; //sets back to false so it doesn't play again
    if (drawing) { //only plays once when the user has already saved a drawing, so that they can continue their art piece
      image(savedImg, 326, 251, 549, 399); //sets their saved image on top of the drawing screen
      drawing = false; //sets back to false so it doesn't play again
    }
  }

  //Menu
  fill(#E1EDED); //blue-grey
  rect(600, 50, 150, 400); //menu console

  //Drawing Tools
  textSize(15);
  fill(0); //black
  text("Drawing Tools", 627, 70); //drawing tools label
  fill(colour1, colour2, colour3, toolFill); //changes colour according to what the user has selected
  stroke(colour1, colour2, colour3); //changes colour according to what the user has selected
  if (mouseX >= 630 && mouseX <= 660 && mouseY >= 90 && mouseY <= 110) { //becomes bigger if the mouse is on top
    line (628, 88, 662, 112); //line function
  } else {
    line(630, 90, 660, 110); //line function
  }
  if (mouseX >= 700 && mouseX <= 720 && mouseY >= 90 && mouseY <= 110) { //becomes bigger if the mouse is on top
    ellipse(710, 100, 25, 25); //oval function
  } else {
    ellipse(710, 100, 20, 20); //oval function
  }
  if (mouseX >= 630 && mouseX <= 660 && mouseY >= 130 && mouseY <= 150) { //becomes bigger if the mouse is on top
    rect(627, 127, 35, 25); //rectangle function
  } else {
    rect(630, 130, 30, 20); //rectangle function
  }
  if (mouseX >= 697 && mouseX <= 723 && mouseY >= 130 && mouseY <= 150) { //becomes bigger if the mouse is on top
    triangle(710, 128, 721, 153, 705, 145); //star function
    triangle(710, 128, 715, 147, 699, 153);
    triangle(710, 147, 726, 137, 694, 137);
  } else {
    triangle(710, 130, 720, 150, 705, 142); //star function
    triangle(710, 130, 715, 142, 700, 150);
    triangle(710, 145, 723, 137, 697, 137);
  }
  stroke(0); //black

  //Eraser Tool
  fill(0); //black
  text("Eraser Tool", 640, 185);
  if (mouseX >= 657 && mouseX <= 697 && mouseY >= 200 && mouseY <= 217) { //becomes bigger if the mouse is on top
    fill(255); //white
    rect(654, 197, 45, 20); //eraser tool
    fill(#62CEFF); //blue
    rect(664, 197, 35, 20); //eraser cover
  } else {
    fill(255); //white
    rect(657, 200, 40, 17); //eraser tool
    fill(#62CEFF); //blue
    rect(667, 200, 30, 17); //eraser cover
  }

  //Colours
  fill(0); //black
  text("Colours", 650, 245);
  if (mouseX >= 630 && mouseX <= 650 && mouseY >= 260 && mouseY <= 280) { //allows the button to become bigger when the mouse is on top of it
    ellipse(640, 270, 25, 25); //black colour
  } else {
    ellipse(640, 270, 20, 20); //black colour
  }
  fill(255); //white
  if (mouseX >= 665 && mouseX <= 685 && mouseY >= 260 && mouseY <= 280) { //allows the button to become bigger when the mouse is on top of it
    ellipse(675, 270, 25, 25); //white colour
  } else {
    ellipse(675, 270, 20, 20); //white colour
  }
  fill(#FFD1A5); //beige
  if (mouseX >= 700 && mouseX <= 720 && mouseY >= 260 && mouseY <= 280) { //allows the button to become bigger when the mouse is on top of it
    ellipse(710, 270, 25, 25); //beige colour
  } else {
    ellipse(710, 270, 20, 20); //beige colour
  }
  fill(#FA0A0A); //red
  if (mouseX >= 630 && mouseX <= 650 && mouseY >= 300 && mouseY <= 320) { //allows the button to become bigger when the mouse is on top of it
    ellipse(640, 310, 25, 25); //red colour
  } else {
    ellipse(640, 310, 20, 20); //red colour
  }
  fill(#FAAA0A); //orange
  if (mouseX >= 665 && mouseX <= 685 && mouseY >= 300 && mouseY <= 320) { //allows the button to become bigger when the mouse is on top of it
    ellipse(675, 310, 25, 25); //orange colour
  } else {
    ellipse(675, 310, 20, 20); //orange colour
  }
  fill(#F9FA0A); //yellow
  if (mouseX >= 700 && mouseX <= 720 && mouseY >= 300 && mouseY <= 320) { //allows the button to become bigger when the mouse is on top of it
    ellipse(710, 310, 25, 25); //yellow colour
  } else {
    ellipse(710, 310, 20, 20); //yellow colour
  }
  fill(#0AFA27); //green
  if (mouseX >= 630 && mouseX <= 650 && mouseY >= 340 && mouseY <= 360) { //allows the button to become bigger when the mouse is on top of it
    ellipse(640, 350, 25, 25); //green colour
  } else {
    ellipse(640, 350, 20, 20); //green colour
  }
  fill(#0AA8FA); //blue
  if (mouseX >= 665 && mouseX <= 685 && mouseY >= 340 && mouseY <= 360) { //allows the button to become bigger when the mouse is on top of it
    ellipse(675, 350, 25, 25); //blue colour
  } else {
    ellipse(675, 350, 20, 20); //blue colour
  }
  fill(#FA0AF7); //purple
  if (mouseX >= 700 && mouseX <= 720 && mouseY >= 340 && mouseY <= 360) { //allows the button to become bigger when the mouse is on top of it
    ellipse(710, 350, 25, 25); //purple colour
  } else {
    ellipse(710, 350, 20, 20); //purple colour
  }

  //Fill/No Fill Tool
  fill(0); //black
  text("Fill/No Fill Tool", 628, 390);
  if (mouseX >= 625 && mouseX <= 652 && mouseY >= 405 && mouseY <= 425) { //allows the button to become a darker colour when the mouse is on top of it
    fill(200); //light grey
  } else {
    fill(255); //white
  }
  rect(625, 405, 27, 20); //fill button
  if (mouseX >= 675 && mouseX <= 726 && mouseY >= 405 && mouseY <= 425) { //allows the button to become a darker colour when the mouse is on top of it
    fill(200); //light grey
  } else {
    fill(255); //white
  }
  rect(675, 405, 51, 20); //no fill button
  fill(0); //black
  text("Fill", 630, 420);
  text("No  Fill", 680, 420);

  //Clear Screen Button
  if (mouseX >= 550 && mouseX <= 600 && mouseY >= 30 && mouseY <= 50) { //allows the button to become a darker colour when the mouse is on top of it
    fill(#CE1B27); //dark red
  } else {
    fill(#F51E2C); //red
  }
  rect(550, 30, 50, 20); //clear screen button
  fill(0); //black
  text("Clear", 555, 45); 

  //Back to Main Menu Button
  if (mouseX >= 50 && mouseX <= 200 && mouseY >= 30 && mouseY <= 50) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(50, 30, 150, 20); //back to main menu button
  fill(0); //black
  text("Back to Main Menu", 57, 46);

  //Save Button
  if (mouseX >= 500 && mouseX <= 550 && mouseY >= 30 && mouseY <= 50) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(500, 30, 50, 20); //save button
  fill(0); //black
  text("Save", 505, 45);

  //User Drawing
  if (mouseX > 60 && mouseX < 587 && mouseY > 60 && mouseY < 440 && pmouseX > 60 && pmouseX < 587 && pmouseY > 60 && pmouseY < 440 && mousePressed) { //only draws if the user is within the drawing screen 

    //Stroke and Fill 
    stroke(colour1, colour2, colour3); //changes colour according to what the user has selected
    fill(colour1, colour2, colour3, toolFill); //changes the colour of the fill according to what the user has selected

    //Drawing Tools
    if (drawingTool.equals("line")) { //only runs if the user has selected the line function
      line(pmouseX, pmouseY, mouseX, mouseY); //draws a line from the mouse's previous location to its current location
    } else if (drawingTool.equals("oval")) { //only runs if the user has selected the oval function
      ellipse(mouseX, mouseY, 20, 20); //draws a circle at the mouse's current location
    } else if (drawingTool.equals("rectangle")) { //only runs if the user has selected the rectangle function
      rect(mouseX-10, mouseY-10, 30, 20); //draws a rectangle at the mouse's current location
    } else if (drawingTool.equals("star")) { //only runs if the user has selected the star function
      triangle(mouseX, mouseY-10, mouseX+10, mouseY+10, mouseX-5, mouseY+2); //draws a star at the mouse's current location
      triangle(mouseX, mouseY-10, mouseX+5, mouseY+2, mouseX-10, mouseY+10);
      triangle(mouseX, mouseY+5, mouseX+13, mouseY-3, mouseX-13, mouseY-3);
    } else if (drawingTool.equals("eraser")) { //only runs if the user has selected the eraser function
      noStroke();
      fill(255); //white
      rect(mouseX-10, mouseY-10, 30, 20); //erases at the mouse's current location
    }
  }
  noFill();
  stroke(0); //black
  if (drawingTool.equals("line")) { //only runs if the user has selected the line function
    rect(625, 85, 40, 30); //draws a rectangle around the chosen drawing tool
  } else if (drawingTool.equals("oval")) { //only runs if the user has selected the oval function
    rect(690, 85, 40, 30); //draws a rectangle around the chosen drawing tool
  } else if (drawingTool.equals("rectangle")) { //only runs if the user has selected the rectangle function
    rect(625, 125, 40, 30); //draws a rectangle around the chosen drawing tool
  } else if (drawingTool.equals("star")) { //only runs if the user has selected the star function
    rect(690, 125, 40, 30); //draws a rectangle around the chosen drawing tool
  } else if (drawingTool.equals("eraser")) { //only runs if the user has selected the eraser function
    rect(652, 195, 50, 27); //draws a rectangle around the chosen tool
  } 
  if (toolFill == 0) { //only runs if the user has selected the fill function
    rect(670, 400, 60, 30); //draws a rectangle around the chosen tool
  } else if (toolFill == 255) { //only runs if the user has selected the fill function
    rect(620, 400, 37, 30); //draws a rectangle around the chosen tool
  }
}

//Saved Confirmation Screen
void saved() {
  PImage savedBackground; //the background image
  savedBackground = loadImage("paintSplatter5.jpg");
  image(savedBackground, 400, 250, width, height); //sets the image as the background
  if (mouseX >= 330 && mouseX <= 480 && mouseY >= 330 && mouseY <= 360) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(330, 330, 150, 30); //back to game button
  fill(0); //black
  textSize(30);
  textAlign(CENTER);
  text("You've saved your art piece!", 400, 200);
  text("Go to the Previous Work button in the main \n menu to view it again.", 400, 250);
  textSize(20);
  textAlign(CORNER);
  text("Back to Game", 340, 352);
}

//Previous Work
void previousWork() {
  PImage workBackground; //the background image
  workBackground = loadImage("paintSplatter6.jpg");
  image(workBackground, 400, 250, width, height + 300); //sets the image as the background
  fill(0); //black
  rect(120, 75, 559, 409); //border
  image(savedImg, 400, 280, 550, 400); //previous work
  textAlign(CENTER);
  textSize(30);
  text("This is your previous work:", 400, 60);
  textAlign(CORNER);
  if (mouseX >= 10 && mouseX <= 155 && mouseY >= 10 && mouseY <= 35) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(10, 10, 145, 25); //back to main menu button
  textSize(15);
  fill(0); //black
  text("Back to Main Menu", 15, 18, 200, 30); //back to main menu button

  if (edit) { //only appears when the player has already saved an art piece; it doesn't make sense for the player to be able to edit a non-existing art piece
    if (mouseX >= 630 && mouseX <= 670 && mouseY >= 450 && mouseY <= 475) { //allows the button to become a darker colour when the mouse is on top of it
      fill(#CE1B27); //dark red
    } else {
      fill(#F51E2C); //red
    }
    rect(630, 450, 40, 25); //edit button
    fill(0); //black
    text("Edit", 637, 468); //edit button
  }
}

//Goodbye Message
void goodbye() {
  background(255); //white
  PImage goodbyeBackground; //the background image
  goodbyeBackground = loadImage("paintSplatter3.png");
  image(goodbyeBackground, 400, 250, width, height); //sets the image as the background
  if (mouseX >= 300 && mouseX <= 500 && mouseY >= 350 && mouseY <= 380) { //allows the button to become a darker colour when the mouse is on top of it
    fill(150); //grey
  } else {
    fill(200); //light grey
  }
  rect(300, 350, 200, 30); //close the program button
  fill(0); //black
  textAlign(CENTER);
  textSize(30);
  text("Thanks for playing \n this Paint program \n made by Rachel Leong. \n See you next time!", 400, 200);
  textSize(20);
  text("Close the Program", 400, 372);
} 

//Runs when the mouse is clicked
void mousePressed() {
  if (state.equals("goodbye")) { //only runs if it's in the "goodbye" state //Nicole Han told me to move it to the top
    //Close the Program Button From Goodbye
    if (mouseX >= 300 && mouseX <= 500 && mouseY >= 350 && mouseY <= 380) { //only runs if the mouse is clicked within the button
      exit(); //closes the program
    }
  }
  if (state.equals("intro")) { //only runs if it's in the "intro" state
    //Begin Button From Introduction
    if (mouseX >= 350 && mouseX <= 450 && mouseY >= 420 && mouseY <= 460) { //only runs if the mouse is clicked within the button
      state = "menu";
    }
  }
  if (state.equals("menu")) { //only runs if it's in the "menu" state
    //Instructions Button From Menu
    if (mouseX >= 315 && mouseX <= 485 && mouseY >= 200 && mouseY <= 240) { //only runs if the mouse is clicked within the button
      state = "instructions";
    }
    //Play Button From Menu
    if (mouseX >= 365 && mouseX <= 435 && mouseY >= 250 && mouseY <= 290) { //only runs if the mouse is clicked within the button
      state = "game";
      gameBackground = true; //plays the game background
    }
    //Previous Work Button From Menu
    if (mouseX >= 290 && mouseX <=510 && mouseY >= 300 && mouseY <= 340) { //only runs if the mouse is clicked within the button
      state = "previous work";
    }
    //Exit Button From Menu
    if (mouseX >= 365 && mouseX <= 435 && mouseY >= 340 && mouseY <= 390) { //only runs if the mouse is clicked within the button
      state = "goodbye";
    }
  }
  if (state.equals("instructions")) { //only runs if it's in the "instructions" state
    //Back to Menu Button From Instructions
    if (mouseX >= 295 && mouseX <= 505 && mouseY >= 420 && mouseY <= 450) { //only runs if the mouse is clicked within the button
      state = "menu";
    }
  }
  if (state.equals("game")) { //only runs if it's in the "game" state
    //Back to Menu Button From Game
    if (mouseX >= 50 && mouseX <= 200 && mouseY >= 30 && mouseY <= 50) { //only runs if the mouse is clicked within the button
      state = "menu";
    }
    //Clear Screen Button From Game
    if (mouseX >= 550 && mouseX <= 600 && mouseY >= 30 && mouseY <= 50) { //only runs if the mouse is clicked within the button
      gameBackground = true; //plays the game background
    }
    //Save Screen Button From Game
    if (mouseX >= 500 && mouseX <= 550 && mouseY >= 30 && mouseY<=50) { //only runs if the mouse is clicked within the button
      savedImg = get(51, 51, 549, 399); //screenshots the current drawing screen and sets it as the value in the savedImg variable
      edit = true; //allows the edit button to be displayed in the "previous work" state
      state = "saved";
    }
    //Line Drawing Tool
    if (mouseX >= 630 && mouseX <= 660 && mouseY >= 90 && mouseY <= 110) { //only runs if the mouse is clicked within the button
      drawingTool = "line";
    }
    //Circle Drawing Tool
    if (mouseX >= 700 && mouseX <= 720 && mouseY >= 90 && mouseY <= 110) { //only runs if the mouse is clicked within the button
      drawingTool = "oval";
    }
    //Rectangle Drawing Tool
    if (mouseX >= 630 && mouseX <= 660 && mouseY >= 130 && mouseY <= 150) { //only runs if the mouse is clicked within the button
      drawingTool = "rectangle";
    }
    //Star Drawing Tool
    if (mouseX >= 697 && mouseX <= 723 && mouseY >= 130 && mouseY <= 150) { //only runs if the mouse is clicked within the button
      drawingTool = "star";
    }
    //Eraser
    if (mouseX >= 657 && mouseX <= 697 && mouseY >= 200 && mouseY <= 217) { //only runs if the mouse is clicked within the button
      drawingTool = "eraser";
    }
    //Black
    if (mouseX >= 630 && mouseX <= 650 && mouseY >= 260 && mouseY <= 280) { //only runs if the mouse is clicked within the button
      colour1 = 0;
      colour2 = 0;
      colour3 = 0;
    }
    //White
    if (mouseX >= 665 && mouseX <= 685 && mouseY >= 260 && mouseY <= 280) { //only runs if the mouse is clicked within the button
      colour1 = 255;
      colour2 = 255;
      colour3 = 255;
    }
    //Beige
    if (mouseX >= 700 && mouseX <= 720 && mouseY >= 260 && mouseY <= 280) { //only runs if the mouse is clicked within the button
      colour1 = 255; 
      colour2 = 209;
      colour3 = 165;
    }
    //Red
    if (mouseX >= 630 && mouseX <= 650 && mouseY >= 300 && mouseY <= 320) { //only runs if the mouse is clicked within the button
      colour1 = 250; 
      colour2 = 10;
      colour3 = 10;
    }
    //Orange
    if (mouseX >= 665 && mouseX <= 685 && mouseY >= 300 && mouseY <= 320) { //only runs if the mouse is clicked within the button
      colour1 = 250; 
      colour2 = 170;
      colour3 = 10;
    }
    //Yellow
    if (mouseX >= 700 && mouseX <= 720 && mouseY >= 300 && mouseY <= 320) { //only runs if the mouse is clicked within the button
      colour1 = 249; 
      colour2 = 250;
      colour3 = 10;
    }
    //Green
    if (mouseX >= 630 && mouseX <= 650 && mouseY >= 340 && mouseY <= 360) { //only runs if the mouse is clicked within the button
      colour1 = 10; 
      colour2 = 250;
      colour3 = 39;
    }
    //Blue
    if (mouseX >= 665 && mouseX <= 685 && mouseY >= 340 && mouseY <= 360) { //only runs if the mouse is clicked within the button
      colour1 = 10; 
      colour2 = 168;
      colour3 = 250;
    }
    //Purple
    if (mouseX >= 700 && mouseX <= 720 && mouseY >= 340 && mouseY <= 360) { //only runs if the mouse is clicked within the button
      colour1 = 250; 
      colour2 = 10;
      colour3 = 247;
    }
    //Fill Button
    if (mouseX >= 625 && mouseY <= 652 && mouseY >= 405 && mouseY <= 425) { //only runs if the mouse is clicked within the button
      toolFill = 255; //opaque
    }
    //No Fill Button
    if (mouseX >= 675 && mouseY <= 726 && mouseY >= 405 && mouseY <= 425) { //only runs if the mouse is clicked within the button
      toolFill = 0; //transparent
    }
  }
  if (state.equals("previous work")) { //only runs if it's in the "previous work" state
    //Back to Main Menu Button From Previous Work
    if (mouseX >= 10 && mouseX <= 155 && mouseY >= 10 && mouseY <= 35) { //only runs if the mouse is clicked within the button
      state = "menu";
    }
    //Edit Button From Previous Work
    if (mouseX >= 630 && mouseY <= 670 && mouseY >= 450 && mouseY <= 475 && edit) { //only runs if the mouse is clicked within the button
      state = "game";
      gameBackground = true; //plays the game background
      drawing = true; //displays the saved art piece on top of the drawing screen
    }
  }
  if (state.equals("saved")) { //only runs if it's in the "saved" state
    //Back to Game Button from Saved Confirmation Screen
    if (mouseX >= 330 && mouseX <= 480 && mouseY >= 330 && mouseY <= 360) { //only runs if the mouse is clicked within the button
      state = "game";
      gameBackground = true; //plays the game background
      drawing = true; //displays the saved art piece on top of the drawing screen
    }
  }
}

//Only Plays Once; Size, Background
void setup() {
  size(800, 500); //size of graphics screen
  frameRate(80);
  imageMode(CENTER);
  paint = loadFont("paint.vlw"); //font for "paint"; ShowcardGothic-Reg
  buttons = loadFont("buttons.vlw"); //font for all buttons; CenturyGothic
  savedImg = loadImage("savedImg.jpg"); //holds the saved image from the drawing screen that the user has drawn
}

//Loops Continuously; Calls All Methods 
void draw() {
  if (state.equals("intro")) { //plays the splash screen at the beginning
    intro();
  } else if (state.equals("menu")) { //goes to menu from introduction / instructions / game / previous work
    mainMenu();
  } else if (state.equals("previous work")) { //goes to previous work from menu
    previousWork();
  } else if (state.equals("instructions")) { //goes to instructions from menu
    instructions();
  } else if (state.equals("game")) { //goes to game from menu / previous work
    game();
  } else if (state.equals("saved")) { //goes to saved confirmation screen from game
    saved();
  } else if (state.equals("goodbye")) { //goes to goodbye message from menu
    goodbye();
  }
}