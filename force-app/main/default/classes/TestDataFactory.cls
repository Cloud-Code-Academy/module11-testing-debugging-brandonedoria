public with sharing class TestDataFactory {

    public static List<Lead> createLeads(Integer numberOfLeads, Integer uniqueLeads) {
        List<Lead> leadList = new List<Lead>();

        for (Integer i = 0; i < numberOfLeads; i++) {
            if (Math.mod(i, uniqueLeads) == 0) {
                leadList.add(new Lead(
                    FirstName = 'Jerry',
                    LastName = 'Seinfeld' + i,
                    Company = 'Self-Employed',
                    Title = 'vp',
                    LeadSource = 'Website',
                    Email = 'testEmail' + i + '@email.com',
                    Phone = '0123456789',
                    Industry = 'Technology'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 1) {
                leadList.add(new Lead(
                    FirstName = 'George',
                    LastName = 'Costanza' + i,
                    Company = 'Vandelay Industries',
                    Title = 'v.p.',
                    LeadSource = 'Website',
                    Email = 'testEmail' + i + '@email.com',
                    Phone = '0123456789',
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 2) {
                leadList.add(new Lead(
                    FirstName = 'Elaine',
                    LastName = 'Benes' + i,
                    Company = 'J. Peterman Catalog',
                    Title = 'vice president',
                    LeadSource = 'Website',
                    Email = 'testEmail' + i + '@email.com',
                    Phone = null,
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 3) {
                leadList.add(new Lead(
                    FirstName = 'Cosmo',
                    LastName = 'Kramer' + i,
                    Company = 'Kramerica Industries',
                    Title = 'mgr',
                    LeadSource = 'Website',
                    Email = null,
                    Phone = null,
                    Industry = 'Technology'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 4) {
                leadList.add(new Lead(
                    FirstName = 'Hello',
                    LastName = 'Newman' + i,
                    Company = 'United States Postal Service',
                    Title = 'manage',
                    LeadSource = 'Phone Inquiry',
                    Email = 'testEmail' + i + '@email.com',
                    Phone = null,
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 5) {
                leadList.add(new Lead(
                    FirstName = 'Morty',
                    LastName = 'Seinfeld' + i,
                    Company = 'Retired',
                    Title = 'head of department',
                    LeadSource = 'Website',
                    Email = null,
                    Phone = null,
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 6) {
                leadList.add(new Lead(
                    FirstName = 'Helen',
                    LastName = 'Seinfeld' + i,
                    Company = 'Retired',
                    Title = 'exec',
                    LeadSource = 'Phone Inquiry',
                    Email = null,
                    Phone = '0123456789',
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 7) {
                leadList.add(new Lead(
                    FirstName = 'Frank',
                    LastName = 'Costanza' + i,
                    Company = 'Retired',
                    Title = 'chief',
                    LeadSource = 'Website',
                    Email = 'testEmail' + i + '@email.com',
                    Phone = null,
                    Industry = 'Technology'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 8) {
                leadList.add(new Lead(
                    FirstName = 'Estelle',
                    LastName = 'Costanza' + i,
                    Company = 'Retired',
                    Title = 'head',
                    LeadSource = 'Phone Inquiry',
                    Email = null,
                    Phone = '0123456789',
                    Industry = 'Technology'
                ));
            }
            if (Math.mod(i, uniqueLeads) == 9) {
                leadList.add(new Lead(
                    FirstName = 'Uncle',
                    LastName = 'Leo' + i,
                    Company = 'Retired',
                    Title = 'assist',
                    LeadSource = null,
                    Email = null,
                    Phone = null,
                    Industry = null
                ));
            }
            if (Math.mod(i, uniqueLeads) == 10) {
                leadList.add(new Lead(
                    FirstName = 'David',
                    LastName = 'Puddy' + i,
                    Company = 'Pep Boys',
                    Title = 'deputy',
                    LeadSource = null,
                    Email = null,
                    Phone = null,
                    Industry = null
                ));
            }
            if (Math.mod(i, uniqueLeads) == 11) {
                leadList.add(new Lead(
                    FirstName = 'Tim',
                    LastName = 'Whatley' + i,
                    Company = 'Gentle Dental',
                    Title = 'jr',
                    LeadSource = null,
                    Email = null,
                    Phone = null,
                    Industry = null
                ));
            }
            if (Math.mod(i, uniqueLeads) == 12) {
                leadList.add(new Lead(
                    FirstName = 'Jackie',
                    LastName = 'Chiles' + i,
                    Company = 'The Chiles Firm',
                    Title = null,
                    LeadSource = null,
                    Email = null,
                    Phone = null,
                    Industry = null
                ));
            }
        }
        return leadList;
    }

    public static List<Account> createAccounts(Integer numberOfAccounts) {
        List<Account> accountList = new List<Account>();

        for (Integer i = 0; i < numberOfAccounts; i++) {
            accountList.add(new Account(
                Name = 'The Pensky Files' + i
            ));
        }
        return accountList;
    }

    public static List<Contact> createContacts(List<Account> insertedAccounts, Integer numberOfContacts) {
        List<Contact> contactList = new List<Contact>();

        List<Account> accountList = insertedAccounts;

        for (Integer i = 0; i < numberOfContacts; i++) {
            contactList.add(new Contact(
                FirstName = 'Arthur',
                LastName = 'Pensky' + i,
                AccountId = accountList[i].Id,
                Email = 'testEmail' + i + '@email.com'
            ));
        }
        return contactList;
    }
}