PImage img;
void setup(){
  size(900,700);
    img = loadImage("78173.jpg");
}
void draw(){
  background(0);
  image(img,0,0);
}