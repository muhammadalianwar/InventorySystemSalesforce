public class Practice {
    
    public static void check(){
        
        Broker__c c =new Broker__c();
        c.Name='Ahmad';
        c.Email__c='hello@gmail.com';
        upsert c Broker__c.fields.Name ;
    }

}