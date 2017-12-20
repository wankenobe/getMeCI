trigger UpdateDescription on Account(before update){
Map<Id,Opportunity> mapacc = new Map<Id,Opportunity>();
set<Id> newa = new set<Id>();
List<Account> listc = new List<Account>();    
    for(Account a :trigger.new){
    If(a.Type!=null && a.Type!= '' &&( Trigger.oldmap.get(a.Id).Type!=a.Type)){

newa.add(a.id) ;  
}
}
If(newa.size()>0)
{
    
    for( Opportunity o:[Select id, Description,Accountid from Opportunity where Accountid in : newa order by CreatedDate desc limit 1])
{
    if(o.Description !='' && o.Description!=null) //&& (trigger.oldmap.get(a.id).Industry!=a.Industry)){

        mapacc.put(o.Accountid,o);
        }
}

    for(Account aa : trigger.new)
    If(mapacc.containskey(aa.id)){
 aa.Description = mapacc.get(aa.id).Description;
 
    listc.add(aa);
    }                                                                         
 
}