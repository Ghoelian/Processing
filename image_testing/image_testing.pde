PImage original;
PImage scaled;
PImage test = new PImage(2, 2, RGB);

PFont Courier;

int scale_factor = 32;
int offset;

void setup() {
  size(1280, 960);
  noSmooth();
    
  original = loadImage("img.jpg");
  scaled = original;
  
  scaled.resize(original.width/scale_factor, 0);
  
  original.loadPixels();
  scaled.loadPixels();
  
  offset = width / scaled.width;
  
  Courier = createFont("Courier New", offset, true);
}

void draw() {
  background(0);
  image(scaled, 0, 0, width, height);
  
  for (int i = 0; i < scaled.width; i++) {
    for (int j = 0; j < scaled.height; j++) {
      fill(scaled.get(i, j));
      textAlign(CENTER, CENTER);
      textFont(Courier);
      textSize(offset);
      
      text("0", i*offset+(offset/2), j*offset+(offset/2));
    }
  }
}
