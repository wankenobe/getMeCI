trigger UpdateActiveCB2 on Account (After Update) {
 Set<String> updateCB = new Set<String>();
 Map<String,Account> mapCB = new Map<String,Account>();
 List<Opportunity> listCB = new List<Opportunity>();

 for( Account A2 : trigger.new){
     
     if( A2.Active_CB__c != null && A2.Industry != null &&( trigger.oldmap.get(A2.Id).Active_CB__c  != A2.Active_CB__c || trigger.oldmap.get(A2.Id).Industry  != A2.Industry )){
     updateCB.add(A2.Id);
    mapCB.put(A2.Id, A2);
   
     
 
}

system.debug('Check MAP '+mapCB);
system.debug('Check Set '+updateCB);
if(updateCB.size()>0){
    for( Opportunity o2 :[SELECT Id, StageName,Active_CB1__c,AccountId from Opportunity where Stagename ='Closed Won' AND AccountId in:updateCB]){
    if(mapCB.containskey(o2.AccountId)){
    
    o2.Active_CB1__c=mapCB.get(o2.AccountId).Active_CB__c ;
    o2.NextStep= mapCB.get(o2.AccountId).Industry;
    
    listCB.add(o2);
  


}
}
update listCB;
system.debug('List B'+listCB );
}
}
}