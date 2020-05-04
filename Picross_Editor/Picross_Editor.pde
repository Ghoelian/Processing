int level_width = 15;
int level_height = 15;
int offset_x;
int offset_y;

int[][] level;

void setup() {
  size(600, 600);

  offset_x = width / level_width;
  offset_y = height / level_height;

  level = new int[level_width][level_height];
}

void draw() {
  background(200);

  if (mousePressed && mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0) {
    int x = mouseX / offset_x;
    int y = mouseY / offset_y;

    if (mouseButton == LEFT) {
      level[x][y] = 1;
    }

    if (mouseButton == RIGHT) {
      level[x][y] = 0;
    }
  }

  for (int i = 0; i < level_width; i++) {
    for (int j = 0; j < level_height; j++) {
      if (level[i][j] == 1) {
        fill(0);
        rect(i * offset_x, j * offset_y, offset_x, offset_y);
      }
    }
  }

  for (int i = 1; i < level_width; i++) {
    if (i % 5 == 0) {
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }

    line(i * offset_x, 0, i * offset_x, height);
  }

  for (int i = 1; i < level_height; i++) {
    if (i % 5 == 0) {
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }

    line(0, i * offset_y, width, i * offset_y);
  }
}

void keyPressed() {
  if (keyCode == 67) {
    level = new int[level_width][level_height];
  }

  if (keyCode == 13 || keyCode == 10) {
    print("[\n");
    print("{ \"level\": 0, \"name\": \"name\", \"width\": " + level_width + ", \"height\": " + level_height + " },\n");

    for (int i = 0; i < level_width; i++) {
      print("{ ");

      for (int j = 0; j < level_height; j++) {
        if (j < level_height - 1) {
          print("\"" + j + "\": " + level[j][i] + ", ");
        } else {
          print("\"" + j + "\": " + level[j][i]);
        }
      }

      if (i < level_width - 1) {
        print(" },\n");
      } else {
        print(" }\n");
      }
    }

    println("]");
  }
}
