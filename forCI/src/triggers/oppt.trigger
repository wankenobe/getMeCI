trigger oppt on Opportunity (after update) 
{
List<task> tasklist = new list<task>();
set<id> oppidset=new set<id>();

for(Opportunity o: trigger.new)
{
    if(o.StageName!= trigger.oldmap.get(o.id).StageName)
    {
    oppidset.add(o.id);
    }
 }

if(oppidset.size()>0)
{
for(Task t :[select id, Task_Stage__c from Task where whatid in:oppidset])
{
tasklist.add(t);
}
}
if(tasklist.size()>0)
update tasklist;
}