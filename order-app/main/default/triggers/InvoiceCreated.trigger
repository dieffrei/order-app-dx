trigger InvoiceCreated on InvoiceCreated__e (after insert) {
    List<Invoice__c> invoices = new List<Invoice__c>();
    for (InvoiceCreated__e event : trigger.new) {
        Invoice__c invoice = new Invoice__c(Name = event.Code__c, 
                                            Code__c = event.Code__c,
                                            TotalValue__c = event.TotalValue__c,
                                           	Opportunity__r = new Opportunity(Code__c = event.OpportunityCode__c));
        invoices.add(invoice);                                       
    }
    upsert invoices Code__c ;
 }