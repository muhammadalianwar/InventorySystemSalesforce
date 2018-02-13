public class CourseDetail {
    
    //Method to Add course record in database object
    public String setCourseDetail(String n){
        Course__c crs=new Course__c();
        crs.Name=n;
        try{
            insert crs;
            return 'Data entered successfully';
        }
        catch(System.DmlException e){
            return 'Error: '+e.getMessage();
        }
    }
    //End of setCourseDetail();
    
    //Method to search specific detail of any Course on basis of name
    public List<Course__c> getCourseDetail(String n){
        List<Course__c> c=new List<Course__c>();
        try{
            c= [SELECT Name FROM Course__c WHERE Name=:n];
            return c;
        }
        catch(System.DmlException e){
            return null;
        }
    }
    //End of getCourseDetail();

}