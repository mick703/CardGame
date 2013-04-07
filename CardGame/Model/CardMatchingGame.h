//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Ming Yan on 7/04/13.
//  Copyright (c) 2013 Ming Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
//constructor method
- (id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void) flipCardAtIndex:(NSUInteger)index;
- (Card *) cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end
