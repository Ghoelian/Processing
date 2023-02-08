ArrayList<Ball> balls = new ArrayList<Ball>();
float sizeFactor = 0.065;

void setup() {
  size(1280, 720);

  balls.add(new Ball(width/2, height/2, 20, 5, floor(random(255)), floor(random(255)), floor(random(255))));
  
  float asdf = 1.5;
  println(pow((sizeFactor * 20) + 0.5, asdf));
  println(pow((sizeFactor * 50) + 0.5, asdf));
  println(pow((sizeFactor * 100) + 0.5, asdf));
}

void draw() {
  background(170);

  fill(0);
  text(floor(frameRate) + " fps", 0, 10);

  for (int i = 0; i < balls.size(); i++) {
    Ball ball = balls.get(i);

    float halfSize = ball.size / 2;
    float maxHeight = height - halfSize - 1;

    fill(ball.r, ball.g, ball.b);

    // Don't bother with all the maths for balls that aren't moving
    if (ball.stopped) {
      ellipse(ball.x, maxHeight, ball.size, ball.size);
    } else {
      ball.speed += sizeFactor * ball.size;

      ball.y += ball.speed;

      // Reverse ball speed when it reaches the bottom of the canvas
      if (ball.y >= maxHeight) {
        ball.speed *= -1;
      }
      
      float minSpeed = pow((sizeFactor * ball.size) + 0.5, 1.5);

      // If the ball is near the bottom of the canvas, and is going slowly enough, just consider it stopped
      // Adding 0.5 to the used speed to prevent larger balls from vibrating unnaturally quickly
      if (ball.y > maxHeight && ball.speed < minSpeed && ball.speed > -minSpeed) {
        ball.y = maxHeight;
        ball.speed = 0;
        ball.stopped = true;
      }

      // Just to make sure the ball never gets out of bounds
      if (ball.y > maxHeight) {
        ball.y = maxHeight;
      }

      ellipse(ball.x, ball.y, ball.size, ball.size);
    }
  }
}

void mouseClicked() {
  balls.add(new Ball(mouseX, mouseY, random(10, 100), 5, floor(random(255)), floor(random(255)), floor(random(255))));
}

void keyPressed() {
  if (key == 'r') {
    balls = new ArrayList<Ball>();
  }
}
