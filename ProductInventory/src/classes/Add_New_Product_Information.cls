public class Add_New_Product_Information {
    
    public String name { get ; set ;}
    public Decimal purchase_price_per_product { get ; set ;}
    public Decimal sale_price_per_product { get ; set ;}
    public Integer product_quantity { get ; set ;}
    public List<Product_Info__c> list_of_products { get ; set ;}
    public Id product_id { get ; set ;}
    public Product_Info__c singleProductInfo { get ; set ;}
    
    public Add_New_Product_Information(){
        List<String> fields=new List<String>(Schema.SObjectType.Product_Info__c.fields.getMap().keySet());
            String productObjectFields='';
            for(String f:fields ){
            
                productObjectFields += f +',';
            }
            productObjectFields=productObjectFields.subString(0,productObjectFields.length()-1);
            list_of_products=Database.query('SELECT '+productObjectFields +' From Product_Info__c');
            
    }
    
    public PageReference addProductToDb(){
        Product_Info__c new_product=new Product_Info__c();
        try{
            new_product.Name=name;
            new_product.purchase_price__c=purchase_price_per_product;
            new_product.sale_price__c=sale_price_per_product;
            new_product.product_quantity__c=product_quantity;
            insert new_product;
            
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Info,'Information successfully added');
            ApexPages.addmessage(myMsg);
            return null;
        }
        catch(Exception ex){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Information is not Valid');
            ApexPages.addmessage(myMsg);
            return null;
        }
        
    }
    
    public PageReference displayCompleteProducts(){
        
            List<String> fields=new List<String>(Schema.SObjectType.Product_Info__c.fields.getMap().keySet());
            String productObjectFields='';
            for(String f:fields ){
            
                productObjectFields += f +',';
            }
            productObjectFields=productObjectFields.subString(0,productObjectFields.length()-1);
            list_of_products=Database.query('SELECT '+productObjectFields +' From Product_Info__c');
        
        return null;
    }
    //get detail of single product
    public PageReference productDetailed(){
        List<String> fields=new List<String>(Schema.SObjectType.Product_Info__c.fields.getMap().keySet());
        String productObjectFields='';
        for(String f:fields ){
            
			productObjectFields += f +',';
        }
        productObjectFields=productObjectFields.subString(0,productObjectFields.length()-1);
        singleProductInfo=Database.query('SELECT '+productObjectFields +',(select purchase_quantity__c,total_purchase_price__c,purchse_date__c from Purchase_Details__r) From Product_Info__c WHERE Id=:product_id Limit 1');
        
        /*for(Product_Info__c singleProduct: list_of_products){
            singleProductInfo.Id=singleProduct.Id;
            singleProductInfo.Name=singleProduct.Name;
           	singleProductInfo.purchase_price__c=singleProduct.purchase_price__c;
            singleProductInfo.sale_price__c=singleProduct.sale_price__c;
            singleProductInfo.product_quantity__c=(Integer)singleProduct.product_quantity__c;
            singleProduct.Purchase_Detail__c=singleProduct.Purchase_Detail__c;
        }*/
        
        
        PageReference pageRef = new PageReference('/apex/SingleProductInfo?id='+singleProductInfo.Id);
        return pageRef;    
    }
    
    public PageReference productEdit(){
        List<String> fields=new List<String>(Schema.SObjectType.Product_Info__c.fields.getMap().keySet());
        String productObjectFields='';
        for(String f:fields ){
            
			productObjectFields += f +',';
        }
        productObjectFields=productObjectFields.subString(0,productObjectFields.length()-1);
        list_of_products=Database.query('SELECT '+productObjectFields +' From Product_Info__c WHERE Id=:product_id');
        for(Product_Info__c editProduct: list_of_products){
            name=editProduct.Name;
            purchase_price_per_product=editProduct.purchase_price__c;
            sale_price_per_product=editProduct.sale_price__c;
            product_quantity=(Integer)editProduct.product_quantity__c;
        }
        PageReference pageRef = new PageReference('/apex/Add_New_Product');
        return pageRef;    
        
    }
    public PageReference saveUpdateProduct(){
        Product_Info__c new_product=new Product_Info__c();
        try{
            new_product.Name=name;
            new_product.purchase_price__c=purchase_price_per_product;
            new_product.sale_price__c=sale_price_per_product;
            new_product.product_quantity__c=product_quantity;
            new_product.Id=product_id;
            update new_product;
            
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Info,'Information successfully added');
            ApexPages.addmessage(myMsg);
            return null;
        }
        catch(Exception ex){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Information is not Valid');
            ApexPages.addmessage(myMsg);
            return null;
        }
    }

}