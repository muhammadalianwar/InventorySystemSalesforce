public class StudentCourse {
    public boolean flag{set;get;}
    public Id studentId {get;set;}
    public List<StudentCourse__c> stdCourse {get;set;}
    public Student__c studentInfo {get;set;}
    public List<Course__c> courseList {get;set;}
    
    public StudentCourse(){
        flag=false;
       	stdCourse=new List<StudentCourse__c>();
        studentInfo=new Student__c();
        courseList=new List<Course__c>();
        studentInfo.Id='a067F0000027Sa5QAE';
        getStudentCourses();
    }
    
    public Pagereference getStudentCourses(){
        flag=true;
        PageReference p=new PageReference('/apex/StudentCoursesPage');
        //
        stdCourse= [SELECT Id,CourseName__r.Id,CourseName__r.Name,CourseName__r.CreditHrs__c,
                    StudentName__r.Name,StudentName__r.FatherName__c,StudentName__r.Phone__c
                    FROM StudentCourse__c WHERE StudentName__c=:studentInfo.Id];
        
        studentInfo.Name=stdCourse[0].StudentName__r.Name;
        studentInfo.FatherName__c=stdCourse[0].StudentName__r.FatherName__c;
        studentInfo.Phone__c=stdCourse[0].StudentName__r.Phone__c;
        
        Course__c course=new Course__c();
        
        for(Integer i=0;i<stdCourse.size();i++){
            
            course.Name=stdCourse[i].CourseName__r.Name;
            course.CreditHrs__c=stdCourse[i].CourseName__r.CreditHrs__c;
            courseList.add(course);
           
        }
        
        system.debug(courseList);
        p.setRedirect(true);
        return p;
        
    }

}