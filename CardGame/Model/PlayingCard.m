//
//  PlayingCard.m
//  CardGame
//
//  Created by Ming Yan on 7/04/13.
//  Copyright (c) 2013 Ming Yan. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
- (NSString *) contents
{
    NSArray *rankString = [PlayingCard rankStrings];
    
    return [rankString[self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    static NSArray *validSuits = nil;
    if (!validSuits) validSuits = @[@"♠", @"♣", @"♥", @"♦"];
    return validSuits;
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];

}

+ (NSUInteger) maxRank {
    return [self rankStrings].count - 1;
}

- (void) setRank:(NSInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherCard.rank == self.rank) {
            score = 4;
        }
    }
    
    return score;
}

@end
