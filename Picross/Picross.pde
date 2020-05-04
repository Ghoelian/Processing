int currentLevel = 1;
int level_width;
int level_height;
int offset_x;
int offset_y;

int prev_x_draw;
int prev_y_draw;
int prev_op = 1;

int prev_x_mark;
int prev_y_mark;

boolean draw = false;
boolean mark = false;
boolean solved = false;

JSONArray levels;

int[][] level_solution;
int[][] level_current;

void setup() {
  levels = loadJSONArray("levels.json");
  size(600, 600);

  loadLevel(1);
}

void draw() {
  background(200);
  if (solved) {
    for (int i = 0; i < level_width; i++) {
      for (int j = 0; j < level_height; j++) {
        if (level_current[i][j] == 1) {
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
    
    textSize(100);
    text("Solved", 0, height);
    noLoop();
  } 
  
  if (!solved) {
    if (draw && mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0) {
      int x = mouseX / offset_x;
      int y = mouseY / offset_y;

      if (x != prev_x_draw || y != prev_y_draw) {
        prev_x_draw = x;
        prev_y_draw = y;

        level_current[x][y] = 1;

        if (checkLevel()) {
          solved = true;
        }
      }
    }

    if (mark && mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0) {
      int x = mouseX / offset_x;
      int y = mouseY / offset_y;

      if (x != prev_x_mark || y != prev_y_mark) {
        prev_x_mark = x;
        prev_y_mark = y;

        if (mouseButton == RIGHT) {
          level_current[x][y] = 0;
        }

        if (checkLevel()) {
          solved = true;
        }
      }
    }

    for (int i = 0; i < level_width; i++) {
      for (int j = 0; j < level_height; j++) {
        if (level_current[i][j] == 1) {
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
}

void loadLevel(int id) {
  JSONArray level = levels.getJSONArray(id - 1);

  level_width = level.size() - 1;
  level_height = level.getJSONObject(1).size();

  level_solution = new int[level_width][level_height];
  level_current = new int[level_width][level_height];

  for (int i = 0; i < level.size()-1; i++) {
    JSONObject row = level.getJSONObject(i+1);

    for (int j = 0; j < row.size(); j++) {
      level_solution[j][i] = row.getInt(str(j));
    }
  }

  offset_x = width / level_width;
  offset_y = height / level_height;
}

boolean checkLevel() {
  for (int i = 0; i < level_current.length; i++) {
    for (int j = 0; j < level_current[0].length; j++) {
      if (level_current[i][j] != level_solution[i][j]) {
        return false;
      }
    }
  }

  return true;
}

void mousePressed() {
  if (mouseButton == LEFT) {
    draw = true;
  }

  if (mouseButton == RIGHT) {
    mark = true;
  }
}

void mouseReleased() {
  if (draw) {
    draw = !draw;
  }

  if (mark) {
    mark = !mark;
  }
}
