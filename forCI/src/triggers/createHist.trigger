trigger createHist on Opportunity(after insert){
set<Id>  actset =new set<Id> ();
List<Account> listacc = new List<Account>();
for( Opportunity o :trigger.new){

actset.add(o.Accountid);
}
if( actset.size()>0)
{
 for ( Account opp : [Select id ,Name from Account where id in : actset])
         {
        Task t = new Task();
        t.WhatId = opp.id ;
        listacc.add(opp);

}
}
update listacc;
}