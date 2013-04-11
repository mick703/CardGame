//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Ming Yan on 7/04/13.
//  Copyright (c) 2013 Ming Yan. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@property (nonatomic) NSString *actionResult;
@end

@implementation CardMatchingGame
#define MATCH_BOUNUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self){
        for (int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

- (void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            //Try to match the cards
            bool isMatched = NO;
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        //found a match
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        int points = matchScore * MATCH_BOUNUS;
                        self.score += points;
                        self.actionResult = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", card.contents, otherCard.contents, points];
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.actionResult = [NSString stringWithFormat:@"%@ & %@ don't match! %d points penalty!", card.contents, otherCard.contents, MISMATCH_PENALTY];
                    }
                    isMatched = YES;
                    break;
                }
            }
            self.score -= FLIP_COST;
            if (!isMatched) {
                self.actionResult = [NSString stringWithFormat:@"Flipped up %@, cost %d piont(s)", card.contents, FLIP_COST];                
            }

        }
        card.faceUp = !card.isFaceUp;
    }
}
@end
