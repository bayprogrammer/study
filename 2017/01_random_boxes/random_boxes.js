ns('bayprogrammer.p5.RandomBoxes', () => {

  class Box {
    constructor(x, y, w, h) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
    }

    show() {
      noStroke();
      fill(random(255), random(255), random(255), random(150, 200));
      rect(this.x, this.y, this.w, this.h);
    }
  }

  function populateBoxes(boxes, n, w, h) {
    for (var i = 0; i < n; i++)
      boxes[i] = new Box(random(width), random(height), w, h);
    return boxes;
  }

  function showBoxes(boxes) {
    boxes.forEach(box => box.show());
    return boxes;
  }

  return { populateBoxes, showBoxes };

});
