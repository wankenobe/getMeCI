public class ActivityHistory_ctlr {

    public String AccountId { get; set; }
    public List<eEventTTask> taskEventList { get; set; }
    public ActivityHistory_ctlr(ApexPages.StandardController controller) {
    
    AccountId  = ApexPages.currentPage().getParameters().get('id');
    
        taskEventList = new List<eEventTTask>();
   // eEventTTask taskEventList = new eEventTTask ();
    for (Task t : [Select Subject,Status, WhatId, OwnerId,Owner.Name , ActivityDate, LastModifiedDate From Task Where whatId =: AccountId]) {
    taskEventList.add(new eEventTTask(t.Subject, t.WhatId, t.OwnerId, t.ActivityDate, t.LastModifiedDate,t.Owner.Name));
    }
    system.debug('!!!!taskEventList'+taskEventList);
    for (Event e : [Select Subject, WhatId,OwnerId,Owner.Name, ActivityDate, LastModifiedDate From Event Where whatId =: AccountId]) {
  taskEventList.add(new eEventTTask(e.Subject, e.WhatId, e.OwnerId, e.ActivityDate,e.LastModifiedDate,e.Owner.Name));
    }
    }
    
    public class eEventTTask {
    public String subject { get; set; }
    public Id whatId { get; set; }
    public Id ownerId { get; set; }
    public  String ownerName {get;set;}
    public Date activityDate { get; set;}
    public DateTime lastModified { get; set;}

    public eEventTTask(String sub, Id wht, Id own, Date act, Datetime lmd,String Nm) {
    subject = sub;
    whatId = wht;
    ownerId = own;
    activityDate = act;
    ownerName= Nm;
    
    //lastModified = lmd;
  }
}

}