trigger cmap on Contact (before insert) {
    
    for(contact c :trigger.new){
        
        system.debug('c.Account.Name');
    }

}