package test;

import assertLib.Assert;
import car.ParkAssistControllerClass;


static class ParkAssistControllerTest{
	
	ParkAssistControllerClass parkAssistController;
	
	@Test
	public void distance_0_3(){
		real res;
		real ultrasonic_distance = 0.3;
		real expected_result = 0.02;
		
		res = parkAssistController.getBrake(ultrasonic_distance);
		Assert.assertEqual(res, expected_result);
	}
	
	@Test
	public void distance_1_5(){
		real res;
		real ultrasonic_distance = 1.5;
		real expected_result = 0.1;
		res = parkAssistController.getBrake(ultrasonic_distance);
		
		Assert.assertEqual(res, expected_result);
	}

}