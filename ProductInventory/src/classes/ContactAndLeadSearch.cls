public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String s){
        Contact c=new Contact();
        c.FirstName='John';
        c.LastName='Smith';
        insert c;
        Lead l=new Lead();
        l.FirstName='John';
        l.LastName='Smith';
        l.Company='Plumlogix';
        insert l;
    	List<List<sObject>> searchList = [FIND :s IN NAME FIELDS RETURNING Contact(FirstName,LastName,Department),Lead(Address,Email)];
	
        return searchList;
    }

}