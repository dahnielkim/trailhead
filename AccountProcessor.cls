public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> accountIds) {
        List<Account> Accounts = [SELECT Id, Number_of_Contacts__c, (SELECT Id from Contacts) from Account WHERE Id in :accountIds];
        
        for (Account acc : Accounts) {
            List<Contact> cont = acc.Contacts;
            acc.Number_of_Contacts__c = cont.size();
        }
        
        update Accounts;
    }
}