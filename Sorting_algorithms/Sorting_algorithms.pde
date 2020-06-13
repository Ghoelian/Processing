int amount; //<>//
float[] numbers;
float buffer;
int iterator = 0;
int checks = 0;
int totalIterations = 0;
boolean sorted = true;

void setup () {
  size(640, 400);

  amount = width / 3;
  numbers = new float[amount];

  for (int i = 0; i < amount; i++) {
    numbers[i] = random(height);
  }
  
  frameRate(500);
}

void draw () {
  for (int i = 0; i < 5; i++) {
    background(0);
    bubble(iterator);

    fill(255, 0, 0);
    textSize(20);
    text("Iterations: " + totalIterations, 0, 20);
    iterator++;
    checks++;
    text("Checks: " + checks, 0, 40);
  }

  int offset = 0;

  for (int j = 0; j < amount; j++) {
    stroke(255);

    if (j == iterator || j == iterator + 1) {
      stroke(255, 0, 0);
    }

    line(offset, height - numbers[j], offset, height);
    offset += 3;
  }
}

void bubble(int i) {
  buffer = numbers[i];

  if (numbers[i] > numbers[i+1]) {
    sorted = false;
    numbers[i] = numbers[i+1];
    numbers[i+1] = buffer;
  }

  if (iterator >= amount - 2) {
    iterator = -1;
    totalIterations++;

    if (sorted) {
      int offset = 0;
      
      for (int j = 0; j < amount; j++) {
        stroke(255);

        if (j == iterator || j == iterator + 1) {
          stroke(255, 0, 0);
        }

        line(offset, height - numbers[j], offset, height);
        offset += 3;
      }
      noLoop();
    }

    sorted = true;
  }
}

void improvedBubble(int i) {
  buffer = numbers[i];

  if (numbers[i] > numbers[i+1]) {
    sorted = false;
    numbers[i] = numbers[i+1];
    numbers[i+1] = buffer;
  }

  if (iterator >= amount - 2) {
    iterator = -1;
    totalIterations++;

    if (sorted) {
      int offset = 0;
      
      for (int j = 0; j < amount; j++) {
        stroke(255);

        if (j == iterator || j == iterator + 1) {
          stroke(255, 0, 0);
        }

        line(offset, height - numbers[j], offset, height);
        offset += 3;
      }
      noLoop();
    }

    sorted = true;
  }
}
