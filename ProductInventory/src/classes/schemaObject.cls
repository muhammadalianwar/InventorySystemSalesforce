public class schemaObject {
    
    schema.DescribeSObjectResult obj= StudentCourse__c.sObjectType.getDescribe();
    Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
    
    public void schemaMethod(){
        System.debug(obj.getChildRelationships());
    }
    

}