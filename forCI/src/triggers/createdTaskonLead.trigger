trigger createdTaskonLead on Lead (after insert) {
List<Task> newtask = new List<Task>();

Task obtask;
//if(trigger.isInsert){
    for(lead l : trigger.new){
    if(l.LeadSource != null  ){
      Task obtask =new Task();
       
            obtask.Subject=l.LeadSource;
            obtask.Status='Not Started';
            obtask.Priority='Normal';
            obtask.WhoId =l.Id;
            newtask.add(obtask);

//}
}
insert obtask;
}
}