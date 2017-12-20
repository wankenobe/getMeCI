trigger deleteChild on Opportunity (before delete) {
try{
Set<Id> oppIdSet = new Set<Id>();
List<Contract> conList = new List<Contract>();

 for(Opportunity  o : trigger.old){
 
     oppIdSet.add(o.Id);
 
 
 }
 
 
    if(oppIdSet.size()>0){
 
     for(Contract c : [Select id ,opportunity__c from Contract Where opportunity__c  in : oppIdSet]){
     
     conList.add(c);
     
     
     }
     
 
 }
     delete conList;
     
  }
  
  Catch (Exception e){
     
  }

}