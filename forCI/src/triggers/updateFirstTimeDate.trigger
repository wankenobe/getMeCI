trigger updateFirstTimeDate on Opportunity (before insert, before update) {
         for(Opportunity opty :trigger.new ){
         
         if((opty.LeadSource!=null && opty.LeadSource != '')&& (trigger.isInsert||(trigger.isUpdate && trigger.oldmap.get(opty.Id).LeadSource!=opty.LeadSource)))
         
         opty.First_Time_Lead_Source_Changed__c = system.Now();
         }
         
         
        

}