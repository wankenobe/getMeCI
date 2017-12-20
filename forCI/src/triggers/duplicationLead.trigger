trigger duplicationLead on Lead (before insert) {
set<string> st = new set<string>();
set<string> stp = new set<string>();
for (Lead l : trigger.new){
if (l.Email!='' && l.Email!= null && l.Phone!='' && l.phone!=null)
{
st.add(l.Email);
stp.add(l.phone);

}
}
List<Lead> dupeLead = [select id ,Email, Phone from Lead Where Email in : st AND Phone in :stp];
    
    if (dupeLead.size ()>0){
    for(lead ln :trigger.new){
    
    
    
   
   ln.addError('Lead already exist');
    }
    }



}