trigger updateShippingSt on Account (before update) {
    
    
    for(Account a : trigger.new){
        
        if(a.rating == 'Hot')
        a.ShippingStreet = a.BillingStreet;
        
    }    
}