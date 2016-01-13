//
//  Dice.m
//  ThreeLow
//
//  Created by Narendra Thapa on 2016-01-13.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Dice.h"

@implementation Dice


-(int)diceValue {
    return arc4random_uniform(6) + 1;
}

@end
