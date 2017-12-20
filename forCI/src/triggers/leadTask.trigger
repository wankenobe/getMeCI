trigger leadTask on Lead (after insert) {
  List<Task> lTask = new List<Task>();
      Task t;
for(lead le : trigger.new){
if(le.Status== 'Open - Not Contacted'){
                t.Priority = 'Normal';
                 t.Status = 'Not Started';
                
                 lTask.add(t);
                 insert t ;

}
}
}