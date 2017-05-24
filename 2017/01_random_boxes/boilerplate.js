ns('bayprogrammer.p5.setupCanvas', () => (_, ...bg) => {
  createCanvas(windowWidth, windowHeight); background(...bg) });

function ns(n, iife) { var p = window, s = n.split('.'), t = s.splice(-1);
                       s.forEach(k => p = (p[k] = p[k] || {})); p[t] = iife() }

/** internal boilerplate *****************************************************/

ns('bayprogrammer.p5.setupCanvas', () => {

  var _w;
  var _h;

  var _setupStyle = function(margin, canvas_bg) {
    background(...canvas_bg);

    var page_bg = [];
    page_bg[0] = canvas_bg[0] + 20;
    page_bg[1] = canvas_bg[1] + 20;
    page_bg[2] = canvas_bg[2] + 20;

    var canvasEle = document.getElementsByTagName('canvas')[0];
    canvasEle.style.display = 'block';
    canvasEle.style.padding = '0';
    canvasEle.style.margin = '0';
    canvasEle.style.marginLeft = 'auto';
    canvasEle.style.marginRight = 'auto';
    canvasEle.style.marginTop = `${margin/2}px`;

    var htmlEle = document.getElementsByTagName('html')[0];
    htmlEle.style.backgroundColor = (
      `rgb(${page_bg[0]}, ${page_bg[1]}, ${page_bg[2]})`);
    htmlEle.style.margin = '0';
    htmlEle.style.padding = '0';
    htmlEle.style.width = '100%';

    var bodyEle = document.getElementsByTagName('body')[0];
    bodyEle.style.margin = '0';
    bodyEle.style.padding = '0';
    bodyEle.style.width = '100%';
  };

  return function(margin, ...canvas_bg) {
    _w = () => windowWidth - margin;
    _h = () => windowHeight - margin;

    createCanvas(_w(), _h());
    _setupStyle(margin, canvas_bg);

    windowResized = () => {
      resizeCanvas(_w(), _h());
      _setupStyle(margin, canvas_bg);
    };
  };

});
