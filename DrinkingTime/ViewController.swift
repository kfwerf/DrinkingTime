//
//  ViewController.swift
//  DrinkingTime
//
//  Created by Kenneth Van der werf on 13/07/14.
//  Copyright (c) 2014 Kenneth Van der werf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var theDrinkingGame:DrinkingGame = DrinkingGame( rank: .Ace, suit: .Spades)
        
        var img = theDrinkingGame.currentDrinkingCard.getImage()
        var imgview = UIImageView(image: img)
        
        self.view.addSubview( theDrinkingGame.view )
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

