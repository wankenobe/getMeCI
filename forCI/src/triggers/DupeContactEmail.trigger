trigger DupeContactEmail on Contact (before insert, before update) {
Set<String> setCont = new Set<String>();
        for( Contact  c : trigger.new){
         if(c.Email != null){
         setCont.add(c.Email);
         }
         
        List<Contact> dupeCont = [SELECT Id FROM Contact Where Email = : c.Email];
         if(dupeCont.size ()>0) {
         c.addError('Contact  already exist');
       }  
         }
         }