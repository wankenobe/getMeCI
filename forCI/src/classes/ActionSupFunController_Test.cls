@isTest
private class ActionSupFunController_Test{
  static testMethod void test_actionFunMethod_UseCase1(){
    ActionSupFunController obj01 = new ActionSupFunController();
    obj01.Display_This_String = 'test data';
    obj01.actionFunMethod();
  }
  static testMethod void test_actionSupMethod_UseCase1(){
    ActionSupFunController obj01 = new ActionSupFunController();
    obj01.Display_This_String = 'test data';
    obj01.actionSupMethod();
  }
}