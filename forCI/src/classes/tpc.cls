public class tpc{

    public PageReference dosubmit(){

        // create case, etc.

        system.debug('test');

        PageReference pr = new PageReference('https://ap4.salesforce.com/01Z6F000001E8GX');
        pr.setRedirect(true);
        return pr;
    }

}