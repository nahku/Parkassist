package test;

import assertLib.Assert;
import car.PulseSignalClass;

static class PulseSignalTest{
	
	PulseSignalClass pulseSignal;
	
	@Test
	public void continuousPulse(){
		real res;
		real frequency = 10.0;
		
		res = pulseSignal.calc(frequency);
		Assert.assertEqual(res, 1.0);
	}
	
	@Test
	public void noPulse(){
		real res;
		real frequency = 0.0;
		
		res = pulseSignal.calc(frequency);
		Assert.assertEqual(res, 0.0);
	}

}