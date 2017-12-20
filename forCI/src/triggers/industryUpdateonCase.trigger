trigger industryUpdateonCase on Case(before update){
Map<Id,Account> newmap = new Map<Id,Account>();
set<Id> newcase = new set<Id>();
List<Case> listc = new List<Case>();    
    for(Case c :trigger.new){
    If(c.Accountid!=null){

newcase.add (c.Accountid) ;  
}
}
If(newcase.size()>0)
{
    
    for( Account a:[Select id, Name , Industry from Account where id in : newcase])
{
    if(a.Industry!='' &&  a.Industry!=null) //&& (trigger.oldmap.get(a.id).Industry!=a.Industry)){

        newmap.put(a.id,a);
        }
}

  //  If(newmap.containskey(a.id)){
    for(case cs : trigger.new)
    If(newmap.containskey(cs.Accountid)){
 cs.Industry__c = newmap.get(cs.Accountid).Industry;
    listc.add(cs);
    }
 
}

//}