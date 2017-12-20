public class AnnualTouchpointPlanningController {

    Public List<Task> TaskList{get;set;}
     Public List<Event> EventList{get;set;}
    public String contId{get;set;} 
    public String dcid{get;set;}
    public task task{get;set;}
    Public string editid{get;set;} 
    public opportunity oo;
        public Id selectedDetailID { get;set; }

    
    String currentRecordId ; 
    public AnnualTouchpointPlanningController(ApexPages.StandardController controller) {
       // this.oppty= (Opportunity)controller.getRecord();
        
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
       
     TaskList = [Select subject,id, Type, whatID,priority,status,ActivityDate FROM Task WHERE Whatid=:currentRecordId  ];
      //EventList = [Select subject,id,WhatId FROM Event WHERE Whatid=:currentRecordId ];
     
    
     
     if(TaskList.size() == 0)
{
    Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,''+'No ATP Tasks to Display'));
   } 
 }
 
 public pagereference saveProject(){
 

  system.debug('ssssss'+TaskList );
    
    upsert TaskList ; // the LIST
  
     PageReference pageRef = new PageReference('/apex/AnnualTouchpointPlanning');
    pageRef.setRedirect(true);
    return null;
}    
     
    public PageReference save()
    {
        upsert TaskList ;
        
        return new PageReference('/apex/AnnualTouchpointPlanning');
    }  
     
     
       public pagereference deleteCon() {
       String s1 = System.CurrentPageReference().getParameters().get('dtlIdParam');
       task t=[ select id,status From task Where id=:s1];
       //t.ActualDate__c=system.today();
       t.status= 'completed';
       upsert t;
       PageReference pageRef = new PageReference('/apex/AnnualTouchpointPlanning');
       pageRef.setRedirect(true);
       return null;
   } 
   public class AnnualTouchpointPlanningControlle {

   // Public List<Task> TaskList{get;set;}
     Public List<Event> EventList{get;set;}
    public String contId{get;set;} 
    public String dcid{get;set;}
    public Event Evemt{get;set;}
    Public string editid{get;set;} 
    public opportunity oo;
        public Id selectedDetailID { get;set; }

    
    String currentRecordId ; 
    public AnnualTouchpointPlanningControlle(ApexPages.StandardController controller) {
       // this.oppty= (Opportunity)controller.getRecord();
        
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
       
     //TaskList = [Select subject,id, Type, whatID,priority,status,ActivityDate FROM Task WHERE Whatid=:currentRecordId  ];
     EventList = [Select subject,id, Type, whatID,ActivityDate FROM Event WHERE Whatid=:currentRecordId  ];
    
     
     if(EventList.size() == 0)
{
    Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,''+'No ATP Tasks to Display'));
   } 
 }
 
 public pagereference saveProject(){
 

  system.debug('ssssss'+EventList );
    
    upsert EventList ; // the LIST
  
     PageReference pageRef = new PageReference('/apex/AnnualTouchpointPlanning');
    pageRef.setRedirect(true);
    return null;
}    
     
    public PageReference save()
    {
        upsert EventList ;
        
        return new PageReference('/apex/AnnualTouchpointPlanning');
    }  
     
     
       public pagereference deleteCon() {
       String s1 = System.CurrentPageReference().getParameters().get('dtlIdParam');
       Event t=[ select id From Event Where id=:s1];
       //t.ActualDate__c=system.today();
       //t.status= 'completed';
       upsert t;
       PageReference pageRef = new PageReference('/apex/AnnualTouchpointPlanning');
       pageRef.setRedirect(true);
       return null;
   } 
    

   
   
}
}