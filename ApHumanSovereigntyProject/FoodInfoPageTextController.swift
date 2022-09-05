//
//  FoodInfoVeiwController.swift
//  ApHumanSovereigntyProject
//
//  Created by Alexander Korte on 11/10/18.
//  Copyright © 2018 Seemu. All rights reserved.
//

import UIKit

class FoodInfoPageTextController {
    
    var foodLableText: String
    
    init(topResultNumericalValue: Int) {
        foodLableText = FoodTextData().foodLableText[topResultNumericalValue]
        print(foodLableText)
    }
    
}
