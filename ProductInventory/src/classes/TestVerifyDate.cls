@isTest
public class TestVerifyDate {
    @isTest static void CheckDatesTest1(){
        date d= date.newInstance(2017, 8, 27);
        date d2= date.newInstance(2017, 9, 5);
        date result=VerifyDate.CheckDates(d, d2);
        System.assertEquals(d2,result);
        
    }
    
    @isTest static void CheckDatesTest2(){
        date d= date.newInstance(2017, 7, 27);
        date d2= date.newInstance(2017, 9, 5);
        date result=VerifyDate.CheckDates(d, d2);
        
        
        Integer totalDays = Date.daysInMonth(d.year(), d.month());
		Date lastDay = Date.newInstance(d.year(), d.month(), totalDays);
        
        System.assertEquals(lastDay,result);
        
    }
    
    @isTest static void CheckDatesTest3(){
        date d= date.newInstance(2017, 10, 27);
        date d2= date.newInstance(2017, 9, 5);
        date result=VerifyDate.CheckDates(d, d2);
        
        
        Integer totalDays = Date.daysInMonth(d.year(), d.month());
		Date lastDay = Date.newInstance(d.year(), d.month(), totalDays);
        
        System.assertEquals(lastDay,result);
        
    }
    
    
}