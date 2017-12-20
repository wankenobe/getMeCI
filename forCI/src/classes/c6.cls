public class c6{
  
  List<Account> directacts = [select Name, Type, Industry, Phone, Fax from Account where Type ='Customer-Direct'];
   List<Account> channelacts = [select Name, Type, Industry, Phone, Fax from Account where Type ='Customer-Channel'];
   
   
   public List<Account> getdirectacts(){
       return directacts;
       }
        
   public List<Account> getchannelacts(){
       return channelacts;
       }
       
       
     }