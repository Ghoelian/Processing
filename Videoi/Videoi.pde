import processing.video.*;
Movie video;
boolean recording = true;
float time = 0;

void setup() {
  size(1280, 720);
  frameRate(120);

  video = new Movie(this, "video.mp4");
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    recording = !recording;
  }
}

void draw() {  
  scale(-1, 1);
  image(video, -width, 0);

  if (recording) {
    video.play();
    video.jump(time);
    video.read();
    saveFrame("output/video_####.png");
    video.pause();
    time += 0.01667;
    println(time);
  } else {
    println("Finished!");
    noLoop();
  }
}
