shader_type canvas_item;
uniform float size;
varying vec2 vertex_position;
uniform sampler2D mask_texture;
varying flat vec3 C;
void vertex() {
  // Animate Sprite moving in big circle around its location
 	//C = COLOR.rgb;
}


void fragment(){
  vec4 CC = texture(TEXTURE, UV); //read from texture
  float Cgreycale = CC.r/3.0+CC.g/3.0+CC.b/3.0;
  CC.rgb = vec3(Cgreycale,Cgreycale,Cgreycale);
  COLOR = CC;
}