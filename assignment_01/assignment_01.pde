//////////////////////////////////////////
//    Ian Wolterstorff                  //
//    ARTG 2260, Programming Basics     //
//    wolterstorff.i@husky.neu.edu      //
//    Assignment 1                      //
//    "Dessine-moi un mouton"           //
//////////////////////////////////////////




// for graphical retrieval of point coordinates
ArrayList<PVector> loPoints;

final PVector[] sheepVertices = {
  new PVector(244, 225), 
  new PVector(315, 198), 
  new PVector(408, 194), 
  new PVector(474, 197), 
  new PVector(527, 216), 
  new PVector(553, 265), 
  new PVector(553, 318), 
  new PVector(510, 362), 
  new PVector(446, 373), 
  new PVector(388, 368), 
  new PVector(331, 358), 
  new PVector(267, 333), 
  new PVector(244, 283)
};

final PVector approxCenter = new PVector(409, 284);

void curveVertex(PVector p) {
  curveVertex(p.x, p.y);
}

void drawTuft(PVector p1, PVector p2) {
  beginShape();
  curveVertex(approxCenter);
  curveVertex(p1);
  curveVertex(p2);
  curveVertex(approxCenter);
  endShape();
}

void setup() {
  size(800, 600);

  // for graphical retrieval of point coordinates
  loPoints = new ArrayList<PVector>();
}


void draw() {
  background(153, 102, 51);

  // Create the ground and sky
  pushStyle();
  fill(230, 255, 255);
  noStroke();
  rect(0, 0, 800, 200);
  popStyle();

  // Draw the sheep's wooly coat
  // Based on function curveVertexCloud() by xperion at https://github.com/CodingTrain/CommunityClouds/blob/master/generators.js
  fill(255);
  for (int i = 0; i < sheepVertices.length-1; i++) {
    drawTuft(sheepVertices[i], sheepVertices[i+1]);
  }
  drawTuft(sheepVertices[sheepVertices.length-1], sheepVertices[0]);

  pushStyle();
  noStroke();
  beginShape();
  curveVertex(sheepVertices[sheepVertices.length-1]);
  for (PVector p : sheepVertices) {
    curveVertex(p);
  }
  curveVertex(sheepVertices[0]);
  endShape(CLOSE);
  popStyle();
  
  pushStyle();
  strokeWeight(3);
  line(508, 237, 560, 201);
  popStyle();
  
  ellipse(589, 177, 75, 100);
  pushStyle();
  fill(0);
  ellipse(572, 161, 20, 20);
  ellipse(601, 161, 20, 20);
  popStyle();
  
  pushStyle();
  strokeWeight(5);
  line(504, 322, 539, 398);
  line(469, 332, 470, 401);
  line(342, 322, 317, 394);
  line(295, 313, 262, 382);
  popStyle();
  

  // displays selected points for coordinate retrieval
  pushStyle();
  stroke(255, 0, 0);
  strokeWeight(5);
  for (PVector p : loPoints) {
    point(p.x, p.y);
  }
  popStyle();
}

// helps with graphical retrieval of point coordinates
void mousePressed() {
  println("X: " + mouseX + " Y: " + mouseY);
  loPoints.add(new PVector(mouseX, mouseY));
}