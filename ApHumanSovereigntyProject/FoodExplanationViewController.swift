//
//  FoodExplanationVeiwController.swift
//  ApHumanSovereigntyProject
//
//  Created by Alexander Korte on 11/10/18.
//  Copyright © 2018 Seemu. All rights reserved.
//

import UIKit

class FoodExplanationViewController: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodLable: UILabel!
    @IBOutlet weak var foodTextDescription: UITextView!
    let foodTextData = FoodTextData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if imageClassification == "Pad Thai" {
            foodImage.image = UIImage(named: "PadThai")
            foodLable.text = foodTextData.foodLableText[0]
            foodTextDescription.text = foodTextData.foodTextBodyText[0]
        }else if imageClassification == "Tom Yum" {
            foodImage.image = UIImage(named: "TomYum")
            foodLable.text = foodTextData.foodLableText[1]
            foodTextDescription.text = foodTextData.foodTextBodyText[1]
        }else if imageClassification == "Amok Trey" {
            foodImage.image = UIImage(named: "AmokTrey")
            foodLable.text = foodTextData.foodLableText[2]
            foodTextDescription.text = foodTextData.foodTextBodyText[2]
        }else if imageClassification == "Green Papaya Salad" {
            foodImage.image = UIImage(named: "GreenPapayaSalad")
            foodLable.text = foodTextData.foodLableText[3]
            foodTextDescription.text = foodTextData.foodTextBodyText[3]
        }else if imageClassification == "Larb" {
            foodImage.image = UIImage(named: "Larb")
            foodLable.text = foodTextData.foodLableText[4]
            foodTextDescription.text = foodTextData.foodTextBodyText[4]
        }
        else {
            print("Nothin Detected")
        
    }
    
    }
    
}
