public class Sample {
    public List<WrapperClass> listWrapper {get;set;}
    
    public Sample() {
        List<Account> listAcct = [SELECT Name, Industry FROM Account LIMIT 5];
        
        if(listAcct.size() > 0) {
            listWrapper = new List<WrapperClass>();
            
            for(Account a : listAcct) {
                listWrapper.add(new WrapperClass(a));
            }
        }
    }
    
    public class WrapperClass {
        public Boolean isSelected {get;set;}
        public Account acct {get;set;}
        public WrapperClass(Account acct) {
            this.acct = acct;
        }        
    }
}