@IsTest
public with sharing class LeadTriggerHelperTest {
    @IsTest
    static void handleTitleNormalization_updateToCorrectTitle_expectSuccess() {
        // Arrange
        List<Lead> leadsToNormalize = TestDataFactory.createLeads();

        // Act
        Test.startTest();
        LeadTriggerHelper.handleTitleNormalization(leadsToNormalize);
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, FirstName, Title FROM Lead WHERE Id IN :leadsToNormalize];

        for (Lead lead : updatedLeads) {
            if (lead.Title == null) {
                Assert.areEqual(null, lead.Title, 'Title should be null');
            } else {
                if (lead.FirstName.containsIgnoreCase('Jerry') || lead.FirstName.containsIgnoreCase('George') || lead.FirstName.containsIgnoreCase('Elaine')) {
                    Assert.areEqual('Vice President', lead.Title, 'Title should have been changed to Vice President');
                }
                if (lead.FirstName.containsIgnoreCase('Cosmo') || lead.FirstName.containsIgnoreCase('Hello') || lead.FirstName.containsIgnoreCase('Morty')) {
                    Assert.areEqual('Manager', lead.Title, 'Title should have been changed to Manager');
                }
                if (lead.FirstName.containsIgnoreCase('Helen') || lead.FirstName.containsIgnoreCase('Frank') || lead.FirstName.containsIgnoreCase('Estelle')) {
                    Assert.areEqual('Executive', lead.Title, 'Title should have been changed to Executive');
                }
                if (lead.FirstName.containsIgnoreCase('Uncle') || lead.FirstName.containsIgnoreCase('David') || lead.FirstName.containsIgnoreCase('Tim')) {
                    Assert.areEqual('Assistant', lead.Title, 'Title should have been changed to Assistant');
                }
            }
        }
    }

    @IsTest
    static void handleAutoLeadScoring_leadScoreUpdated_expectSuccess () {
        // Arrange
        List<Lead> leadsToScore = TestDataFactory.createLeads();

        // Act
        Test.startTest();
        LeadTriggerHelper.handleAutoLeadScoring(leadsToScore);
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, Lead_Score__c, Industry, Phone, LeadSource, Email FROM Lead WHERE Id IN :leadsToScore];

        for (Lead lead : updatedLeads) {
            if (lead.Industry == 'Technology' && lead.Phone != null && lead.LeadSource == 'Website' && lead.Email != null) {
                Assert.areEqual(18, lead.Lead_Score__c, 'Lead Score should be 18');
            } else if (lead.Industry == 'Technology' && lead.Phone != null) {
                Assert.areEqual(15, lead.Lead_Score__c, 'Lead Score should be 15');
            } else if(lead.Industry == 'Technology' && lead.LeadSource == 'Website' && lead.Email != null) {
                Assert.areEqual(13, lead.Lead_Score__c, 'Lead Score should be 13');
            } else if (lead.Industry == 'Technology') {
                Assert.areEqual(10, lead.Lead_Score__c, 'Lead Score should be 10');
            } else if (lead.Phone != null && lead.LeadSource == 'Website' && lead.Email != null) {
                Assert.areEqual(8, lead.Lead_Score__c, 'Lead Score should be 8');
            } else if (lead.Phone != null) {
                Assert.areEqual(5, lead.Lead_Score__c, 'Lead Score should be 5');
            } else if (lead.LeadSource == 'Website' && lead.Email != null) {
                Assert.areEqual(3, lead.Lead_Score__c, 'Lead Score should be 3');
            } else {
                Assert.areEqual(0, lead.Lead_Score__c, 'Lead Score should be 0');
            }
        }
    }

    @IsTest
    static void handleLeadAutoConvert_leadConvertedOnInsert_expectSuccess () {
        // Arrange
        List<Account> accountList = TestDataFactory.createAccounts();
        insert accountList;

        List<Contact> contactList = TestDataFactory.createContacts(accountList);
        insert contactList;

        List<Lead> leadsToConvert = TestDataFactory.createLead();

        // Act
        Test.startTest();
        insert leadsToConvert;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, IsConverted FROM Lead WHERE Id IN :leadsToConvert];
        Assert.isTrue(updatedLeads.size() > 0, 'List should not be empty');
        for (Lead lead : updatedLeads) {
            Assert.isTrue(lead.IsConverted, 'Lead should be converted');
        }
    }

    @IsTest
    static void handleLeadAutoConvert_leadConvertedOnInsert_expectNoConversion () {
        // Arrange
        List<Account> accountList = TestDataFactory.createAccounts();
        insert accountList;

        List<Contact> contactList = TestDataFactory.createContacts(accountList);
        contactList.add(new Contact(
            FirstName = 'Jerry',
            LastName = 'Seinfeld',
            AccountId = accountList[0].Id,
            Email = contactList[0].Email
            ));

        insert contactList;

        List<Lead> leadsToConvert = TestDataFactory.createLead();

        // Act
        Test.startTest();
        insert leadsToConvert;
        Test.stopTest();

        // Assert
        List<Lead> updatedLeads = [SELECT Id, IsConverted FROM Lead WHERE Id IN :leadsToConvert];
        Assert.isTrue(updatedLeads.size() > 0, 'Lead should not be empty');
        for (Lead lead : updatedLeads) {
            Assert.isFalse(lead.IsConverted, 'Lead should not be converted');
        }
    }
}