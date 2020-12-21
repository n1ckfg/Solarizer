PImage img;
float threshold = 0;
float thresholdMax = 255;

void setup() {
 size(50, 50, P2D);
 img = loadImage("food_bowl.jpg");
 img.resize(img.width/2, img.height/2);
 img.loadPixels();
 surface.setSize(img.width, img.height);
}

void draw() {
  for(int i=0; i<img.pixels.length; i++) {
    color col = img.pixels[i];
    if (brightness(col) < threshold) {
      img.pixels[i] = color(255-red(col), 255-green(col), 255-blue(col));
    }
  }
   
  img.updatePixels();
 
  threshold++;
  if (threshold > thresholdMax) threshold = 0;
   
  image(img, 0, 0);
}
