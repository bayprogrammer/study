// Random Boxes r2017-05-21; by @bayprogrammer (Zeb DeOs).

const { setupCanvas } = bayprogrammer.p5;
const { Box, populateBoxes, showBoxes } = bayprogrammer.p5.RandomBoxes;

const DIM = 50;
const NBOXES = 20;

var boxes = [];

function setup() {
  setupCanvas(50, 50, 80, 100);
}

function draw() {
  showBoxes(populateBoxes(boxes));
}
