public class StudentRecord {
    
    List<Student__c> students {get;set;}
    
    public Student__c saveSingleStudent {get;set;}
    public Id studentId {get;set;}
    
    public String errorMsg {get;set;}
    
    //------------------------------------------
    public List<StudentCourse__c> stdCourse {get;set;}
    public Student__c studentInfo {get;set;}
    public List<Course__c> courseList {get;set;}
    public Id selectedCoursesList {get;set;}
   
    //----------------------------------------------------
    
    public StudentRecord(){
        students=new List<Student__c>();
        saveSingleStudent = new Student__c();
        students =getStudents();
        
        stdCourse=new List<StudentCourse__c>();
        studentInfo=new Student__c();
        courseList=new List<Course__c>();
       
    }
    
    public void saveStudent(){
        try{
            insert saveSingleStudent;
        }
        catch(DMLException e){
            ErrorMsg='Record could not save'+e.getMessage();
        }
        
    }
    
    public void saveEditStudent(){
        
        try{
            update saveSingleStudent;
        }
        catch(DMLException e){
            ErrorMsg='Record could not Update'+e.getMessage();
        }
        
    }
    
    public void delStudent(){
        
       students = [SELECT RegNumber__c , Name , FatherName__c , Phone__c FROM Student__c WHERE Id=:studentId];
        
        if(students.size()>0){
            delete students;
        }
        else{
            ErrorMsg='Record could not Update';
        }
        
    }
    
    public void getStudentForEdit(){
        saveSingleStudent=[SELECT RegNumber__c , Name , FatherName__c , Phone__c FROM Student__c WHERE Id=:studentId];
    }
    
    public List<Student__c> getStudents(){
        return [SELECT RegNumber__c , Name , FatherName__c , Phone__c FROM Student__c ];
    }
    
    public void getStudentCourses(){
        
        courseList.clear();
        stdCourse= [SELECT Id,CourseName__r.Id,CourseName__r.Name,CourseName__r.CreditHrs__c,
                    StudentName__r.Name,StudentName__r.FatherName__c,StudentName__r.Phone__c
                    FROM StudentCourse__c WHERE StudentName__c=:studentId];
        
        studentInfo.Id=studentId;
        studentInfo.Name=stdCourse[0].StudentName__r.Name;
        studentInfo.FatherName__c=stdCourse[0].StudentName__r.FatherName__c;
        studentInfo.Phone__c=stdCourse[0].StudentName__r.Phone__c;
        
        Course__c course=new Course__c();
        
        for(Integer i=0;i<stdCourse.size();i++){
            
            course.Name=stdCourse[i].CourseName__r.Name;
            course.CreditHrs__c=stdCourse[i].CourseName__r.CreditHrs__c;
            courseList.add(course);
           
        }
        
        //system.debug(courseList);
        
    }
    
    public List<SelectOption> getCoursesList(){
        List<SelectOption> options = new List<SelectOption>();
        List<Course__c> courseListQuery =new List<Course__c>();
        courseListQuery=[SELECT Id,Name,CreditHrs__c FROM Course__c];
        
        for(Course__c cr: courseListQuery){
            options.add(new SelectOption(cr.Id, cr.Name));
            
        }
        return options;
    }
    
    public void registerdCourse(){
       	StudentCourse__c courseReg=new StudentCourse__c();
        courseReg.StudentName__c=studentId;
        courseReg.CourseName__c=selectedCoursesList;
        insert courseReg;
    }
    public void chk(){
        Student__c s1=new Student__c(name='Ali',Fathername__c='Anwar');
        insert s1;
        Student__c s2;
        for(integer i=0;i<150;i++){
            s2=new Student__c(name='inside',Fathername__c='loop');
        	try{
            insert s2;
        	}
        	catch(Exception ex){
            
        	}
        }
        
        Student__c s3=new Student__c(name='Ali',Fathername__c='Anwar');
        	insert s3;
    }
   
}