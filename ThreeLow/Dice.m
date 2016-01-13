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
        _diceStatus = @"no";
    }
    return self;
}

-(void)diceValueRandomiser {
    self.diceCurrentValue = arc4random_uniform(6) + 1;
    
//    if ([self.diceStatus isEqualToString:@"held"]) {
//        NSLog(@"This value has been held");
//    } else {
//        self.diceCurrentValue = arc4random_uniform(6) + 1;
//    }
////    return self.diceCurrentValue;
}

-(void)diceHold {
    self.diceStatus = @"held";
}




@end
