//
//  PlayingCard.h
//  CardGame
//
//  Created by Ming Yan on 7/04/13.
//  Copyright (c) 2013 Ming Yan. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
