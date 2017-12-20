trigger EmailAccordingToStatus on Lead (before insert , before update ) {
    List<Messaging.Email> emails=new List<Messaging.Email>();
    for(Lead l:Trigger.new){
    If(l.Status == 'Working - Contacted' && l.Email != '' && l.Email != null && ( trigger.isInsert || (trigger.isUpdate && trigger.oldmap.get (l.id).Status!=l.Status)))
     { 
  
        Messaging.SingleEmailMessage email1=new Messaging.SingleEmailMessage();
        email1.setToAddresses(new String[]{l.Email});
        email1.setSubject('Lead created with working contacted');
        String body='<h1>Dear Customer</h1<p><br/>Your lead with Name:'+ l.FirstName  + l.LastName ;
        body=body+' is set to Working - Contacted </p><br/><p> Thanks <br/>SalesTeam</p>';
        email1.setHtmlBody(body);
        l.Date_to_Send_mail__c = Date.today();
        emails.add(email1);
    }
    
    Messaging.sendEmail(emails);
    }
}