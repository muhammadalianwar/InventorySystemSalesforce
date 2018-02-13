@isTest
public class MyControllerTest{
    public static testMethod void testCalculateValues(){
        Test.startTest();
        MyController controller = new MyController(new MyService());
        controller.valueOne = 5;
        controller.valueTwo = 3;
        Integer totalValue = controller.calculatedTotalValue();
        Test.stopTest();
        
        System.assertEquals(8, totalValue, 'The service should return 8');
    }
}