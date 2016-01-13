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
    NSLog(@"Roll the dice");
    
    InputCollector *newList = [[InputCollector alloc] init];
    GameController *gamePlay = [[GameController alloc] init];
//    Dice *diceInstance = [[Dice alloc] init];
    
        NSString *inputString = @"r";
        NSString *initialString = [newList inputForPrompt:@"\nRoll the dice (y/n)?"];
    
            if ([initialString isEqualToString:@"n"]) {
            NSLog(@"Thank you");
            EXIT_SUCCESS;
        } else if ([initialString isEqualToString:@"y"]) {
        
        while ([inputString isEqualToString:@"r"]) {
            
            [gamePlay diceValueArrayCreation];
            
        inputString = [newList inputForPrompt:@"\nChoose dice values to save or roll again without saving any (s/r)?"];
            
            if ([inputString isEqualToString:@"s"]) {
                NSString *selectedDices = [newList inputForPrompt:@"\nPlease mention values to be saved separated by space (a, b, c, d, e)"];
                NSMutableArray *userChoice = [[NSMutableArray alloc] init];
                userChoice = [selectedDices componentsSeparatedByString:@" "];
                NSLog(@"%@", userChoice);
                NSUInteger length = [userChoice count];
                 NSLog(@"%lu", (unsigned long)length);
                
                //[gamePlay diceValueDisplay];
                
                Dice *dice = [[Dice alloc] init];
                
                for (int i =0; i<5;i++){
                dice = [gamePlay.diceValuesArray objectAtIndex:i];
                NSLog(@"%@ %lu", dice.diceStatus, (unsigned long)dice.diceCurrentValue);
                }
                
                
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
                for (int i =0; i<5;i++){
                    dice = [gamePlay.diceValuesArray objectAtIndex:i];
                    NSLog(@"%@ %lu", dice.diceStatus, (unsigned long)dice.diceCurrentValue);
                }
                int leftOut = 5 - length;
                [gamePlay diceValueArrayUpdate:leftOut];
                for (int i =0; i<5;i++){
                    dice = [gamePlay.diceValuesArray objectAtIndex:i];
                    NSLog(@"%@ %lu", dice.diceStatus, (unsigned long)dice.diceCurrentValue);
                }
            }
            }
        }
    return 0;
}
