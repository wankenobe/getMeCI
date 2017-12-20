trigger updateOwner on Opportunity (after update) {


    Set<Id> oppIdSet = new Set<Id>();
    
    Map<Id,Opportunity> idOppMap = new Map<Id,Opportunity>();
    List<Contract> cList = new List<Contract>();
    
    for(Opportunity opp : trigger.new){
    
            if(opp.OwnerId != trigger.oldmap.get(opp.id).OwnerId){
            
               oppIdSet.add(opp.Id);
               idOppMap.put(opp.Id,opp);
                        
            }
    
        }
        
        system.debug('@@@idOppMap'+idOppMap);
        
        
    if(oppIdSet.size()>0){
    
   
      for(Contract c :[Select Id,opportunity__c,OwnerId from Contract Where opportunity__c in:oppIdSet]){
    
        if(idOppMap.containskey(c.opportunity__c))
        c.OwnerId  = idOppMap.get(c.opportunity__c).OwnerId ;
        
        cList.add(c);
    
        }
    
 }
    if(cList.size()>0)
    update cList;
    
     system.debug('@@@cList'+cList);
    }