trigger updateOrderDescription on Account (after insert,after update) {
  Set<Id> AccId =  new Set<Id>();
  Map<String,Account> mapCB = new Map<String,Account>();
   List<Opportunity> listCB = new List<Opportunity>();
    for (Account a1 :trigger.new){
    
    if(a1.Description!=null && a1.Description!=''){
      AccId.add(a1.Id);
      mapCB.put(a1.Id, a1);
      
    
    }
     if(accId.size()>0){
     for (Opportunity opoo : [Select Id, Description, AccountId from Opportunity where AccountId in: AccId ]){
      if(mapCB.containskey(opoo.AccountId)){
     
      
      opoo.Description = mapCB.get(opoo.AccountId).Description ;
      listCB.add(opoo);
    
             }
    }
update listCB;
}
}
}