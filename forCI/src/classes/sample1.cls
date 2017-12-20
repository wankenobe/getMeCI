public class sample1 {

    List<Account> acts = [select Name, Industry  from Account limit 10];
    List<Opportunity> oppo = [select Name, StageName from Opportunity limit 10];
    
    
    
    public List<Account> getacts (){
    
    return acts ;
    
    }
    
    Public List<Opportunity> getoppo (){
    return oppo ;
    
    }
  Public PageReference tab(){
      return Page.v51;
      }
      
  Public PageReference section(){
  return Page.vf50;
  
  }
  
    


}