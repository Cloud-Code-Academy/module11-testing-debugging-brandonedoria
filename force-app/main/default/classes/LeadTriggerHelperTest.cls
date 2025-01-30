@IsTest
public with sharing class LeadTriggerHelperTest {
    @IsTest
    static void handleTitleNormalization_updateToCorrectTitle_expectSuccess() {
        // Arrange
        List<Lead> leadsToNormalize = TestDataFactory.createLeads();

        // Act
        Test.startTest();
        insert leadsToNormalize;
        Test.stopTest();

        // Assert
        List<Id> idList = new List<Id>();
        for (Lead lead : leadsToNormalize) {
            idList.add(lead.Id);
        }

        List<Lead> updatedLeads = [SELECT Id, FirstName, Title FROM Lead WHERE Id IN :idList];

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
        List<Lead> leadsToNormalize = TestDataFactory.createLeads();

        // Act
        Test.startTest();
        insert leadsToNormalize;
        Test.stopTest();

        // Assert
        List<Id> idList = new List<Id>();
        for (Lead lead : leadsToNormalize) {
            idList.add(lead.Id);
        }

        List<Lead> updatedLeads = [SELECT Id, FirstName, Lead_Score__c FROM Lead WHERE Id IN :idList];
        for (Lead lead : updatedLeads) {
            if (lead.FirstName.containsIgnoreCase('18')) {
                Assert.areEqual(18, lead.Lead_Score__c, 'Lead score should be 18');
            }
            if (lead.FirstName.containsIgnoreCase('eight')) {
                Assert.areEqual(8, lead.Lead_Score__c, 'Lead score should be 8');
            }
            if (lead.FirstName.containsIgnoreCase('three')) {
                Assert.areEqual(3, lead.Lead_Score__c, 'Lead score should be 3');
            }
            if (lead.FirstName.containsIgnoreCase('10')) {
                Assert.areEqual(10, lead.Lead_Score__c, 'Lead score should be 10');
            }
            if (lead.FirstName.containsIgnoreCase('zero')) {
                Assert.areEqual(0, lead.Lead_Score__c, 'Lead score should be 0');
            }
            if (lead.FirstName.containsIgnoreCase('five')) {
                Assert.areEqual(5, lead.Lead_Score__c, 'Lead score should be 5');
            }
            if (lead.FirstName.containsIgnoreCase('13')) {
                Assert.areEqual(13, lead.Lead_Score__c, 'Lead score should be 13');
            }
            if (lead.FirstName.containsIgnoreCase('15')) {
                Assert.areEqual(15, lead.Lead_Score__c, 'Lead score should be 15');
            }
            if (lead.FirstName.containsIgnoreCase('null')) {
                Assert.areEqual(0, lead.Lead_Score__c, 'Lead score should be 0');
            }
        }




    }





}