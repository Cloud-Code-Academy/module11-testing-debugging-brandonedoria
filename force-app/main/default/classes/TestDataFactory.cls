public with sharing class TestDataFactory {


    public static List<Lead> createLeads() {
        List<Lead> leadList = new List<Lead>();
        Integer numberOfLeads = 400;

        List<String> testTitle = new List<String>{
            'vp', 'v.p.', 'vice president', 'mgr', 'manage', 'head of department', 'exec', 'chief', 'head', 'assist', 'deputy', 'jr', null
        };

        List<String> testSource = new List<String>{
            'Website', 'Phone Inquiry', 'Partner Referral', 'Purchased List', 'Other', null
        };

        List<String> testEmail = new List<String>();
        for (Integer i = 0; i < testTitle.size() - 1; i++) {
            testEmail.add('testEmail' + i + '@email.com');
            if (i == testTitle.size() - 2) {
                testEmail.add(null);
            }
        }

        List<String> testPhone = new List<String>();
        for (Integer i = 0; i < testTitle.size() - 1; i++) {
            testPhone.add('+' + i + ' 123-456-789');
            if (i == testTitle.size() - 2) {
                testPhone.add(null);
            }
        }

        List<String> testIndustry = new List<String>{
            'Technology', 'Agriculture', 'Banking', 'Consulting', 'Engineering', 'Food & Beverage', 'Government', 'Hospitality', 'Insurance', 'Media', 'Not For Profit', 'Recreation', null
        };

        for (Integer i = 0; i < numberOfLeads; i++) {
            if (Math.mod(i, testTitle.size()) == 0) {
                leadList.add(new Lead(
                    FirstName = 'Jerry - 18',
                    LastName = 'Seinfeld' + i,
                    Company = 'Self-Employed',
                    Title = 'vp',
                    LeadSource = 'Website',
                    Email = 'testEmail@email.com',
                    Phone = '0123456789',
                    Industry = 'Technology'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 1) {
                leadList.add(new Lead(
                    FirstName = 'George - eight',
                    LastName = 'Costanza' + i,
                    Company = 'Vandelay Industries',
                    Title = 'v.p.',
                    LeadSource = 'Website',
                    Email = 'testEmail@email.com',
                    Phone = '0123456789',
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 2) {
                leadList.add(new Lead(
                    FirstName = 'Elaine - three',
                    LastName = 'Benes' + i,
                    Company = 'J. Peterman Catalog',
                    Title = 'vice president',
                    LeadSource = 'Website',
                    Email = 'testEmail@email.com',
                    Phone = null,
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 3) {
                leadList.add(new Lead(
                    FirstName = 'Cosmo - 10',
                    LastName = 'Kramer' + i,
                    Company = 'Kramerica Industries',
                    Title = 'mgr',
                    LeadSource = 'Website',
                    Email = null,
                    Phone = null,
                    Industry = 'Technology'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 4) {
                leadList.add(new Lead(
                    FirstName = 'Hello - zero',
                    LastName = 'Newman' + i,
                    Company = 'United States Postal Service',
                    Title = 'manage',
                    LeadSource = 'Phone Inquiry',
                    Email = 'testEmail@email.com',
                    Phone = null,
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 5) {
                leadList.add(new Lead(
                    FirstName = 'Morty - zero',
                    LastName = 'Seinfeld' + i,
                    Company = 'Retired',
                    Title = 'head of department',
                    LeadSource = 'Website',
                    Email = null,
                    Phone = null,
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 6) {
                leadList.add(new Lead(
                    FirstName = 'Helen - five',
                    LastName = 'Seinfeld' + i,
                    Company = 'Retired',
                    Title = 'exec',
                    LeadSource = 'Phone Inquiry',
                    Email = null,
                    Phone = '0123456789',
                    Industry = 'Agriculture'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 7) {
                leadList.add(new Lead(
                    FirstName = 'Frank - 13',
                    LastName = 'Costanza' + i,
                    Company = 'Retired',
                    Title = 'chief',
                    LeadSource = 'Website',
                    Email = 'testEmail@email.com',
                    Phone = null,
                    Industry = 'Technology'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 8) {
                leadList.add(new Lead(
                    FirstName = 'Estelle - 15',
                    LastName = 'Costanza' + i,
                    Company = 'Retired',
                    Title = 'head',
                    LeadSource = 'Phone Inquiry',
                    Email = null,
                    Phone = '0123456789',
                    Industry = 'Technology'
                ));
            }
            if (Math.mod(i, testTitle.size()) == 9) {
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
            if (Math.mod(i, testTitle.size()) == 10) {
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
            if (Math.mod(i, testTitle.size()) == 11) {
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
            if (Math.mod(i, testTitle.size()) == 12) {
                leadList.add(new Lead(
                    FirstName = 'Jackie - null',
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


}