trigger appendOppoNameWithAccount on Opportunity (before insert) {
  //List<Account> appendN = new List<Account>(;
    Set<Id> oppoAccId = new  Set<Id>();
   
    Map<String,Account> mapOppo = new Map<String,Account>();
   
    for( Opportunity opty :trigger.new){
     
     if(opty.AccountId != null)
    
    oppoAccId.add(opty.AccountId);
    }
if( oppoAccId.size()>0){
 for(Account at : [Select id, Name from Account where Id in : oppoAccId])
    MapOppo.put(at.Id,at);
    for(Opportunity oppo1 : trigger.new){
    mapOppo.get(oppo1.AccountId).Name += '-'+oppo1.Name;


}
update mapOppo.values();
}



}