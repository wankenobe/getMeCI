trigger updateTask on Task (before update) 
{

    Set<Id> taskId = new Set<Id>();
    Map<Id,String> caseMap= new Map<Id,String>();
    //List<Task> updateTask= new List<Task>();
    For(Task otask: trigger.new){
    if(otask.Whatid!=null){
    if(((String)otask.Whatid).startsWith('500'))
    //if(trigger.isUpdate)
    taskId.add(otask.WhatId);
    }
        }
        if(taskId.size()>0){
        for(Case c:[Select Id,Priority From Case Where Id IN : taskId]){
        caseMap.put(c.Id,c.Priority);
        }
        }
        For(Task otask: trigger.new){
        if(caseMap.containskey(otask.WhatId)){
        otask.Priority=caseMap.get(otask.WhatId);
       // updateTask.add(otask);
        }
       // update otask;
        }
        
        
    
}