boolean screenChange = true;
//Screen One
float opacityBeaker;
float thermoY;
int thermoMeasurementX;
int thermoMeasurementY;
int thermoNumbers;
int thermoNumberY;
float solute1MoveX, solute1MoveY;
float solute2MoveX, solute2MoveY;
float solute3MoveX, solute3MoveY;
float solute4MoveX, solute4MoveY;
float solute5MoveX, solute5MoveY;
//Screen Two
float guitarStringFrequency;
float guitarStringLength;
float guitarStringSpeed;


void settings() {
  size(600, 600);
}
void setup() {
  colorMode(HSB, 255);
  thermoY = 265;
  thermoMeasurementX = 464 ;
  thermoMeasurementY = 385 ;
  opacityBeaker = 0;

  solute1MoveX = 0 ;
  solute1MoveY = 1 ;
  solute2MoveX = 72;
  solute2MoveY = 73;
  solute3MoveX = 144;
  solute3MoveY = 145;
  solute4MoveX = 216;
  solute4MoveY = 217;
  solute5MoveX = 288;
  solute5MoveY = 289;

  guitarStringFrequency=50;
  guitarStringLength=5;
}
void draw() {    
  if (screenChange == true) {
    rectMode(CORNER);
    background(255);
    println(mouseX, mouseY);
    strokeWeight(2.5);
    screenOneText();   
    screenOneBeaker();
    screenOneThermometer();
    screenOneSoluteMolecules();
    screenOneOpacityChangeInWater();
    screenOneResetButton();
    screenOneSwitchScreens();
  } else {
    println(mouseX, mouseY);
    fill(0);
    rect(-1, -1, width, height);
    fill(255);
    guitarStringSpeed= guitarStringFrequency * ((guitarStringLength*2)/100);
    screenTwoText();
    screenTwoMeasurementsRequired();
    screenTwoResetButton();
    screenTwoSwitchScreens();
    screenTwoGuitar();
  }
}
void screenOneText() {
  //All the Text 
  fill(0);
  //Title
  textSize(24);
  text("How Temperature Affects The Rate of Dissolution", 13, 25);
  //Instructions
  textSize(16);
  text("1) Hover over the thermometer to set the temperature", 10, 60);
  text("2) Hold down the 'd/D' key in order to start dissolving", 10, 80);
  text("3) Click the 'Reset Beaker' button to bring back", 10, 100);
  text("   the solute particles", 10, 120);
  text("4) Click the 'Switch Screens' button to go to the", 10, 140); 
  text("   next screen", 10, 160);
  text("Observe how long it takes the solute to dissolve ", 10, 200);
  text("in the water depending on what temperature is", 10, 220);
  //Temperature  
  textSize(17);
  text("Temperature(°C)", 445, 60);
  //Beaker
  text("Beaker Filled With Solute Particles", 60, 590);
  //Buttons
  textSize(14);
  text("Reset Beaker", 405, 524);
  text("Switch Screens", 500, 524);
}
void screenOneBeaker() {
  noFill();
  quad(18, 256, 56, 570, 330, 570, 368, 256);
  fill(#38BFF2, 60);
  quad(26, 326, 56, 570, 330, 570, 360, 326);
}
void screenOneThermometer() {
  fill(255);
  arc(500, 440, 100, 100, radians(-45), PI+QUARTER_PI, OPEN);
  line(464, 404, 464, 105);
  line(535, 403, 535, 105);
  arc(499.5, 105, 71, 71, radians(-180), radians(0));
  line(475, 425, 475, 115);
  line(524, 425, 524, 115);
  arc(499.5, 115, 49, 49, radians(-180), radians(0));
  fill(#FF1A1A);
  arc(500, 440, 70, 70, radians(-45), PI+QUARTER_PI, OPEN);
  noStroke();

  pushMatrix();
  rectMode(CORNERS);
  rect (477, 416, 523, thermoY);
  if (mouseY < 416 && mouseY > 112 && mouseX > 475 && mouseX < 524) {
    thermoY = mouseY;
  }
  popMatrix();
  stroke(0);

  for (int m = thermoMeasurementY; m < 425 && m > 100; m -= 15) {
    strokeWeight(2); 
    line(thermoMeasurementX, m, thermoMeasurementX+26, m);

  }
      int number = 0;
    while ( number < 50) {
      fill(0);
      text (50 - number, thermoMeasurementX+30, 115 + (number * 6.1));
      number += 5;
    }
}
void screenOneSoluteMolecules() {
  noStroke();
  fill(#D0F0FC);
  quad(26, 326, 56, 570, 330, 570, 360, 326);
  stroke(#F09855);
  strokeWeight(25);
  solute1MoveX += 1;
  solute1MoveY += 1;
  arc (193, 448, 150, 150, radians(solute1MoveX), radians(solute1MoveY));
  solute2MoveX += 2;
  solute2MoveY += 2;
  arc (193, 448, 150, 150, radians(solute2MoveX), radians(solute2MoveY));
  solute3MoveX += 2;
  solute3MoveY += 2;
  arc (193, 448, 150, 150, radians(solute3MoveX), radians(solute3MoveY));
  solute4MoveX += 0.5;
  solute4MoveY += 0.5;
  arc (193, 448, 150, 150, radians(solute4MoveX), radians(solute4MoveY));
  solute5MoveX += 3;
  solute5MoveY += 3;
  arc (193, 448, 150, 150, radians(solute5MoveX), radians(solute5MoveY));
  stroke(0);
  strokeWeight(2);
}
void screenOneOpacityChangeInWater() {
  fill(#D0F0FC, opacityBeaker);
  quad(26, 326, 56, 570, 330, 570, 360, 326);
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      if (thermoY >= 385) {
        opacityBeaker += 1;
      } else if (thermoY >= 354 && thermoY <= 384) {
        opacityBeaker += 2;
      } else if (thermoY >= 325 && thermoY <= 354) {
        opacityBeaker += 3;
      } else if (thermoY >= 295 && thermoY <= 324) {
        opacityBeaker += 4;
      } else if (thermoY >= 265 && thermoY <= 294) {
        opacityBeaker += 5;
      } else if (thermoY >= 235 && thermoY <= 264) {
        opacityBeaker += 6;
      } else if (thermoY >= 205 && thermoY <= 234) {
        opacityBeaker += 7;
      } else if (thermoY >= 175 && thermoY <=204264) {
        opacityBeaker += 8;
      } else if (thermoY >= 145 && thermoY <= 174) {
        opacityBeaker += 9;
      } else if (thermoY >= 105 && thermoY <= 144) {
        opacityBeaker += 10;
      }
    }
  }
}
void screenOneResetButton() {
  strokeWeight(5);
  fill(#5CF09D);
  rect(420, 530, 505, 595);
  arc (462.5, 562.5, 35, 35, radians(-180), radians(115));
  line(453, 577, 463, 567);
  line(453, 577, 460, 588);
}
void screenOneSwitchScreens() {
  fill(#F05C7E);
  rect(505, 530, 590, 595);
  strokeJoin(ROUND);
  beginShape();
  vertex(555, 542);
  vertex(570, 562);
  vertex(555, 582);
  endShape();
  line(570, 562, 520, 562);
  strokeWeight(2);
}
void screenTwoText() {
  textSize(25);
  text("A segment of a guitar string vibrates in 1 loop.", 13, 30);
  text("Input the following required information to", 13, 60);
  text("calculate the speed at which the string vibrates.", 13, 90);


  //Buttons (text)
  textSize(14);
  text("Reset", 435, 524);
  text("Switch Screens", 500, 524);
  text("*Click 'Reset' to return default measurements, click", 13, 570);
  text("'Switch Screens' to go back to first screen*", 13, 590);    
  //Measurements Text
  text("*Use 'UP' and 'DOWN' arrow keys to change Frequency", 13, 220);
  text("Use 'LEFT' and 'RIGHT' arrow keys to change length*", 13, 240);
}
void screenTwoMeasurementsRequired() {
  textSize(25);
  String Frequency = "Frequency of String (Hz) = " + abs(guitarStringFrequency);
  text(Frequency, 13, 160);
  String LengthOfString = "Length of String (cm) = " + abs(guitarStringLength);
  text(LengthOfString, 13, 200);
  String Speed = "Speed of String (m/s) = " + abs(guitarStringSpeed);
  text(Speed, 13, 490);
}
void screenTwoResetButton() {
  strokeWeight(5);
  stroke(255);
  fill(#5CF09D);
  rect(420, 530, 505, 595);
  arc (462.5, 562.5, 35, 35, radians(-180), radians(115));
  line(453, 577, 463, 567);
  line(453, 577, 460, 588);
}
void screenTwoSwitchScreens() {
  fill(#F05C7E);
  rect(505, 530, 590, 595);
  strokeJoin(ROUND);
  beginShape();
  vertex(555, 542);
  vertex(570, 562);
  vertex(555, 582);
  endShape();
  line(570, 562, 520, 562);
}
void screenTwoGuitar() {
  noStroke();
  fill(#D67F27);
  ellipse(455, 340, 200, 200);
  ellipse(355, 340, 150, 150);
  fill(#955412);
  rect(480, 310, 500, 370);
  stroke(#955412);
  strokeWeight(50);
  line(60, 340, 370, 340);
  noStroke();
  fill(#B77E44);
  ellipse(420, 340, 95, 95);
  fill(#D67F27);
  rect(10, 310, 85, 370);
  strokeWeight(1);
  stroke(0);
  for (int l = 315 + (50/7); l > 315 && l < 365; l = l+(50/7)) {
    line(70, l, 490, l);
  }
}




void mousePressed() {
  if (mouseY < 595 && mouseY > 530 && mouseX > 420 && mouseX < 505) {
    if (mouseButton == LEFT) {
      opacityBeaker = 0;
      guitarStringFrequency=50;
      guitarStringLength=5;
    }
  }
  if (mouseY < 595 && mouseY > 530 && mouseX > 505 && mouseX < 590) {
    if (mouseButton == LEFT) {
      screenChange = !screenChange;
    }
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      guitarStringFrequency += 50;
    } else if (keyCode == DOWN) {
      guitarStringFrequency -= 50;
    } else if (keyCode == RIGHT) {
      guitarStringLength += 5;
    } else if (keyCode == LEFT) {
      guitarStringLength -= 5;
    }
  }
}