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

int diceValue(Dice *gambleNumber) {
    return gambleNumber.diceValue;
}

int main(int argc, const char * argv[]) {
    NSLog(@"Roll the dice");
    
    //NSMutableArray *numbers = [[NSMutableArray alloc] init];
    
    Dice *gambleNumber1 = [[Dice alloc] init];
    Dice *gambleNumber2 = [[Dice alloc] init];
    Dice *gambleNumber3 = [[Dice alloc] init];
    Dice *gambleNumber4 = [[Dice alloc] init];
    Dice *gambleNumber5 = [[Dice alloc] init];
    
    InputCollector *newList = [[InputCollector alloc] init];
    
        NSString *inputString = @"r";
        NSString *initialString = [newList inputForPrompt:@"\nRoll the dice (y/n)?"];
    
    NSMutableArray *heldValues = [[NSMutableArray alloc] init];
    
        if ([initialString isEqualToString:@"n"]) {
            NSLog(@"Thank you");
            EXIT_SUCCESS;
        } else if ([initialString isEqualToString:@"y"]) {
        
        while ([inputString isEqualToString:@"r"]) {
            
        int diceValue1 = diceValue(gambleNumber1);
        int diceValue2 = diceValue(gambleNumber2);
        int diceValue3 = diceValue(gambleNumber3);
        int diceValue4 = diceValue(gambleNumber4);
        int diceValue5 = diceValue(gambleNumber5);
        
        int total = diceValue1 + diceValue2 + diceValue3 + diceValue4 + diceValue5;
        
        NSLog(@"\nDice a: %d\nDice b: %d\nDice c: %d\nDice d: %d\nDice e: %d\nTotal : %d", diceValue1, diceValue2, diceValue3, diceValue4, diceValue5, total);
        
        inputString = [newList inputForPrompt:@"\nChoose dice values to save or roll again without saving any (s/r)?"];
            
            if ([inputString isEqualToString:@"s"]) {
                NSString *selectedDices = [newList inputForPrompt:@"\nPlease mention values to be saved separated by space (a, b, c, d, e)"];
            }
        }
    }
    return 0;
}
