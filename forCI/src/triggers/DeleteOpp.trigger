trigger DeleteOpp on Opportunity(after update) {

 Set<Id> optyId = new Set<Id>();
 
 List<Property__c> PropertyDelete = new List<Property__c>();
 
for(Opportunity opp: trigger.new){

if( opp.StageName == 'Closed Lost'){

    optyId.add(opp.Id);
}
   }
system.debug('#####'+ optyId);

if(optyId.size()>0){

       for ( Property__c prop : [Select Id, Prop_opportunity__c from Property__c where Prop_opportunity__c  in : optyId])
        {
     PropertyDelete.add(prop);
     system.debug('#####rrr'+ optyId);
 }
 
}
if(PropertyDelete.size()>0)

 delete PropertyDelete ;
  }