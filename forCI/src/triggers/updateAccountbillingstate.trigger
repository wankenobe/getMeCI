trigger updateAccountbillingstate on Contact ( after insert, after update){

     //Set <Id> opposet = new  Set <Id> ();

        Map<Id,Contact> oppomap = new Map<Id,Contact>();
    List<Account> updatedState = new List<Account>();
        
        for(Contact con : trigger.new){

  if(con.MailingState!= '' && con.MailingState!= null && ( trigger.isInsert || (trigger.isUpdate &&trigger.oldmap.get (con.id).MailingState!=con.MailingState) )){


           // opposet.add(con.AccountId);
            
                oppomap.put(con.AccountId,con);    
        }
    }
        
    //System.debug('$$$$$$'+opposet);
        System.debug('#####'+oppomap);

    //if(opposet.size()>0){
    if(oppomap.size()>0){

        for (Account act : [Select Id,BillingState from Account where Id in : oppomap.keyset()]){
            if (oppomap.containskey(act.Id)){
        
        act.BillingState = oppomap.get(act.Id).MailingState ;
            
                updatedState.add(act);
    }
        
}
if(updatedState.size()>0){
        update updatedState;

}
}
        
}