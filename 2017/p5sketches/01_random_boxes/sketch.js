document.addEventListener('DOMContentLoaded', () => {
  ns('bayprogrammer.p5.RandomBoxes.sketch', () => {

    // Random Boxes r2017-05-21e; by @bayprogrammer (Zeb DeOs).

    const { setupCanvas } = bayprogrammer.p5;
    const { populateBoxes, showBoxes } = bayprogrammer.p5.RandomBoxes;

    const DIM = 50;
    const NBOXES = 20;
    var boxes = [];

    window.setup = () => setupCanvas(50, 50, 80, 100);
    window.draw  = () => showBoxes(populateBoxes(boxes, NBOXES, DIM, DIM));

  });
});
