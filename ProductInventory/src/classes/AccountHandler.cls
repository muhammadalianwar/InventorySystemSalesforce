public class AccountHandler {
    public static Account insertNewAccount(String acName){
        Account acc=new Account();
        acc.Name=acName;
        try{
            insert acc;
            return acc;
        }
        catch(System.DmlException e){
            return null;
        }
    }

}