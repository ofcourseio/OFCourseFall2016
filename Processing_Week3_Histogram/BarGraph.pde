class BarGraph {
  int gx = 0;
  int gy = 0;
  int gw = 0;
  int gh = 0;

  int maxValue = 0;

  int history[];

  BarGraph(int nx, int ny, int nw, int nh, int historySize) {
    gx = nx;
    gy = ny;
    gw = nw;
    gh = nh;

    history = new int[historySize];
  }

  void addValue(int newValue) {
    for (int i = 0; i < history.length - 1; i = i + 1) {
      history[i] = history[i + 1];
    }

    history[history.length - 1] = newValue;

    if (newValue > maxValue) {
      maxValue = newValue;
    }
  }

  void draw() {
    noStroke();
    fill(120);

    for (int i = 0; i < history.length; i = i + 1) {
      int w = gw / history.length;
      int x = i * w;
      int h = int((float(history[i]) / maxValue) * gh);
      int y = gh - h;

      rect(x + gx, y + gy, w, h);
    }

    text(history[history.length - 1] + " | " + maxValue, gx + 10, gy + 20);

    stroke(120);
    noFill();
    rect(gx, gy, gw, gh);
  }
}
