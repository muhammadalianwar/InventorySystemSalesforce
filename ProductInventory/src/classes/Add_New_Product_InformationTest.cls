@isTest
public class Add_New_Product_InformationTest {
	
    @testSetup static void setup() {
        GenerateDataTest.productTestData();
    }
    
    @isTest
    public static void WithNullValuesAddProductToDbTest(){
        Add_New_Product_Information product=new Add_New_Product_Information();
        product.addProductToDb();
    }
  
    @isTest
    public static void WithSomeValuesAddProductToDbTest(){
        Add_New_Product_Information product=new Add_New_Product_Information();
        product.name='Product Name';
        product.purchase_price_per_product=22;
        product.sale_price_per_product=24;
        product.product_quantity=20;
        product.addProductToDb();
    }
    
    @isTest
    public static void displayCompleteProductsTest(){
        Add_New_Product_Information product=new Add_New_Product_Information();
        product.displayCompleteProducts();
    }
    
    @isTest
    public static void productDetailedTest(){
        
        Product_Info__c productTestData=[SELECT Id From Product_Info__c Limit 1];
        Add_New_Product_Information product=new Add_New_Product_Information();
        product.product_id=productTestData.Id;
        product.productDetailed();
        
    }
    
    @isTest
    public static void productEditTest(){
        
        Product_Info__c productTestData=[SELECT Id From Product_Info__c Limit 1];
        Add_New_Product_Information product=new Add_New_Product_Information();
        product.product_id=productTestData.Id;
        product.productEdit();
    }
    
    @isTest
    public static void withNullValuesSaveUpdateProductTest(){
        Add_New_Product_Information product=new Add_New_Product_Information();
        product.saveUpdateProduct();
    }
    
    @isTest
    public static void withSomeValuesSaveUpdateProductTest(){
         Product_Info__c productTestData=[SELECT Id From Product_Info__c Limit 1];
        Add_New_Product_Information product=new Add_New_Product_Information();
        product.product_id=productTestData.Id;
        product.name='Product Name';
        product.purchase_price_per_product=22;
        product.sale_price_per_product=24;
        product.product_quantity=20;
        product.saveUpdateProduct();
    }
}