//
//  GameController.h
//  ThreeLow
//
//  Created by Narendra Thapa on 2016-01-13.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property (nonatomic, strong) NSMutableArray *diceValuesArray;

@property (nonatomic) NSUInteger totalScore;

//@property (nonatomic, strong) NSMutableArray *heldValuesArray;

-(void)diceValueArrayCreation;

-(void)diceValueArrayUpdate;

-(void)diceStatusResetUpdate;

-(void)printCurrentDiceArray;

-(NSString *)statusCheck;

-(NSUInteger)totalScorePlayer;
//-(void)diceValueDisplay;

@end
