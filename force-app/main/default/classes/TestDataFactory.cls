public with sharing class TestDataFactory {


    public static List<Lead> createLeads() {
        List<Lead> leadList = new List<Lead>();
        List<String> testTitle = new List<String>{
            'vp', 'v.p.', 'vice president', 'mgr', 'manage', 'head of department', 'exec', 'chief', 'head', 'assist', 'deputy', 'jr'
        };

        for (Integer i = 0; i < 400; i++) {
            if (Math.mod(i, testTitle.size()) == 0) {
                leadList.add(new Lead(
                    FirstName = 'Jerry',
                    LastName = 'Seinfeld' + i,
                    Company = 'Self-Employed',
                    Title = testTitle[0]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 1) {
                leadList.add(new Lead(
                    FirstName = 'George',
                    LastName = 'Costanza' + i,
                    Company = 'Vandelay Industries',
                    Title = testTitle[1]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 2) {
                leadList.add(new Lead(
                    FirstName = 'Elaine',
                    LastName = 'Benes' + i,
                    Company = 'J. Peterman Catalog',
                    Title = testTitle[2]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 3) {
                leadList.add(new Lead(
                    FirstName = 'Cosmo',
                    LastName = 'Kramer' + i,
                    Company = 'Kramerica Industries',
                    Title = testTitle[3]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 4) {
                leadList.add(new Lead(
                    FirstName = 'Newman',
                    LastName = 'Newman' + i,
                    Company = 'United States Postal Service',
                    Title = testTitle[4]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 5) {
                leadList.add(new Lead(
                    FirstName = 'Morty',
                    LastName = 'Seinfeld' + i,
                    Company = 'Retired',
                    Title = testTitle[5]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 6) {
                leadList.add(new Lead(
                    FirstName = 'Helen',
                    LastName = 'Seinfeld' + i,
                    Company = 'Retired',
                    Title = testTitle[6]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 7) {
                leadList.add(new Lead(
                    FirstName = 'Frank',
                    LastName = 'Costanza' + i,
                    Company = 'Retired',
                    Title = testTitle[7]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 8) {
                leadList.add(new Lead(
                    FirstName = 'Estelle',
                    LastName = 'Costanza' + i,
                    Company = 'Retired',
                    Title = testTitle[8]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 9) {
                leadList.add(new Lead(
                    FirstName = 'Uncle',
                    LastName = 'Leo' + i,
                    Company = 'Retired',
                    Title = testTitle[9]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 10) {
                leadList.add(new Lead(
                    FirstName = 'David',
                    LastName = 'Puddy' + i,
                    Company = 'Car Dealership',
                    Title = testTitle[10]
                ));
            }
            if (Math.mod(i, testTitle.size()) == 11) {
                leadList.add(new Lead(
                    FirstName = 'Tim',
                    LastName = 'Whatley' + i,
                    Company = 'Dentist',
                    Title = testTitle[11]
                ));
            }
            // if (Math.mod(i, testTitle.size()) == 12) {
            //     leadList.add(new Lead(
            //         FirstName = 'Jackie',
            //         LastName = 'Chiles' + i,
            //         Company = 'Lawyer',
            //         Title = testTitle[12]
            //     ));
            // }
        }
        return leadList;
    }


}