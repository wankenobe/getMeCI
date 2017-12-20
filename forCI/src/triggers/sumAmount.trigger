//sum of amount of opportunity in Account's total amount field //

trigger sumAmount on Opportunity (after insert) {
    
    Set<Id> accIdset = new set<Id>();
   
    List<Account> accList = new List<Account>();
    
    List<AggregateResult> arList = new List<AggregateResult>();
    
    Map<String,Double> accmap = new Map<String,Double>();
    
    for(Opportunity oppo : trigger.new){
    
    accIdset.add(oppo.accountId);
    
   }
   if(accIdset.size()>0) {
   arList = [select Accountid aid, Sum(Amount) a from Opportunity where AccountId in : accIdset group by AccountId];
   
   }
   for( AggregateResult q :arList ){
   accmap.put((String)q.get('aid'),(Double)q.get('a'));
    }
    for(Account acc : [select Id, Total_Amount__c from Account where Id in : accIdset]){
    
    acc.Total_Amount__c=accmap.get(acc.Id);
    accList.add(acc);
    
    }
    update accList;
}