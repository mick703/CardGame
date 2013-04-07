//
//  Deck.h
//  CardGame
//
//  Created by Ming Yan on 28/03/13.
//  Copyright (c) 2013 Ming Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;

@end
