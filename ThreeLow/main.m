//
//  main.m
//  ThreeLow
//
//  Created by Narendra Thapa on 2016-01-13.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"
#import "GameController.h"


int main(int argc, const char * argv[]) {
    
    InputCollector *newList = [[InputCollector alloc] init];
    GameController *gamePlay = [[GameController alloc] init];
    Dice *dice = [[Dice alloc] init];
    
    NSUInteger playerOneScore = 0;
    NSUInteger playerTwoScore = 0;
    
    // Added two player mode for the dice game
    
    for (int playerCounter = 1; playerCounter < 3; playerCounter++) {
    
        NSString *inputString = @"roll";
        NSString *whileCheck = @"notcomplete";
        NSString *initialString;
        
        // Displays welcome message depending on which player is playing
        if (playerCounter == 1) {
        initialString = [newList inputForPrompt:@"\nRoll the dice Player 1 (you will get 3 attempts) (y/n)?"];
        } else {
        initialString = [newList inputForPrompt:@"\nRoll the dice Player 2 (you will get 3 attempts) (y/n)?"];
        }
        
        // Exits if player wishes so
            if ([initialString isEqualToString:@"n"]) {
            NSLog(@"Thank you");
            EXIT_SUCCESS;
        } else if ([initialString isEqualToString:@"y"]) {
            
        // Initializing attempt count (3 is max)
            int attempt = 0;
            
        while ([whileCheck isEqualToString:@"notcomplete"] && (attempt < 3)) {
        
        // Resets dice array before first roll from player
            if (attempt == 0) {
                [gamePlay diceValueArrayCreation];
                [gamePlay diceStatusResetUpdate];
            }
            
        //    [gamePlay diceValueArrayCreation];
        
        // Asks player for option
        inputString = [newList inputForPrompt:@"\nChoose save dice values (save)\nRoll again (roll)\nReset all (reset)?"];
            
            if ([inputString isEqualToString:@"save"]) {
                NSString *selectedDices = [newList inputForPrompt:@"\nPlease mention values to be saved separated by space (a, b, c, d, e)"];
                NSMutableArray *userChoice = [[NSMutableArray alloc] init];
                userChoice = [selectedDices componentsSeparatedByString:@" "];
                NSUInteger length = [userChoice count];
        
        // Updates the dice status for which player wants to hold value
                for (int i = 0; i < length; i++) {
                    
                    if ([userChoice[i] isEqualToString:@"a"]) {
                        dice = [gamePlay.diceValuesArray objectAtIndex:0];
                        [dice diceHold];}
                    else if ([userChoice[i] isEqualToString:@"b"]) {
                        dice = [gamePlay.diceValuesArray objectAtIndex:1];
                        [dice diceHold];}
                    else if([userChoice[i] isEqualToString:@"c"]) {
                        dice = [gamePlay.diceValuesArray objectAtIndex:2];
                        [dice diceHold];}
                    else if([userChoice[i] isEqualToString:@"d"]) {
                        dice = [gamePlay.diceValuesArray objectAtIndex:3];
                        [dice diceHold];}
                    else if([userChoice[i] isEqualToString:@"e"]) {
                        dice = [gamePlay.diceValuesArray objectAtIndex:4];
                        [dice diceHold];}
                    }
                [gamePlay printCurrentDiceArray];
                }
            
        // Player chooses to roll and new set of dice values are displayed with held ones locked
            else if ([inputString isEqualToString:@"roll"]) {
                attempt = attempt + 1;
            [gamePlay diceValueArrayUpdate];
            [gamePlay printCurrentDiceArray];
                }
        // Player chooses to reset and all dice holds are released
            else if ([inputString isEqualToString:@"reset"]) {
            [gamePlay diceStatusResetUpdate];
            [gamePlay printCurrentDiceArray];
                }
        // Checks the status of locks in dice array. Loop exits if all 5 values are locked
            whileCheck = [gamePlay statusCheck];
            
            }
        // Extracts the total score for each player after 3 attempts or 5 locks
            if (playerCounter == 1) {
                playerOneScore = [gamePlay totalScorePlayer];
            } else if (playerCounter == 2) {
                playerTwoScore = [gamePlay totalScorePlayer];
            }
        }
        
}
    // Compares scores and displays the winner and both scores
    if (playerOneScore > playerTwoScore) {
        NSLog(@"Player Two Won !! \nPlayer One Score %lu\nPlayer Two Score %lu", (unsigned long)playerOneScore, (unsigned long)playerTwoScore);
    } else if (playerOneScore < playerTwoScore) {
        NSLog(@"Player One Won !! \nPlayer One Score %lu\nPlayer Two Score %lu", (unsigned long)playerOneScore, (unsigned long)playerTwoScore);
    } else {
        NSLog(@"You both are winners :) !! \nPlayer One Score %lu\nPlayer Two Score %lu", (unsigned long)playerOneScore, (unsigned long)playerTwoScore);
    }
    return 0;
}
