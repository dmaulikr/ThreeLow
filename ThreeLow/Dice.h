//
//  Dice.h
//  ThreeLow
//
//  Created by Narendra Thapa on 2016-01-13.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic, assign) NSUInteger diceCurrentValue;

@property (nonatomic, assign) NSString *diceStatus;

//@property (nonatomic, strong) NSMutableArray *diceValuesArray;

-(void)diceValueRandomiser;

-(void)diceHold;


@end
