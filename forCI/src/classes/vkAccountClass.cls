public with sharing class vkAccountClass 
{
  //public List<Account> accList {get; set;}
  public List<Id> AccountIds {get; set;}
  public integer counter = 0;
  //public List<Contact> selectedContacts {get; set; }
  public List<aAccount> AccountList {get; set;}



  public vkAccountClass()
  {
    AccountList  = new list<aAccount>();
    result();
  }
  public void result()
  {
    for(Account acc :  [SELECT Id, Name,Phone,Fax,AccountNumber, AnnualRevenue, (Select Id, Name, Birthdate, Department, LeadSource, Phone From Contacts)from Account LIMIT 3 OFFSET: counter])
    {
      AccountList.add(new aAccount(acc));
    }
  }

  public void nextbtn(){
    counter += 5 ;
    Result();}
  public void fstbtn(){
    counter = 0;
    Result();}
  public void prvbtn(){
    counter -= 5 ;
    Result();}
    public boolean getprv(){
    if(counter == 0)
        return true;
    else
        return false;}



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
    selectedContacts = [SELECT Name, Birthdate, Department, LeadSource, Phone FROM Contact WHERE Account.Id IN : (AccountIds)];
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