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
    
    for (int playerCounter = 1; playerCounter < 3; playerCounter) {
    
        NSString *inputString = @"roll";
        NSString *whileCheck = @"notcomplete";
        NSString *initialString = [newList inputForPrompt:@"\nRoll the dice (you will get 3 attempts) (y/n)?"];
    
            if ([initialString isEqualToString:@"n"]) {
            NSLog(@"Thank you");
            EXIT_SUCCESS;
        } else if ([initialString isEqualToString:@"y"]) {
            
            int attempt = 0;
            
        while ([whileCheck isEqualToString:@"notcomplete"] && (attempt < 3)) {
            
            
            
            [gamePlay diceValueArrayCreation];
            
        inputString = [newList inputForPrompt:@"\nChoose save dice values (save)\nRoll again (roll)\nReset all (reset)?"];
            
            if ([inputString isEqualToString:@"save"]) {
                NSString *selectedDices = [newList inputForPrompt:@"\nPlease mention values to be saved separated by space (a, b, c, d, e)"];
                NSMutableArray *userChoice = [[NSMutableArray alloc] init];
                userChoice = [selectedDices componentsSeparatedByString:@" "];
                //NSLog(@"%@", userChoice);
                NSUInteger length = [userChoice count];
                //NSLog(@"%lu", (unsigned long)length);
                
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
            else if ([inputString isEqualToString:@"roll"]) {
                attempt = attempt + 1;
            [gamePlay diceValueArrayUpdate];
            [gamePlay printCurrentDiceArray];
                }
            else if ([inputString isEqualToString:@"reset"]) {
            [gamePlay diceStatusResetUpdate];
            [gamePlay printCurrentDiceArray];
                }
            whileCheck = [gamePlay statusCheck];
            
            }
        }
        if (playerCounter == 1) {
            playerOneScore = [gamePlay totalScorePlayer];
        } else if (playerCounter == 2) {
            playerTwoScore = [gamePlay totalScorePlayer];
        }
}
    if (playerOneScore < playerTwoScore) {
        NSLog(@"Player Two Won !! \nPlayer One Score %lu\nPlayer Two Score %lu", (unsigned long)playerOneScore, (unsigned long)playerTwoScore);
    } else if (playerOneScore > playerTwoScore) {
        NSLog(@"Player Two Won !! \nPlayer One Score %lu\nPlayer Two Score %lu", (unsigned long)playerOneScore, (unsigned long)playerTwoScore);
    } else {
        NSLog(@"You both are winners :) !! \nPlayer One Score %lu\nPlayer Two Score %lu", (unsigned long)playerOneScore, (unsigned long)playerTwoScore);
    }
    return 0;
}
