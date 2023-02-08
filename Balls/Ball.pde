class Ball {
  float x;
  float y;
  float speed;
  float size;

  int r;
  int g;
  int b;
  
  boolean stopped = false;

  Ball(float x, float y, float size, float speed, int r, int g, int b) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;

    this.r = r;
    this.g = g;
    this.b = b;
  }
}
