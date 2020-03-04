class Bullet {
  int x, y;
  boolean life;

  void bullet(int x, int y) {
    this.x = x;
    this.y = y;
    life = true;
  }

  void shoot() {
    y -= 5;
    if (y < 0) {
      life = false;
    }
  }

  void show() {
    if (life == true) {
      noStroke();
      fill(0);
      ellipse(x, y, 10, 10);
    }
  }
}
