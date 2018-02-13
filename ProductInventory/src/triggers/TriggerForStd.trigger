trigger TriggerForStd on Student__c (before insert,before update) {
  
    System.debug('msg inside the loop');
    
    
}