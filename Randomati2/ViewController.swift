//
//  ViewController.swift
//  Randomati2
//
//  Created by SNQMACPRO on 12.03.2020.
//  Copyright © 2020 SNQMACPRO. All rights reserved.
//

import UIKit
import CoreText


class ViewController: UIViewController {
    
    @IBOutlet weak var randomLabel: UILabel!
    
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    

    @IBOutlet weak var okButtonFirst: UIButton!
    
  
    @IBAction func okButtonActionOne(_ sender: Any) {
    }
    
    private var random = 0
    private var superRandom = 0
    private var firstNumber:Int = 0
    private var secondNumber:Int = 0
 var startValue = 0
 var endValue = 0
    
//    override var overrideUserInterfaceStyle: UIUserInterfaceStyle { .light }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.delegate = self
        secondTextField.delegate = self
        overrideUserInterfaceStyle = .light
        randomLabel.text = "0"
      
        
     
        
    }
    
    @objc func handleUpdate() {
        superRandom = 0
        self.randomLabel.text = "\(startValue)"
        startValue += 1
        if startValue > endValue {
            startValue = endValue
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        refresh()
    }
    
    @IBAction func randoms(_ sender: Any) {
        if firstNumber <= secondNumber {
            doRandom() } else { randomLabel.text = "Второе число должно быть больше первого!"
        }
    }
    
    func refresh() {
//         randomLabel.text = "0"
        superRandom = 0
        randomLabel.text = "\(superRandom)"
    }
    
    func doRandom() {
//        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
//              displayLink.add(to: .main, forMode: .default)
        superRandom = 0
        randomLabel.text = "\(superRandom)"
        superRandom = Int.random(in: firstNumber...secondNumber)
        endValue = superRandom
        randomLabel.text = "\(superRandom)"
//        resultsTextField.text! += "\(superRandom) "
    }
    @IBAction func okAction(_ sender: Any) {
        guard let firstInt = firstTextField.text, let secondInt = secondTextField.text else { return }
        firstNumber = Int(firstInt) ?? 0
        secondNumber = Int(secondInt) ?? 0
    }
    
}
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


