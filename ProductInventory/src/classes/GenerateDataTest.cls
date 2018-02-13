@isTest
public class GenerateDataTest {
	@isTest
    public static void productTestData(){
        List<Product_info__c> productList= new List<Product_info__c>();
        for(Integer i=0;i<10;i++){
            Product_info__c product=new Product_info__c();
            product.Name='Product'+i;
            product.purchase_price__c=i;
            product.sale_price__c=i+2;
            product.product_quantity__c=50+i;
            productList.add(product);
        }
        insert productList;
    }
}