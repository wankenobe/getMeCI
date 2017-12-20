@isTest(seeAlldata=true)
public class updateOwner_test { 
   
    public static testMethod void testowner(){
    
        // GET USER FROM USER TABLE...
        //User u = [select name, Id  FROM user LIMIT 1];
        
        // RUN AS USER...
       // system.runAs(u)
        //{
            
            // TEST ADDING A NEW ACCOUNT...                        
            Opportunity opp = new Opportunity(
                name = 'temp validation opp',
                StageName='Prospecting',
                CloseDate=system.today()
             );
            insert opp; 
            system.debug('----->>> END ADDING Opportunity: ' + opp.name);
            
            
            // READ ACCOUNT...
            Contract c = [Select Id,opportunity__c,OwnerId from Contract WHERE name = 'temp validation opp'];
            system.debug('----->>> END READING Opportunity: ' + c.name);
        
            // TEST ADDING A NEW CONTACT...
            Contract con = new Contract(
                //opportunity__c= opp.id,
                //Account ='Amroha',
                OwnerId = opp.owner.id,
                    Status='Activated',
                    StartDate = system.today(),
                       ContractTerm=12
                //Owner_name_txt__c = 'textdata',
                //Owner_region__c = 'testregion'
                );
            insert con;  
            system.debug('----->>> END INSERT CONTRACT: ' + opp.name);
        }
        //system.debug('----->>> RUNNING AS USER: ' + u.name);

   }        
        
//}