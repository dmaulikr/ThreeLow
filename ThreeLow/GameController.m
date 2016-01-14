//
//  GameController.m
//  ThreeLow
//
//  Created by Narendra Thapa on 2016-01-13.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController                                  // Initializes the dice array

- (instancetype)init
{
    self = [super init];
    if (self) {
        _diceValuesArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)diceValueArrayCreation {                                 // Populates the dice array with first elements
    
    for (int i=0; i <5; i++) {
        Dice *dice = [[Dice alloc] init];
        [dice diceValueRandomiser];
        [self.diceValuesArray addObject:dice];
    }
}


-(void)diceValueArrayUpdate {                                   // Changes dice values for status not held
    
    for (int i=0; i < 5; i++) {
        Dice *diceU = [self.diceValuesArray objectAtIndex:i];
        if ([diceU.diceStatus isEqualToString:@"held"]) {
        } else {
        [diceU diceValueRandomiser];
        [self.diceValuesArray replaceObjectAtIndex:i withObject:diceU];
        }
    }
}


-(void)diceStatusResetUpdate {                                  // Resets all locks so that next update-method-call will change all 5 element values
    
    for (int i=0; i < 5; i++) {
        Dice *diceU = [self.diceValuesArray objectAtIndex:i];
        diceU.diceStatus = @"free";
        [self.diceValuesArray replaceObjectAtIndex:i withObject:diceU];
        
    }
}

-(void)printCurrentDiceArray {                                  // Prints the values of all array elements with their statuses
    self.totalScore = 0;
    NSString *customIndex;
    for (int i =0; i<5;i++){
        //Dice *diceDisplay = [[Dice alloc] init];
        Dice *diceDisplay = [self.diceValuesArray objectAtIndex:i];
                if (i == 0) {   customIndex = @"a";
        } else if (i == 1) {    customIndex = @"b";
        } else if (i == 2) {    customIndex = @"c";
        } else if (i == 3) {    customIndex = @"d";
        } else if (i == 4) {    customIndex = @"e";
        }
        if ([diceDisplay.diceStatus isEqualToString:@"held"]) {
            NSLog(@"%@: [\%lu]", customIndex, (unsigned long)diceDisplay.diceCurrentValue);
        } else {
            NSLog(@"%@: %lu", customIndex, (unsigned long)diceDisplay.diceCurrentValue);
        }
        self.totalScore = self.totalScore + diceDisplay.diceCurrentValue;
    }
    NSLog(@"Total is %lu", (unsigned long)self.totalScore);
}

-(NSUInteger)totalScorePlayer {                                 // Returns the total score of each playery
    self.totalScore = 0;
    for (int i =0; i<5;i++){
        Dice *diceDisplay = [self.diceValuesArray objectAtIndex:i];
        self.totalScore = self.totalScore + diceDisplay.diceCurrentValue;
    }
    return self.totalScore;
}


-(NSString *)statusCheck {                                      // Provides the status of dice array
    int found = 0;
    int i = 0;
    for (i = 0; i < 5; i++){
        Dice *diceDisplay = [self.diceValuesArray objectAtIndex:i];
        if ([diceDisplay.diceStatus isEqualToString:@"held"]) {
            found = found + 1;
        }
    }
    if (found == 5) {
        return @"complete";
    } else {
        return @"notcomplete";
    }
}


@end
