trigger populateContactPhoneWithAccountPhone on Account(after update){
    //Set<Id> accountids = new Set<Id>();
   Map<String,String> mapids = new Map<String,String>();
List<Contact> cont = new List<Contact>();
    for(Account a :trigger.new){

if(a.Rating == 'Hot' && a.Website!='' && a.Website!=null) { // (trigger.oldmap.get(a.id).Rating!=a.Rating)){
  // if (a.Website!='' && a.Website!=null && (trigger.oldmap.get(a.id).Website!=a.Website)){
  
  mapids.put(a.id,a.Phone);
 }
   
    }
system.debug('$$$$$'+ mapids);

If(mapids.size()>0){
for(Contact c :[Select id, Phone, Accountid from Contact Where Accountid in :mapids.keyset()])
{
    If(mapids.containskey(c.Accountid)){
    
 c.Phone = mapids.get(c.Accountid);
cont.add(c);
}
}
If(cont.size()>0)
update cont;
}
}