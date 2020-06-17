#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

const vec4 lumcoeff = vec4(0.299, 0.587, 0.114, 0.0);
const vec4 lumcoeff2 = vec4(0.21, 0.72, 0.07, 0.0);

void main() {
  float lum;
  vec4 temp;  

  lum = dot(texture2D(texture, vertTexCoord.st), lumcoeff2);
  gl_FragColor = vec4(lum, lum, lum, 1.0); 
}
