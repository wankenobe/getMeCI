trigger tt on Contact (before insert)    
{  
    set<id> accountIdList = new Set<id>();  
    for(contact con : Trigger.new)  
    {  
    if(con.AccountId != null)
        accountIdList.add(con.accountid);  
    }  

    Map<Id,account> mapVar = new Map<Id,account>([SELECT id,name
                                                  FROM account WHERE Id IN : accountIdList]);

    for(contact cont : Trigger.new)
    {
            mapVar.get(cont.accountid).name += '-' +cont.lastname;

    }
    update mapVar.values();
}