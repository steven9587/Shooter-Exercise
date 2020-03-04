class Meat {
  int x, y;
  int speed;
  boolean life;

  void meat(int x, int speed) {
    this.x = x;
    this.speed = speed;
    y = 0;
    life = true;
  }

  void drop() {
    y += speed;
    if (y > height) {
      life = false;
    }
  }

  void show() {
    if (life == true) {
      noStroke();
      image(meat, x, y, 80, 80);
    }
  }
}
