@isTest
private class TestingCourseTest {

    @isTest static void testSaveCourse(){
        Course c=new Course();
        c.singleCourse.Name='Ali';
        c.singleCourse.CreditHrs__c='3';
        c.saveCourse();
        c.courseId=c.singleCourse.Id;
        c.singleCourse.Name=null;
        c.singleCourse.CreditHrs__c='3';
        c.saveCourse();
        c.saveEditCourse();
        c.singleCourse.Id=null;
        c.saveEditCourse();
        c.courseId=c.singleCourse.Id;
       	Course__c cou=new Course__c(Name='AI', CreditHrs__c='4');
		insert cou;
		c.courseId=cou.Id;        
        c.getCourseForEdit();
        
    }
    
    @isTest static void testdelete()
    {
       	Course c=new Course();
        Course__c cou=new Course__c(Name='AI', CreditHrs__c='4');
		insert cou;
		c.courseId=cou.Id;
        c.delCourse();
        c.delCourse();
    }
    
}