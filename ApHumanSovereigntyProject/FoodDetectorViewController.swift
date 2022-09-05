//
//  ViewController.swift
//  ApHumanSovereigntyProject
//
//  Created by Andrew Seeley on 12/6/17.
//  Copyright © 2017 Seemu. All rights reserved.
//
//  Edited By Alex Korte

import UIKit
import CoreML
import Vision

var imageClassification: String = ""

class FoodDetectorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var myPhoto = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func detectImageContent() {
        
        //performSegue(withIdentifier: "presentPopoverLoadingIcon", sender: nil)
        
        guard let model = try? VNCoreMLModel(for: LepordlandFoodImageClassifier().model) else {
            fatalError("Failed to load model")
        }
        
        // Create a vision request
        
        let request = VNCoreMLRequest(model: model) {[weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first
                else {
                    fatalError("Unexpected results")
            }
            
            DispatchQueue.main.async { [weak self] in
                print(topResult.confidence)
                imageClassification = topResult.identifier
                self?.performSegue(withIdentifier: "toFoodExplanation", sender: nil)
            }
            
        }
        
        guard let ciImage = CIImage(image: self.myPhoto)
            else { fatalError("Cant create CIImage from UIImage") }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global().async {
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func pickImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        if let pickedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage {
            myPhoto = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
        
        detectImageContent()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
