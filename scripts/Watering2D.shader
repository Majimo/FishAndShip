shader_type canvas_item;
uniform float size;
uniform float size2;
varying vec2 vertex_position;
uniform sampler2D mask_texture;

void vertex() {
  // Animate Sprite moving in big circle around its location
  VERTEX += vec2(cos(TIME*size2*8.0+VERTEX.x*11.1+VERTEX.y*11.1)*2.0, sin(TIME*size2*8.1-VERTEX.x*5.1+VERTEX.y*11.1));
}


void fragment(){
  COLOR = texture(TEXTURE, UV); //read from texture
 
}