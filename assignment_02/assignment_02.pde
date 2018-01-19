//////////////////////////////////////////
//    Ian Wolterstorff                  //
//    ARTG 2260, Programming Basics     //
//    wolterstorff.i@husky.neu.edu      //
//    Assignment 2                      //
//    "Desert Solitude"                 //
//////////////////////////////////////////



final PVector[] pondVertices = {
  new PVector(183, 305),
  new PVector(202, 254),
  new PVector(264, 232),
  new PVector(336, 241),
  new PVector(394, 225),
  new PVector(451, 241),
  new PVector(526, 263),
  new PVector(604, 311),
  new PVector(607, 385),
  new PVector(620, 417),
  new PVector(592, 437),
  new PVector(526, 433),
  new PVector(485, 399),
  new PVector(397, 398),
  new PVector(322, 371),
  new PVector(272, 357),
  new PVector(215, 337)
};

final PVector[] grassPoints = {
  new PVector(188, 334),
  new PVector(220, 350),
  new PVector(243, 368),
  new PVector(279, 380),
  new PVector(308, 390),
  new PVector(339, 394),
  new PVector(373, 414),
  new PVector(414, 421),
  new PVector(446, 436),
  new PVector(501, 445),
  new PVector(541, 453),
  new PVector(588, 455),
  new PVector(635, 441),
  new PVector(645, 417),
  new PVector(612, 449),
  new PVector(564, 457),
  new PVector(471, 440),
  new PVector(393, 423),
  new PVector(338, 406)
};


size(800, 600);

background(153, 102, 51);

pushStyle();
fill(230, 255, 255);
noStroke();
rect(0, 0, 800, 200);
popStyle();

pushStyle();
fill(100, 149, 237);
beginShape();
for (PVector p : pondVertices) {
  curveVertex(p.x, p.y);
}
curveVertex(pondVertices[0].x, pondVertices[0].y);
endShape(CLOSE);
popStyle();

pushStyle();
fill(139, 119, 101);
triangle(691, 230, 733, 119, 760, 223);
triangle(731, 228, 776, 141, 797, 222);
popStyle();

pushStyle();
stroke(107, 142, 35);
strokeWeight(3);
for (PVector p : grassPoints) {
  line(p.x, p.y, p.x, p.y-40);
}
popStyle();