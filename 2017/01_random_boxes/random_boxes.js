ns('bayprogrammer.p5.RandomBoxes.Box', (function() {

  return function(x, y, w, h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.show = function() {
      noStroke();
      fill(random(255), random(255), random(255), random(150, 200));
      rect(this.x, this.y, this.w, this.h);
    };
  };

})());


ns('bayprogrammer.p5.RandomBoxes.populateBoxes', (function() {

  return function(boxes, n, w, h) {
    for (var i = 0; i < n; i++) {
      boxes[i] = new Box(random(width), random(height), w, h)
    }

    return boxes;
  }

})());


ns('bayprogrammer.p5.RandomBoxes.showBoxes', (function() {

  return function(boxes) {
    for (var i = 0; i < boxes.length; i++) {
      boxes[i].show();
    }

    return boxes;
  }

})());
