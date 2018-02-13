public class Course {
    
    public List<Course__c> courses {get;set;}
    public Course__c singleCourse {get;set;}
    public Id courseId {get;set;}
    public String errorMsg {get;set;}
    
    public Course(){
        courses = new List<Course__c>();
        singleCourse =new Course__c();
        courses=getCourses();
    }
    
    public List<Course__c> getCourses(){
        List<String> fields=new List<String>(Schema.SObjectType.Course__c.fields.getMap().keySet());
        String coursef='';
        for(String c:fields ){
            
            coursef += c+',';
        }
        coursef=coursef.subString(0,coursef.length()-1);
        System.debug(Database.query('SELECT '+coursef +' From Course__c'));
        return Database.query('SELECT '+coursef +' From Course__c');
    }
    
    public void saveCourse(){
        try{
            insert singleCourse;
        }
        catch(DMLException e){
            
        }
    }
    
    public void saveEditCourse(){
        
        try{
            update singleCourse;
        }
        catch(DMLException e){
            ErrorMsg='Record could not Update'+e.getMessage();
        }
        
    }
    
    public void getCourseForEdit(){
        courses=[SELECT Name , CreditHrs__c FROM Course__c WHERE Id=:courseId];
    	for(Course__c c: courses)
        {
            singleCourse=c;
        }
    }
    
    
     public void delCourse(){
        
       courses = [SELECT Name , CreditHrs__c FROM Course__c WHERE Id=:courseId];
        
         if(courses.size()>0){
            delete courses;
        }
        else{
            ErrorMsg='Record could not Update';
        }
        
    }

}