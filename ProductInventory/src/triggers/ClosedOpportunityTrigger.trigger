trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    
    List<Task> t=new List<Task>();
    for(Opportunity op: Trigger.New){
        if(op.StageName=='Closed Won'){
            
            Task t1=new Task();
            t1.Subject='Follow Up Test Task';
            t1.WhatId=op.Id;
            t.add(t1);
        }
    }
    insert t;

}