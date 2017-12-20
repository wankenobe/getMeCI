trigger creatCOntOppo on Account (after insert) {
  
  List<Opportunity> ListOppo=new List<Opportunity>();
  
  List<Contact> ListCont =new List<Contact>(); 
       
        for(Account a : trigger.new){
          
        If(a.AnnualRevenue > 10000){
    
    Opportunity Opp=new Opportunity();
    
    Contact cn =new Contact();
      
      Opp.Accountid=a.Id;
        
        Opp.Name =a.Name;
        
        Opp.StageName='Prospecting';
        
        Opp.CloseDate= date.today();
        
        ListOppo.add(Opp);
    
    cn.Accountid=a.Id;
    
    cn.LastName=a.Name;
    
    ListCont.add(cn);

}
    insert ListOppo ;
        insert ListCont;
}
}