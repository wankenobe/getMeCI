trigger updateFax on Contact (after update){
            Map<Id,Contact> MapFax = new Map<Id,Contact>();
            List<Account> listAcc = new List<Account> ();
           for(Contact con :trigger.new){
            if(con.LeadSource!= null && con.LeadSource!='' &&(trigger.oldmap.get(con.id).LeadSource!=con.LeadSource)){
            MapFax.put(con.Accountid ,Con);
        }   
            }
            if(mapFax.size()>0)
            {
            
        for(Account acc : [select id , fax from Account where id in : mapFax.keyset()]){
        if(mapFax.containskey(acc.id)){
        acc.Fax = mapFax.get(acc.id).Fax;
        
            listAcc.add(acc);
        }
        }
            update listAcc;
    
    }
}