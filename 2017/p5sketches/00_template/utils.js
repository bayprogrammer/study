/** utils.js *****************************************************************/

function ns(ns, obj, root) {
  root = findGlobal(root);

  var target;
  var parent = root;
  var segments = ns.split('.');

  for (var i = 0; i < segments.length; i++) {
    if (i == segments.length - 1) {
      target = segments[i];
    } else {
      parent[segments[i]] = parent[segments[i]] || {};
      parent = parent[segments[i]];
    }
  }

  parent[target] = obj;
}

function findGlobal(root) {
  if (!root) {
    if (window !== undefined) {
      root = window;
    } else if (global !== undefined) {
      root = global;
    } else {
      throw 'Unable to find global object!';
    }
  }

  return root;
}

ns('bayprogrammer.p5.setupCanvas', (function() {

  // TODO: make it possible to set canvas dimensions

  return function (margin, ...canvas_bg) {
    createCanvas(windowWidth - margin, windowHeight - margin);
    background(...canvas_bg);
  };

})());

/** utils.js (internal) ******************************************************/

ns('bayprogrammer.p5.setupCanvas', (function() {

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

  // TODO: make it possible to set canvas dimensions

  return function(margin, ...canvas_bg) {
    _w = () => windowWidth - margin;
    _h = () => windowHeight - margin;

    createCanvas(_w(), _h());
    _setupStyle(margin, canvas_bg);

    findGlobal().windowResized = () => {
      resizeCanvas(_w(), _h());
      _setupStyle(margin, canvas_bg);
    };
  };

})());
