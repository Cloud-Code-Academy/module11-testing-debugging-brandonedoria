@IsTest
public with sharing class LeadTriggerHelperTest {
    @IsTest
    static void handleTitleNormalization_updateToCorrectTitle_expectSuccess() {
        // Arrange
        List<Lead> leadsToNormalize = new List<Lead>();

        List<String> testTitle = new List<String>{
            '', 'vp', 'v.p.', 'vice president', 'mgr', 'manage', 'head of department', 'exec', 'chief', 'head', 'assist', 'deputy', 'jr'
        };
        // List<String> testEmail = new List<String>();
        // List<String> testPhone = new List<String>();
        // List<String> testIndustry = new List<String>();

        for (Integer i = 0; i < 400; i++) {
            Integer randomNumber = Integer.valueOf(Math.random() * testTitle.size());
            leadsToNormalize.add(new Lead(
                FirstName = 'George',
                LastName = 'Costanza' + i,
                Company = 'Vandelay Industries',
                Title = testTitle[randomNumber]
            ));
        }

        // for (Integer i = 0; i < 100 ; i++) {
        //     leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = ''));
        //     leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'vp ' + i));
        //     leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'v.p. ' + i));
        //     leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'vice president ' + i));
        // }

        // Act
        Test.startTest();
        LeadTriggerHelper.handleTitleNormalization(leadsToNormalize);
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :leadsToNormalize];

        for (Lead lead : updatedLeads) {
            if (lead.Title == null) {
                Assert.areEqual(null, lead.Title, 'Lead Title should be null');
            } else if (lead.Title.containsIgnoreCase('vp') || lead.Title.containsIgnoreCase('v.p.') || lead.Title.containsIgnoreCase('vice president')) {
                Assert.areEqual('Vice President', lead.Title, 'Lead Title should be Vice President');
            } else if (lead.Title.containsIgnoreCase('mgr') || lead.Title.containsIgnoreCase('manage') || lead.Title.containsIgnoreCase('head of department')) {
                Assert.areEqual('Manager', lead.Title, 'Lead Title should be Manager');
            } else if (lead.Title.containsIgnoreCase('exec') || lead.Title.containsIgnoreCase('chief') || lead.Title.containsIgnoreCase('head')) {
                Assert.areEqual('Executive', lead.Title, 'Lead Title should be Executive');
            } else if (lead.Title.containsIgnoreCase('assist') || lead.Title.containsIgnoreCase('deputy') || lead.Title.containsIgnoreCase('jr')) {
                Assert.areEqual('Assistant', lead.Title, 'Lead Title should be Assistant');
            }
        }

        // for (Lead lead : updatedLeads) {
        //     if (lead.Title != null) {
        //         Assert.areEqual('Vice President', lead.Title, 'Title should be updated to Vice President');
        //     }
        // }
    }

    @IsTest
    static void handleTitleNormalization_updateToManager_expectSuccess() {
        // Arrange
        List<Lead> leadsToNormalize = new List<Lead>();
        for (Integer i = 0; i < 100 ; i++) {
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = null));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'mgr ' + i));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'manage ' + i));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'head of department ' + i));
        }

        // Act
        Test.startTest();
        insert leadsToNormalize;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :leadsToNormalize];
        for (Lead lead : updatedLeads) {
            Assert.areEqual('Manager', lead.Title, 'Title should be updated to Manager');
        }
    }

    @IsTest
    static void handleTitleNormalization_updateToExecutive_expectSuccess() {
        // Arrange
        List<Lead> leadsToNormalize = new List<Lead>();
        for (Integer i = 0; i < 100 ; i++) {
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = null));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'exec ' + i));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'chief ' + i));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'head ' + i));
        }

        // Act
        Test.startTest();
        insert leadsToNormalize;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :leadsToNormalize];
        for (Lead lead : updatedLeads) {
            Assert.areEqual('Executive', lead.Title, 'Title should be updated to Executive');
        }
    }

    @IsTest
    static void handleTitleNormalization_updateToAssistant_expectSuccess() {
        // Arrange
        List<Lead> leadsToNormalize = new List<Lead>();
        for (Integer i = 0; i < 100 ; i++) {
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = null));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'assist ' + i));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'deputy ' + i));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'jr ' + i));
        }

        // Act
        Test.startTest();
        insert leadsToNormalize;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :leadsToNormalize];
        for (Lead lead : updatedLeads) {
            Assert.areEqual('Assistant', lead.Title, 'Title should be updated to Assistant');
        }
    }

    @IsTest
    static void handleAutoLeadScoring_leadScoreUpdated_expectSuccess () {
        // Arrange
        List<Lead> leadsToScore = new List<Lead>();
        for (Integer i = 0; i < 100; i++) {
            leadsToScore.add(new Lead());
        }
        // Act


        // Assert

    }





}