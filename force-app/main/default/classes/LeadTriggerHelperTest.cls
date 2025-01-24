@IsTest
public with sharing class LeadTriggerHandlerTest {
    @IsTest
    static void handleTitleNormalization_updateToVicePresident_expectSuccess() {
        // Arrange
        List<Lead> leadsToNormalize = new List<Lead>();
        Integer randomNumberRange;
        Integer randomNumber = Integer.valueOf(Math.random() * randomNumberRange);

        for (Integer i = 0; i < 100 ; i++) {
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = null));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'vp ' + i));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'v.p. ' + i));
            leadsToNormalize.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'vice president ' + i));
        }

        // Act
        Test.startTest();
        insert leadsToNormalize;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :leadsToNormalize];
        for (Lead lead : updatedLeads) {
            if (lead.Title != null) {
                Assert.areEqual('Vice President', lead.Title, 'Title should be updated to Vice President');
                // Assert.areNotEqual(leadsToNormalize.size(), updatedLeads.size(), 'Updated leads should be < Inserted leads');
            }
        }
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