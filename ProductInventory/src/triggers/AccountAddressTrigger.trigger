trigger AccountAddressTrigger on Account (before insert,before update) {
    
    for(Account sc : Trigger.new)
    {
        if(sc.Match_Billing_Address__c==true)
        {
            sc.ShippingPostalCode=sc.BillingPostalCode;
        }
        
    }
    

}