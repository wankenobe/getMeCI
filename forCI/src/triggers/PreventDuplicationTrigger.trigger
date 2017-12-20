trigger  PreventDuplicationTrigger on Contact (before insert , before update) {

    Set<String> conSet = new Set<String>();

    for(Contact con : trigger.new){

       conSet.add(con.FirstName);        

    }
    List<Contact > listCon = new List<Contact >(
            [SELECT id,FirstName
             FROM contact
             WHERE FirstName in: conSet ]);
             
    for(Contact cont : trigger.new){

            if(listCon .size() > 0 ){
                cont.addError('Contact already exists with Name '+cont.FirstName);
               }
        }        

}