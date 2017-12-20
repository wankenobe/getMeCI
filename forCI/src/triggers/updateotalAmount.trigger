trigger updateotalAmount on Account (after update) {


    List<Case> caseList = new List<Case>();
    Set<Id> accIdSet = new Set<Id>();
    Map<id,Account>  IdAccmap = new Map<id,Account>(); 
    
    
    for(Account a : trigger.new){
    
        if(a.website != null && a.website != '' && trigger.oldmap.get(a.Id).website != a.website){
        
            //accIdSet.add(a.Id);
            IdAccmap.put(a.Id,a);
            
        }
    
    
    }
    
    if(IdAccmap.size()>0){
    
        for(Case c :[Select id,Total_Amount__c,AccountId   from Case Where  AccountId  in:IdAccmap.keySet() order by CreatedDate desc limit 1])
        
            if( IdAccmap.containsKey(c.AccountId) ){
            
            
            c.Total_Amount__c = IdAccmap.get(c.AccountId).Total_Amount__c;
            caseList.add(c);
               
        }
    }
    
    update caseList;

}