import processing.video.*;

Movie original;
Movie updated;

PShader selShader;
PShader originalShader;
PShader averageShader;
PShader lumaShader;
PShader edgesShader;
PShader sharpenShader;
PShader boxBlurShader;
PShader gaussianBlur3Shader;
PShader gaussianBlur5Shader;
PShader unsharpShader;
PShader asciiGrayShader;
PShader asciiColorShader;
boolean frameR;

void setup() 
{
  //Initialization
  size(1220, 600, P2D);
  original = new Movie(this, "launch2.mp4");
  original.loop();
  updated = new Movie(this, "launch2.mp4");
  updated.loop();
  frameR = false;
  
  //Load PShaders
  originalShader = loadShader("originalfrag.glsl");
  averageShader = loadShader("averagefrag.glsl"); 
  lumaShader = loadShader("lumafrag.glsl"); 
  edgesShader = loadShader("edgesfrag.glsl");
  sharpenShader = loadShader("sharpenfrag.glsl");
  boxBlurShader = loadShader("boxblurfrag.glsl");
  gaussianBlur3Shader = loadShader("blur3frag.glsl");
  gaussianBlur5Shader = loadShader("blur5frag.glsl"); 
  unsharpShader = loadShader("unsharpfrag.glsl"); 
  asciiGrayShader = loadShader("asciigrayfrag.glsl"); 
  asciiColorShader = loadShader("asciicolorfrag.glsl"); 
 
  //Initializewith default value
  selShader = originalShader;
  background(250,250,250);
  
}

void draw() 
{
  drawOriginal();
  drawUpdate();
  if (frameR)
  {
    println(frameRate);
  }
}

void movieEvent(Movie movie) {
  movie.read();  
}

void drawOriginal()
{
  stroke(255);
  image(original, 15, 70); 
  shader(originalShader);
}

void drawUpdate()
{
  stroke(255);
  image(updated, 635, 70); 
  shader(selShader);
}

void keyPressed()
{
  if (key == 'o')
  {
    println("convertion: original");
    selShader = originalShader;
  }
  else if (key == 'l')
  {
    println("convertion: luma");
    selShader = lumaShader;
  }
  else if(key == 'r')
  {
    println("convertion: average rgb");
    selShader = averageShader;
  }
  else if(key == 'a')
  {
    println("convertion: ascii color");
    selShader = asciiColorShader;
  }
  else if(key == 'x')
  {
    println("convertion: ascii gray");
    selShader = asciiGrayShader;
  }
  else if(key == 'e')
  {
    println("convolution: edge detection");
    selShader = edgesShader;
  }
  else if(key == 's')
  {
    println("convolution: sharpen");
    selShader = sharpenShader;
  }
  else if(key == 'b')
  {
    println("convolution: box blur");
    selShader = boxBlurShader;
  }
  else if(key == '3')
  {
    println("convolution: gaussian blur 3x3");
    selShader = gaussianBlur3Shader;
  }
  else if(key == '5')
  {
    println("convolution: gaussian blur 5x5");
    selShader = gaussianBlur5Shader;
  }
  else if(key == 'u')
  {
    println("convolution: unsharp masking 5x5");
    selShader = unsharpShader;
  }
  else if(key == 'f')
  {
    println("------------------- FRAMERATE ------------------- ");
    if (frameR){
      frameR = false;
    }
    else
    {
     frameR = true; 
    }
  }
}
