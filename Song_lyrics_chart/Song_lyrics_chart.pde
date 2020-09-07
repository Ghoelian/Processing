String[] lyricsArray; //<>//
String[] lyricsSplit;
boolean[][] grid;
int gridSize;
int pgWidth;
int pgHeight;
int yOffset;
float colour;
int floatSize;
float xOffset;
float fontSize;
String lyricsString;

Lyrics lyrics = new Lyrics();
Graph graph = new Graph();
PgStuff pgStuff = new PgStuff();

void setup() {
  size(1063, 1041);

  initialize();
  pgStuff.doTheStuff();
}

void initialize() {
  lyricsArray = loadStrings("lyrics.txt");
  lyricsString = lyrics.joinLyrics().toLowerCase();

  lyricsSplit = split(lyricsString, " ");
  floatSize = lyricsSplit.length;
  fontSize = floatSize / 2.5;
  xOffset = floatSize * 2.5;
  yOffset = 10;

  grid = new boolean[floatSize][floatSize];
  lyrics.stripChars();

  findSize();
}

void findSize() {
  for (float i = 1; i < 10000; i++) {
    if ((i / floatSize) % 1 == 0) {
      println((int(i) + int(xOffset)) + " x " + (int(i) + yOffset));
      pgWidth = (int(i) + int(xOffset));
      pgHeight = (int(i) + yOffset);
    }
  }
}
