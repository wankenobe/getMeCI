trigger A1 on Account (before insert,before update) {
for(account a :trigger.new){
if(a.Industry=='Education')
   a.addError('we dont work with education org anymore');
}

}