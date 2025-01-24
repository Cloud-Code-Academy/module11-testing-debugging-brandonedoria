@IsTest
public with sharing class LeadTriggerHandlerTest {
    @IsTest
    static void handleTitleNormalization_updateToVicePresident_expectSuccess() {
        // Arrange
        List<Lead> vpLeads = new List<Lead>();
        for (Integer i = 0; i < 100 ; i++) {
            vpLeads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'vp ' + i));
            vpleads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'v.p. ' + i));
            vpleads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'vice president ' + i));
        }

        // Act
        Test.startTest();
        insert vpLeads;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :vpLeads];
        for (Lead lead : updatedLeads) {
            Assert.areEqual('Vice President', lead.Title, 'Title should be updated to Vice President');
        }
    }

    @IsTest
    static void handleTitleNormalization_updateToManager_expectSuccess() {
        // Arrange
        List<Lead> vpLeads = new List<Lead>();
        for (Integer i = 0; i < 100 ; i++) {
            vpLeads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'mgr ' + i));
            vpleads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'manage ' + i));
            vpleads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'head of department ' + i));
        }

        // Act
        Test.startTest();
        insert vpLeads;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :vpLeads];
        for (Lead lead : updatedLeads) {
            Assert.areEqual('Manager', lead.Title, 'Title should be updated to Manager');
        }
    }

    @IsTest
    static void handleTitleNormalization_updateToExecutive_expectSuccess() {
        // Arrange
        List<Lead> vpLeads = new List<Lead>();
        for (Integer i = 0; i < 100 ; i++) {
            vpLeads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'exec ' + i));
            vpleads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'chief ' + i));
            vpleads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'head ' + i));
        }

        // Act
        Test.startTest();
        insert vpLeads;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :vpLeads];
        for (Lead lead : updatedLeads) {
            Assert.areEqual('Executive', lead.Title, 'Title should be updated to Executive');
        }
    }

    @IsTest
    static void handleTitleNormalization_updateToAssistant_expectSuccess() {
        // Arrange
        List<Lead> vpLeads = new List<Lead>();
        for (Integer i = 0; i < 100 ; i++) {
            vpLeads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'assist ' + i));
            vpleads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'deputy ' + i));
            vpleads.add(new Lead(FirstName = 'George', LastName = 'Costanza', Company = 'Vandelay Industries', Title = 'jr ' + i));
        }

        // Act
        Test.startTest();
        insert vpLeads;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Title FROM Lead WHERE Id IN :vpLeads];
        for (Lead lead : updatedLeads) {
            Assert.areEqual('Assistant', lead.Title, 'Title should be updated to Assistant');
        }
    }






}