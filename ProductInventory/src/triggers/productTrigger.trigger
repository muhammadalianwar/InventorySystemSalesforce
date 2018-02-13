trigger productTrigger on Product_Info__c (after insert) {
    for(Product_Info__c product : Trigger.new){
        
        Purchase_Detail__c purchase =new Purchase_Detail__c();
        purchase.purchase_quantity__c=product.product_quantity__c;
        purchase.purchse_date__c= System.now();
        purchase.total_purchase_price__c=product.purchase_price__c*product.product_quantity__c;
        purchase.Product_Info__c=product.Id;
        insert purchase;
    }
}