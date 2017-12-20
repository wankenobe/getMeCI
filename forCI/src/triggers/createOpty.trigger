trigger createOpty on Account (after insert) {
   if(trigger.isInsert){ 
    
    List<Opportunity> oppo = new List <Opportunity>();

    for (Account acc :trigger.new){
     if(acc.Type != '' && acc.Type != null){
     Opportunity opty = new Opportunity (Name = acc.Name,
     AccountId =acc.Id,
        CloseDate = date.today (),
            StageName ='Prospecting');
 
 oppo.add(opty);

 
 }
insert oppo;
}
}
}