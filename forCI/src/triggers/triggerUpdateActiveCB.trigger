trigger triggerUpdateActiveCB on Account (After Update) {
 Set<String> updateCB = new Set<String>();
 Map<String,String> mapCB = new Map<String,String>();
 List<Opportunity> listCB = new List<Opportunity>();

 for( Account A2 : trigger.new){
     
     if( A2.Active_CB__c != null){
     updateCB.add(A2.Id);
    mapCB.put(A2.Id, A2.Active_CB__c);
   
     
 
}

system.debug('Check MAP '+mapCB);
system.debug('Check Set '+updateCB);
if(updateCB.size()>0){
    for( Opportunity o2 :[SELECT Id, StageName,Active_CB1__c,AccountId from Opportunity where Stagename ='Closed Won' AND AccountId in:updateCB]){
    if(mapCB.containskey(o2.AccountId)){
    o2.Active_CB1__c=mapCB.get(o2.AccountId);
    
    listCB.add(o2);
  


}
}
update listCB;
system.debug('List B'+listCB );
}
}
}