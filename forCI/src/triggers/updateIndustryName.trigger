trigger updateIndustryName on Lead (after delete) {
    
    List<Account> acclist = new List<Account>();
    
    Map<String,String> industrymap = new Map<String,String> ();
    
    for(Lead l :trigger.old){
    
    //if(l.Industry != null && l.Industy !=''){
    if (string.isNotBlank(l.Industry)){
    
    industrymap.put(l.Company,l.Industry);
    }

}
if(industrymap.size()>0){

    for(Account a :[Select Id,Industry,Name from Account Where Name in : industrymap.keyset()]){

        if(industrymap.containskey(a.Name))
        
        a.Industry=industrymap.get(a.Name);
        
        acclist.add(a);
        }
       
       }
       
       update acclist;
       }