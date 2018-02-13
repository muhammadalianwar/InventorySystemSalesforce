@isTest
private class TestStudentRecord {
    
    @isTest static void testSaveStudent(){
        StudentRecord rec =new StudentRecord();
        rec.saveSingleStudent.Name='Ali';
        rec.saveSingleStudent.FatherName__c='Anwar';
        rec.saveStudent();
        rec.saveSingleStudent.Name=null;
        rec.saveStudent();
        rec.saveSingleStudent.Name='Muhammad Ali';
        
        rec.saveEditStudent();
        rec.saveSingleStudent.Id=null;
        rec.saveEditStudent(); 
        
    }
    
    @isTest static void testdelStudent(){
        StudentRecord rec =new StudentRecord();
        rec.saveSingleStudent.Name='Ali';
        rec.saveSingleStudent.FatherName__c='Anwar';
        rec.saveStudent();
        rec.studentId=rec.saveSingleStudent.Id;
        rec.delStudent();
        rec.delStudent();
        
        
    }
    
    @isTest static void testgetStudentForEdit(){
        StudentRecord rec =new StudentRecord();
        rec.saveSingleStudent.Name='Ali';
        rec.saveSingleStudent.FatherName__c='Anwar';
        rec.saveStudent();
        rec.studentId=rec.saveSingleStudent.Id;
        rec.getStudentForEdit();
    }
    
    @isTest static void testgetStudentCourses(){
        StudentRecord rec =new StudentRecord();
        Student__c stu=new Student__c(Name='Ali' ,FatherName__c='Anwar');
        insert stu;
        Course__c c=new Course__c();
        c.Name='java';
        c.CreditHrs__c='3';
        insert c;
        //StudentCourse__c stdCourse=new StudentCourse__c(Name='AliCourse');
        rec.studentId=stu.Id;
        rec.selectedCoursesList=c.Id;
        rec.registerdCourse();
        rec.studentId=stu.Id;
        rec.getStudentCourses();
    }
    
    @isTest static void testgetCoursesList(){
        StudentRecord rec =new StudentRecord();
        Course__c c=new Course__c();
        c.Name='java';
        c.CreditHrs__c='3';
        insert c;
        rec.getCoursesList();
    }
   
    


}