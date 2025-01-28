@IsTest
public with sharing class LeadTriggerHelperTest {
    @IsTest
    static void handleTitleNormalization_updateToCorrectTitle_expectSuccess() {
        // Arrange
        List<Lead> leadsToNormalize = TestDataFactory.createLeads();

        // Act
        Test.startTest();
        // LeadTriggerHelper.handleTitleNormalization(leadsToNormalize);
        insert leadsToNormalize;
        Test.stopTest();

        // Assert
        List<Id> idList = new List<Id>();
        for (Lead lead : leadsToNormalize) {
            idList.add(lead.Id);
        }

        List<Lead> updatedLeads = [SELECT Id, FirstName, Title FROM Lead WHERE Id IN :idList];

        for (Lead lead : updatedLeads) {
            if (lead.FirstName == 'Jerry' || lead.FirstName == 'George' || lead.FirstName == 'Elaine') {
                Assert.areEqual('Vice President', lead.Title, 'Title should have been changed to Vice President');
            }
            if (lead.FirstName == 'Cosmo' || lead.FirstName == 'Newman' || lead.FirstName == 'Morty') {
                Assert.areEqual('Manager', lead.Title, 'Title should have been changed to Manager');
            }
            if (lead.FirstName == 'Helen' || lead.FirstName == 'Frank' || lead.FirstName == 'Estelle') {
                Assert.areEqual('Executive', lead.Title, 'Title should have been changed to Executive');
            }
            if (lead.FirstName == 'Uncle' || lead.FirstName == 'David' || lead.FirstName == 'Tim') {
                Assert.areEqual('Assistant', lead.Title, 'Title should have been changed to Assistant');
            }
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