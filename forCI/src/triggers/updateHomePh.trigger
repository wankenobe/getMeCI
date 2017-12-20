trigger updateHomePh on Contact (before update) {
Set<String> AccId = new Set<String>();
Map<String,Account> Accmap = new Map<String,Account>();

for(Contact c : trigger.new){
    if(c.AccountId != null)
    AccId.add(c.AccountId);

}
if(AccId.size()>0){
    for (Account a :[SELECT Id,phone,Site FROM Account WHERE Phone !=null and Id in: AccId])
    Accmap.put(a.Id, a);
    }
    for(Contact c1 : trigger.new){
    if(c1.AccountId !=null)
    c1.HomePhone = Accmap.get(c1.AccountId).Phone;
    c1.Department = Accmap.get(c1.AccountId).Site;
    }

}

//to update Account phone number in contact homephone by mapping whole Account .
//we are also updating contact's department by account site 
//basically this is the example to update multiple field in one go by this way.//