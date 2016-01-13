//
//  Dice.m
//  ThreeLow
//
//  Created by Narendra Thapa on 2016-01-13.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        _diceStatus = @"free";
    }
    return self;
}

-(void)diceValueRandomiser {
    self.diceCurrentValue = arc4random_uniform(6) + 1;
}

-(void)diceHold {
    self.diceStatus = @"held";
}




@end
