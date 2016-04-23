OPC opc;
PImage dot;

void setup()
{
  //size(800, 400);

  dot = loadImage("dot.png");

  size(640, 320);

   // Connect to an LEDscape opc-rx process. Only one client can be connected at a time.
  opc = new OPC(this, "192.168.7.2", 7890);
  // Map an 16x16 grid of LEDs to the center of the window, scaled to take up most of the space
  //float spacing = height / 32.0;
  //opc.ledGrid16x16(0,    width * 2/8, height*1/4, spacing, 0, true);
  //opc.ledGrid16x16(256,  width * 4/8, height*1/4, spacing, 0, true);
  //opc.ledGrid16x16(512,  width * 6/8, height*1/4, spacing, 0, true);
  //opc.ledGrid16x16(768,  width * 2/8, height*3/4, spacing, 0, true);
  //opc.ledGrid16x16(1024, width * 4/8, height*3/4, spacing, 0, true);
  //opc.ledGrid16x16(1280, width * 6/8, height*3/4, spacing, 0, true);
  
  // Map one 64-LED strip to the center of the window
  opc.ledStrip(0, 180, width/2, height/2, width / 200.0, 0, false);
}

void draw()
{
  background(0);
  
  // Change the dot size as a function of time, to make it "throb"
  float dotSize = height/2 * 0.6 * (0.5 + 1.0 * sin(millis() * 0.001));
  
  // Draw it centered at the mouse location
  image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
}