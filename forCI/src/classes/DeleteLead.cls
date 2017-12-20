global class DeleteLead implements Database.Batchable<sobject>
{
   string query;
   string status= 'Open - Not Contacted';

global Database.QueryLocator start(Database.BatchableContext BC)
{

query= 'select Id, Status from Lead where Status=: status';
return Database.getQueryLocator(query);
}
//execute method
global void execute(Database.BatchableContext BC, List<Lead> scope)
{
       
delete scope;
}
//finish method
global void finish(Database.BatchableContext BC)
{
}
}