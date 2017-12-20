trigger updateopportunities on Account(after update) 
{
    Set<Id> accountIds = new Set<Id>();
    List<Opportunity> oppsToUpdate = new List<Opportunity>();

    for(Account ac : trigger.new)
    {
         if(ac.Rating=='Hot')
              accountIds.add(ac.Id);
    }

  

      for(Opportunity opp : [select id, StageName from Opportunity where AccountId in: accountIds])
     {
          opp.StageName='Closed Won';
          oppsToUpdate.add(opp);
     }

     update oppsToUpdate;
}