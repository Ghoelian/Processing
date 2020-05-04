int amount; //<>//
float[] numbers;
float buffer;
int iterator = 0;
int totalIterations = 0;
boolean sorted = true;

void setup () {
  size(640, 400);
  
  amount = width / 3;
  numbers = new float[amount];
  
  for (int i = 0; i < amount; i++) {
    numbers[i] = random(height);
  }

  frameRate(144);
}

void draw () {
  for (int i = 0; i < 5; i++) {
    background(0);
    bubble(iterator);

    int offset = 0;

    for (int j = 0; j < amount; j++) {
      stroke(255);

      if (j == iterator || j == iterator + 1) {
        stroke(255, 0, 0);
      }

      line(offset, height - numbers[j], offset, height);
      offset += 3;
    }

    fill(255, 0, 0);
    textSize(20);
    text(round(totalIterations), 0, 20);
    iterator++;
  }
}

void bubble(int i) {
  buffer = numbers[i];

  if (numbers[i] > numbers[i+1]) {
    sorted = false;
    numbers[i] = numbers[i+1];
    numbers[i+1] = buffer;
  }

  if (iterator >= amount - 2 - totalIterations) {
    iterator = -1;
    totalIterations++;

    if (sorted) {
      println(numbers);
      noLoop();
    }

    sorted = true;
  }
}
