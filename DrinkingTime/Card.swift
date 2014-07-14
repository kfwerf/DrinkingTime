//
//  Card.swift
//  DrinkingTime
//
//  Created by Kenneth Van der werf on 13/07/14.
//  Copyright (c) 2014 Kenneth Van der werf. All rights reserved.
//

import Foundation
import UIKit

enum CardRank:Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
}

enum CardSuit:String {
    case Spades = "Spades"
    case Hearts = "Hearts"
    case Diamonds = "Diamonds"
    case Clubs = "Clubs"
}

class PlayingCard  {
    var rank: CardRank
    var suit: CardSuit
    
    init( rank:CardRank, suit:CardSuit ) {
        self.rank = rank
        self.suit = suit
    }
    
    func getRaw() -> Dictionary < String, AnyObject > {
        var rawValues:Dictionary < String, AnyObject > = [
            "suit": suit.toRaw(),
            "rank": rank.toRaw()
        ]
        return rawValues
    }
}

class DrinkingPlayingCard:PlayingCard {
    var title: String
    var description: String
    var img:String
    
    init( rank:CardRank, suit:CardSuit, title:String, description:String, img:String ) {
        self.title = title
        self.description = description
        self.img = img
        super.init( rank: rank, suit: suit )
    }
    
    func getImage() -> UIImage {
        var cardBundle:NSBundle = NSBundle(identifier: "PlayingCards")
        var cardImage:UIImage = UIImage(named: self.img, inBundle: cardBundle, compatibleWithTraitCollection: nil)
        return cardImage
    }
}

class DrinkingGame {
    let drinkingCards:Array<DrinkingPlayingCard> = [
        DrinkingPlayingCard( rank: .Ace, suit: .Spades, title: "Beer", description: "Now", img: "ace_of_spades"),
        DrinkingPlayingCard(rank: .Two, suit: .Spades, title: "Tequila", description: "Drink", img: "2_of_spades")
    ]
    
    let view:UIView = UIView()
    var theContainer:UIImageView!
    
    var currentCardIndex:Int!
    var currentDrinkingCard:DrinkingPlayingCard!
    
    init( rank: CardRank, suit: CardSuit ) {
        self.setCurrentCardByType( rank, suit: suit )
        self.addCardToView( self.currentDrinkingCard )
    }
    
//    func setRandomCurrentCard() -> Int {
//        var cardAmount:Int = 9
//        //return (arc4random() % cardAmount) + 1;
//    }
    
    func setCurrentCardByType( rank: CardRank, suit: CardSuit ) {
        var cardIndex:Int = self.getPlayingCardNumber( rank, suit: suit )
        self.setCurrentCardByNumber( cardIndex )
    }
    
    func setCurrentCardByNumber( cardIndex:Int ) {
        self.currentCardIndex = cardIndex
        self.currentDrinkingCard = self.drinkingCards[ self.currentCardIndex ]
    }
    
    func getPlayingCardNumber( rank:CardRank, suit:CardSuit ) -> Int {
        for ( cardIndex, drinkingCard ) in enumerate(drinkingCards) {
            if drinkingCard.rank == rank && drinkingCard.suit == suit {
                return cardIndex
            }
        }
        return 0
    }
    
    func addCardToView( drinkingCard:DrinkingPlayingCard ) {
        var theImage:UIImage = drinkingCard.getImage()
        self.theContainer = UIImageView(image:theImage)
        self.view.addSubview( theContainer )
    }
    
    func removeCardFromView() {
        self.theContainer.removeFromSuperview()
    }
    
   
}
