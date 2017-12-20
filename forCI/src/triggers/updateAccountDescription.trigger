trigger updateAccountDescription on opportunity (before update,before insert){

    Set<Id> oppoAccId = new Set<Id>();
    
            Map<String,String> Accmap = new Map<String,String>();
            
            for ( Opportunity oppo : trigger.new){
            
            if(oppo.AccountId != null )
            
            oppoAccId.add(oppo.AccountId );
            
            
            }
            if(oppoAccId.size()>0){
           
               for(Account at :[Select Id, Description from Account where  Id in : oppoAccId ])
               
                   Accmap.put(at.Id, at.Description);
               
                }
            for ( Opportunity opty: trigger.new){
            
            if(opty.AccountId != null )
            opty.Description =  Accmap.get(opty.AccountId);
              
               
               
               
               }
            }