//
//  Dice.m
//  ThreeLow
//
//  Created by Narendra Thapa on 2016-01-13.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init                                            // Initializes the dice object and sets the statuses to free
{
    self = [super init];
    if (self) {
        _diceStatus = @"free";
    }
    return self;
}

-(void)diceValueRandomiser {                                    // Generates random values for dices
    self.diceCurrentValue = arc4random_uniform(6) + 1;
}

-(void)diceHold {                                               // Sets the values to hold and not allow change
    self.diceStatus = @"held";
}

@end
