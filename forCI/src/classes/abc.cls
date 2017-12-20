public class abc{

    public abc(ApexPages.StandardSetController controller) {

    }



   public  PageReference dosubmit(){

        // create case, etc.

        system.debug('test');

        PageReference pr = new PageReference('http://www.baidu.com'); // google is blocked here
        pr.setRedirect(true);
        return pr;
    }

}