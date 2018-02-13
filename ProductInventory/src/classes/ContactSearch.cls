public class ContactSearch {
    public static List<Contact> searchForContacts(String n, String postal){
        List<Contact> c=[SELECT Id,Name 
                         FROM Contact 
                         WHERE (lastname=:n AND MailingPostalCode=:postal )];
        return c;
    }

}