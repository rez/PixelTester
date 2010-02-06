package
{	
	import com.gskinner.utils.PerformanceTest;
	
	import flash.display.Sprite;
	import flash.utils.setTimeout;
	
	[SWF(width='485', height='332', backgroundColor='#000000', frameRate='30')]
	
	public class PT extends Sprite
	{	
		private var pixelTest:PixelTests;
		
		public function PT()
		{
			pixelTest = new PixelTests();
			addChild(pixelTest.bm);
			setTimeout(startTest, 2000);
		}
		
		private function startTest():void
		{
			var pt:PerformanceTest = PerformanceTest.getInstance();
			pt.testSuite(pixelTest);
		}
	}
}