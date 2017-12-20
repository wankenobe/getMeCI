trigger AccName on Lead (before insert, before update) {

    //List to hold references to all leads invoking trigger...
    List<Lead> leadsToAddAccountId = new List<Lead>();

    //List to hold all company names from leads inserted/update
    //will be used in SOQL query to find accounts with same name     
    List<String> leadCompanyNames = new List<String>();

    //create a lookup map to use for populating Lead.Account_Leads__c fields with matching AccountId
    //Maps function simliar to Vlookups in Excel, where the 1st column is your key and the 2nd column is your value you want returned.   
    //It this case:
        //the 1st column will be the Account Name
        //the 2nd column will be the Account Id
    Map<String, Id> matchingAcctNames = new Map<String,Id>();


    //iterate over leads which invoked this trigger (basically any update/insert)... and add to list
    for (Lead newLead : trigger.new){

        //add lead to list to update with account Id before saving
        leadsToAddAccountId.add(newLead);

        //add lead company name to companyName list for SOQL Query to find matching accounts
        leadCompanyNames.add(newLead.Company);

    }


    //Next, query accounts that have matching names and load to lookup Map
    for(Account acct : [Select Id, Name from Account where Name =: leadCompanyNames]){

        matchingAcctNames.put(acct.Name, acct.Id);

    }

    //finally, iterate over your leads and update Account_Leads__c field if name matches
    for(Lead myLead : trigger.new ){

        myLead.AccountLeads__c = matchingAcctNames.get(myLead.Company);

    }


}