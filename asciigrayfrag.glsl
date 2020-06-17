#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform vec3 iResolution;

varying vec4 vertColor;
varying vec4 vertTexCoord;

const vec4 identity = vec4(1.0, 1.0, 1.0, 0.0);

float character(int n, vec2 p)
{
  p = floor(p*vec2(4.0, -4.0) + 1.0);
  if (clamp(p.x, 0.0, 4.0) == p.x)
  {
    if (clamp(p.y, 0.0, 4.0) == p.y)	
    {
      int a = int(round(p.x) + 5.0 * round(p.y));
      if (((n >> a) & 1) == 1) return 1.0;
    }	
  }
  return 0.0;
}

void main() {

  int si = int(vertTexCoord.s * 512.0);
  int sj = int(vertTexCoord.t * 512.0);

  vec2 pix = vec2(si, sj);

  vec3 col = texture2D(texture, vec2(float(si) / 512.0, float(sj) / 512.0)).rgb;	

  float gray = 0.3 * col.r + 0.59 * col.g + 0.11 * col.b;
	
  int n =  4096;                // .
  if (gray > 0.2) n = 65600;    // :
  if (gray > 0.3) n = 332772;   // *
  if (gray > 0.4) n = 15255086; // o 
  if (gray > 0.5) n = 23385164; // &
  if (gray > 0.6) n = 15252014; // 8
  if (gray > 0.7) n = 13199452; // @
  if (gray > 0.8) n = 11512810; // #
	
  vec2 p = mod(pix/4.0, 2.0) - vec2(1.0);
  col = gray*vec3(character(n, p));	

  gl_FragColor = vec4(col, 1.0) * vertColor;

}
