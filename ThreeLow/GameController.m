//
//  GameController.m
//  ThreeLow
//
//  Created by Narendra Thapa on 2016-01-13.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _diceValuesArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)diceValueArrayCreation {
    
    
    for (int i=0; i <5; i++) {
        
        Dice *dice = [[Dice alloc] init];
        
        [dice diceValueRandomiser];
        
        NSLog(@"%lu", dice.diceCurrentValue);
        
        [self.diceValuesArray addObject:dice];
        
        //NSLog(@"%@", @(dice.diceCurrentValue));
    }
    
    //NSUInteger total = diceValue1 + diceValue2 + diceValue3 + diceValue4 + diceValue5;
    ;
    
}


-(void)diceValueArrayUpdate:(int)leftOut {
    
    
    for (int i=0; i < 5; i++) {
        
        Dice *diceU = [[Dice alloc] init];
        diceU = [self.diceValuesArray objectAtIndex:i];
        
        if ([diceU.diceStatus isEqualToString:@"held"]) {
            NSLog(@"No can do");
        } else {
        
        [diceU diceValueRandomiser];
        
        NSLog(@"%lu", diceU.diceCurrentValue);
        
        [self.diceValuesArray replaceObjectAtIndex:i withObject:diceU];
        
        //NSLog(@"%@", @(dice.diceCurrentValue));
    }
    
    //NSUInteger total = diceValue1 + diceValue2 + diceValue3 + diceValue4 + diceValue5;
    
    
}
}
//-(void)diceValueDisplay {
//
//for (int i = 0;i < 5 ; i++) {
//    
//    Dice *dice = [[Dice alloc] init];
//    dice = [self.diceValuesArray objectAtIndex:(i)];
//    NSLog(@"%lu", (unsigned long)dice.diceValue);
//    
//}
//
//}

@end
