/** next *********************************************************************/

file('sketch.js', (module) => {
  const { setupCanvas } = require('boilerplate.js');

  window.setup => () { /* ... */ };
  window.draw  => () { /* ... */ };
});

file('boilerplate.js', (module) => {
  const { foo, bar, baz } = require('foo.js');

  function setupCanvas() {
    // do stuff
  }

  module.exports = { setupCanvas };
});


// TODO(zmd): to unwrap the chain, we'll probably still need to use the
// document ready event

/*
  Our require will have some limitations. Must be restricted to top scope of
  iffe, and (not counting comments) must precede all other statements (no
  interleved statements prior to end of require zone, else they will be
  ignored!)

  what if someone tried to directly require into a a structure of some kind?

  var foo = {
    my_thingy: require('thingies.js'),
    funky: () => {
      require('I shouldn't be able to do this!!!')
    }
  }

  Probably will not allow that either for this mini-shim (just for
  openprocessing-type things). So another limitation is: restricted to the form
  of (after having split on newlines and semicolons)
*/

  // /^ *(const|let|var) *= *require *\( *['"](.+)['"] *\).*/

/*
  Note we only support single and double quotes (not dynamic strings from
  variables or template strings...)

  What about stuff like:

  const { foo,
          bar,
          baz } = require('whatever.js');
*/

  // /^ *(const|let|var) *{? *[a-zA-Z0-9$_,\n ] *}? *= *require *\([ \n]*['"](.+)['"][ \n]*\).*/

/*
  after the function opening stuff, excluding comment lines and empty lines,
  every semicolon-split segment should match that form; the first that doesn't
  ENDS the "require zone"
*/

// TODO(zmd): index.js TODO(zmd): need to work out how to delay inialization
// until after document loads...
function require(n){
  var f;m=file.m[n]||return;m.r.forEach(r=>f=file.m[r].f&&f());return m}
function file(n, f){
  var r=_fr(f);m=file.m=file.m||{};
  f=()=>{m[n].f=null;f()};m[n]={n,f,r};n=='sketch.js'&&f()}
function _fr(f){ // find requires
  var c=/^ *\/\*.*?*/;var cc=/^ *\/\/.*\n/;
  var r=/^ *(const|let|var) *{? *[a-zA-Z0-9$_,\n ] *}? *= *require *\([ \n]*['"](.+)['"][ \n]*\).*/;
  var m,rs=[],ss=f.toString.split(';'),i=0;for(;i<ss.length;i++){
    s=ss[i];s.match(c)||s.match(cc)||( m=s.match(r)&&rs.push(m[1]))||break}
  return rs}

/** current ******************************************************************/

ns('bayprogrammer.p5.setupCanvas', () => (_, ...bg) => {
  createCanvas(windowWidth, windowHeight); background(...bg) });

function ns(n, f) { var p = window, s = n.split('.'), t = s.splice(-1);
                    s.forEach(k => p = (p[k] = p[k] || {})); p[t] = f() }

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
