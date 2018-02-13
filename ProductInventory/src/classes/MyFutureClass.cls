public class MyFutureClass{
    private static Integer var;
    public MyFutureClass(){
        system.debug('MyFuture class');
    }
    static{
        var=10;
        system.debug('var='+var);
    }
}