global class leaddelete implements Schedulable {

   global void execute(SchedulableContext ctx) {
      DeleteLead p = new DeleteLead();
        database.executeBatch(p);
   }   
}