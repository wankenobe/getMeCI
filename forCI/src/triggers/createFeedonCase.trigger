trigger createFeedonCase on Case (after insert){
List<FeedItem> newfeed = new List<FeedItem>();
    for(Case cs : trigger.new){
    if(cs.Priority == 'High'){
    FeedItem feed = new FeedItem ();
    feed.ParentId = cs.Id;
    feed.Body = 'Alert!! ' + cs.CaseNumber + ' has high priority';
        
        newfeed.add(feed);
    }
    if(newfeed.size()>0)
    insert newfeed ;
    
    }

}