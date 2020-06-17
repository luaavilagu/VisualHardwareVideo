#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

const vec4 identity = vec4(1.0, 1.0, 1.0, 0.0);

void main() {
  float rgb;

  rgb = dot(identity, texture2D(texture, vertTexCoord.st));
  gl_FragColor = (1.0/3.0) * (vec4(rgb, rgb, rgb, 1.0)); 
}
