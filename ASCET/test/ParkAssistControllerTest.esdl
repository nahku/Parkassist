package test;

import assertLib.Assert;
import car.ParkAssistControllerClass;

static class ParkAssistControllerTest{
	
	ParkAssistControllerClass parkAssistController;
	
	@Test
	public void time_0_0(){
		real res;
		real time = 0.0;
		real expected_result = 0.0;
		
		res = parkAssistController.getBrake(time);
		Assert.assertEqual(res, expected_result);
	}
	
	@Test
	public void time_0_6(){
		real res;
		real time = 0.6;
		real expected_result = 0.078;
		res = parkAssistController.getBrake(time);
		
		Assert.assertEqual(res, expected_result);
	}
	
	@Test
	public void time_2_0(){
		real res;
		real time = 2.0;
		real expected_result = 0.0;
		res = parkAssistController.getBrake(time);
		
		Assert.assertEqual(res, expected_result);
	}

}