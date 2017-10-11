/*
 * Waves of color, in the HSV color space.
 *
 * This effect illustrates some of the properties of Fadecandy's dithering.
 * Hotkeys turn on/off various Fadecandy features. This file drives the
 * simple UI for doing so, and the actual effect is rendered entirely by a shader.
 */

PShader effect;
OPC opc;

void setup() {
  size(640, 360, P2D);
  frameRate(30);
  
  effect = loadShader("effect.glsl");
  effect.set("resolution", float(width), float(height));

  opc = new OPC(this, "127.0.0.1", 7890);
  int index = 0;
  float y_spacing = 2;
  float x_spacing = 2;
  
  int sets = 5;
  float x = width / 2 - (sets*4/2)*y_spacing;
  for(int j = 0;j < sets;j++) {
    for(int i = 0;i < 70;i++) {
      opc.led(index++, (int)x, (int)( height - i*y_spacing - 1));
    }
    x += x_spacing;
    for(int i = 0;i < 82;i++) {
      opc.led(index++, (int)x, (int)( height - i*y_spacing - 1));
    }
    x += x_spacing;
    for(int i = 0;i < 84;i++) {
      opc.led(index++, (int)x, (int)( height - i*y_spacing - 1));
    }
    x += x_spacing;
    for(int i = 0;i < 84;i++) {
      opc.led(index++, (int)x, (int)( height - i*y_spacing - 1));
    }
    x += x_spacing;
  }
}


void draw() {
  // The entire effect happens in a pixel shader
  effect.set("time", millis() / 1000.0);
  shader(effect);
  rect(0, 0, width, height);
  resetShader();

  // Status text
  textSize(12);
}