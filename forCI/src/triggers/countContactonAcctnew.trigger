trigger countContactonAcctnew on Contact (after insert, after update, after delete, after undelete) {

   List<Account> ct = new List<Account>();
   
   Set<Id> accountIds = new Set<Id>();
   
   if(Trigger.isInsert || Trigger.isUndelete){
    for(Contact con:trigger.new){
        accountIds.add(con.accountID);
    }
}
if(Trigger.isUpdate|| Trigger.isDelete){
    for(Contact con:trigger.old){
        accountIds.add(con.accountID);
    }
}
   
    for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount 
                               FROM Contact 
                               WHERE AccountId in: accountIds 
                               GROUP BY AccountId]){
        Account a = new Account();
        a.Id = (Id) ar.get('AcctId');
        a.Count_Contact__c = (Integer) ar.get('ContactCount');
       ct.add(a);
      
   }
   
   
   update ct;

}