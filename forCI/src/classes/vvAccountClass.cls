public with sharing class vvAccountClass 
{

    public String getWrapaccountList() {
        return null;
    }


    public PageReference AccountList() {
        return null;
    }


    

  //public List<Account> accList {get; set;}
  public List<Id> AccountIds {get; set;}
  //public integer counter = 0;
  //public List<Contact> selectedContacts {get; set; }
  public List<aAccount> AccountList {get; set;}



  public vvAccountClass()
  {
    AccountList  = new list<aAccount>();
    result();
  }
  public void result()
  {
    for(Account acc :  [SELECT Id, Name, (Select Id, Name,Phone,  Email From Contacts)from Account])
    {
      AccountList.add(new aAccount(acc));
    }
  }

 
  public List<Account> getselectedAccounts()
  {
    system.debug('@@@@@@@@@@@@@@@@@@@@@@@'+AccountList);  
    AccountIds= new List<Id>();
    list<Account>selectedAccounts = new List<Account>();
    for(aAccount ac : AccountList)
    {
      if(ac.selected != false)
      {
        selectedAccounts.add(ac.acc);
        // checkbox checked accounts added to selectedAccounts List
        AccountIds.add(ac.acc.id);
        // Id's of selected accounts obtained
      }
    }
    return selectedAccounts;
  }
  // selected accounts

  // related contacts of selected Accounts
  public List<Contact> getselectedContacts()
  {
    system.debug('###########'+AccountList);
    list<Contact> selectedContacts = new List<Contact>();
    selectedContacts = [SELECT Name,Email,Phone FROM Contact WHERE Account.Id IN : (AccountIds)];
    return selectedContacts;
  }




  // wrapper controller class
  public class aAccount
  {
    public Account acc{get; set;}
    public boolean selected {get; set;}

    public aAccount(Account a)
    {
      selected = false;
      acc = a;
    }
  }

  public void getSelected(){

  }
}