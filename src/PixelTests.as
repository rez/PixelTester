package
{
	import flash.display.Bitmap;

	public class PixelTests
	{
		public var iterations:uint = 20;
		public var description:String = "Testing pixel methods";
		
		[Embed(source="bboy.jpg")]
		private var src:Class;
		
		public var bm:Bitmap;
		
		public function PixelTests()
		{
			bm = Bitmap(new src());
		}
		
		public function setPixelTest():void
		{
			for(var y:uint=0; y<bm.height; y++)
			{
				for(var x:uint=0; x<bm.width; x++)
				{
					var pixel:uint = bm.bitmapData.getPixel(x, y);
					bm.bitmapData.setPixel(x, y, (pixel&0xFF)<<16 | (pixel&0xFF)<<8 | (pixel&0xFF));
				}
			}
		}
		
		public function setPixelOptimized():void
		{
			var w:int = bm.width;
			var h:int = bm.height;
			bm.bitmapData.lock();
			for(var y:uint=0; y<h; ++y)
			{
				for(var x:uint=0; x<w; ++x)
				{
					var pixel:uint = bm.bitmapData.getPixel(x, y);
					bm.bitmapData.setPixel(x, y, (pixel&0xFF)<<16 | (pixel&0xFF)<<8 | (pixel&0xFF));
				}
			}
			bm.bitmapData.unlock();
		}
		
		public function setVectorTest():void
		{
			var pv:Vector.<uint> = bm.bitmapData.getVector(bm.bitmapData.rect);
			var len:int = pv.length;
			
			for(var i:uint=0; i<len; ++i)
			{
				var val:uint = pv[uint(i)] & 0xFF;
				pv[uint(i)] = val<<16 | val<<8 | val;
			}
			
			bm.bitmapData.setVector(bm.bitmapData.rect, pv);
		}
	}
}