trigger createHistory on Account(before insert){
set<Id>  actset =new set<Id> ();
List<Opportunity> listacc = new List<Opportunity>();
for( Account a :trigger.new){

actset.add(a.id);
}
if( actset.size()>0)
{
 for ( Opportunity opp : [Select id ,Name from Opportunity where id in : actset])
         {
        Task t = new Task();
        t.WhatId = opp.id ;
        listacc.add(opp);

}
}
update listacc;
}