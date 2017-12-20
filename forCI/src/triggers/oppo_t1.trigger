trigger oppo_t1 on Opportunity (before insert,before update) {
    for(Opportunity o :trigger.new){
    if(trigger.isInsert && o.Amount<5000)
    o.addError('Amount should not be less than 5000');
    
    else if(trigger.isUpdate && o.Amount<3000)
    o.addError('Amount should not be less than 3000');
    
    }

}