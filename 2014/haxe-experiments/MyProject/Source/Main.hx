package;

import openfl.display.Sprite;
import flash.display.BitmapData;
import flash.display.Bitmap;
//import flash.display.Sprite;
import openfl.Assets;

class Main extends Sprite {
    public function new() {
        super();
        var bitmapData = Assets.getBitmapData("assets/SketchMapOfCoosBay.png");
        var bitmap = new Bitmap(bitmapData);

        addChild(bitmap);

        bitmap.x = 200;
        bitmap.y = 100;
    }
}
