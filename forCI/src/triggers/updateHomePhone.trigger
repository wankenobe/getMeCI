trigger updateHomePhone on Contact (before update) {
Set<String> AccId = new Set<String>();
Map<String,String> Accmap = new Map<String,String>();

for(Contact c : trigger.new){
    if(c.AccountId != null)
    AccId.add(c.AccountId);

}
if(AccId.size()>0){
    for (Account a :[SELECT Id,phone FROM Account WHERE Phone !=null and Id in: AccId])
    Accmap.put(a.Id, a.phone);
    }
    for(Contact c1 : trigger.new){
    if(c1.AccountId !=null)
    c1.HomePhone = Accmap.get(c1.AccountId);
    }

}