//
//  ViewController.swift
//  Randomati2
//
//  Created by SNQMACPRO on 12.03.2020.
//  Copyright © 2020 SNQMACPRO. All rights reserved.
//

import UIKit
import CoreText
import Parse


var name = ""
var allreadyUsed = [Int]()

class ViewController: UIViewController {
    
    @IBOutlet weak var randomLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var okButtonFirst: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func okButtonActionOne(_ sender: Any) {
    }
    
    @IBOutlet weak var swiOutlet: UISwitch!
    
    @IBOutlet weak var invButton: UIButton!
    
    
    //        if resultLabel.text != "" {
//            name = resultLabel.text!
//           performSegue(withIdentifier: "goResultsSegue", sender: self)
////        }
        
    
    
private var random = 0
private var superRandom = 0
private var firstNumber:Int = 0
private var secondNumber:Int = 0
private var startValue = 0
private var endValue = 0

    var objects = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invButton.isHidden = true
        firstTextField.delegate = self
        secondTextField.delegate = self
        overrideUserInterfaceStyle = .light
        superRandom = 0
        randomLabel.text = "\(superRandom)"
        
        
        var query = PFQuery(className:"Results")

        query.findObjectsInBackground { [weak self] results, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let results = results else {return}
            self?.objects = results
            DispatchQueue.main.async {
//                self?.tableView.reloadData()
            }
        }
        
        
//        var errorLabelHeight = errorLabel.optimalHeight
//        errorLabel.frame = CGRect(x: errorLabel.frame.origin.x, y: errorLabel.frame.origin.y, width: errorLabel.frame.width, height: errorLabelHeight)
////        errorLabel.numberOfLines = 0
        
//        var sum = 0
//        if var i = 0; i < allreadyUsed.count; i++ {
//            sum += allreadyUsed[i]
//        }
//        print(sum)
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

    
    @IBAction func switchOn(_ sender: UISwitch) {
        if (sender.isOn == true) {
            randomLabel.text = ""
            topLabel.text = ""
            errorLabel.text = "Повторения исключены"
            invButton.isHidden = false
            goButton.isHidden = true
        } else {
           randomLabel.text = ""
           topLabel.text = ""
           errorLabel.text = "Повторения включены"
            goButton.isHidden = false
            invButton.isHidden = true
        }
    }
    
    @IBAction func invAction(_ sender: UIButton) {

         
            if firstNumber == 0, secondNumber == 0 {
                randomLabel.text = " "
                errorLabel.text = "Введите значения!"
                topLabel.text = " "
            } else {
            if firstNumber <= secondNumber {
//                superRandom = Int.random(in: firstNumber...secondNumber)
//                                    endValue = superRandom
                 whatUsed()
                errorLabel.text = ""
                topLabel.text = "Ваше случайное число:"
            } else { randomLabel.text = " "
                errorLabel.numberOfLines = 2
                errorLabel.text = "Второе число должно быть больше первого!"
                    topLabel.text = " "
            }
            }
        }
        
//
//
     
       
//        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
//                                displayLink.add(to: .main, forMode: .default)
        
    
    
    func whatUsed() {
        for _ in 0...secondNumber {
               if allreadyUsed.contains(superRandom) {
                   print("NOOOOOOOO")
                superRandom = Int.random(in: firstNumber...secondNumber)
                endValue = superRandom
                   
               } else {
                   allreadyUsed += [superRandom]
                   print("YEAH")
                print(allreadyUsed)
                resultLabel.text! += " \(superRandom)"
                randomLabel.text = "\(superRandom)"
                break
               }
           }
        
       }

    
    @IBAction func randoms(_ sender: Any) {
        
        
        name += randomLabel.text!
     
        if firstNumber == 0, secondNumber == 0 {
            randomLabel.text = " "
            errorLabel.text = "Введите значения!"
            topLabel.text = " "
        } else {
        if firstNumber <= secondNumber {
            doRandom()
        } else { randomLabel.text = " "
            errorLabel.numberOfLines = 2
            errorLabel.text = "Второе число должно быть больше первого!"
                topLabel.text = " "
        }
        }
    }
    
    func refresh() {
        resultLabel.text = ""
         randomLabel.text = "0"
        superRandom = 0
        randomLabel.text = "\(superRandom)"
        errorLabel.text = " "
        allreadyUsed = [0]
      
    }
    
    func doRandom() {
//        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
//              displayLink.add(to: .main, forMode: .default)
        
        superRandom = 0
        randomLabel.text = "\(superRandom)"
        superRandom = Int.random(in: firstNumber...secondNumber)
        endValue = superRandom
        print(allreadyUsed)
        randomLabel.text = "\(superRandom)"
        topLabel.text = "Ваше случайное число:"
        errorLabel.text = " "
        resultLabel.text! += "\(superRandom) "
        allreadyUsed += [superRandom]
    }

    
    
    @IBAction func okAction(_ sender: Any) {
        guard let firstInt = firstTextField.text, let secondInt = secondTextField.text else { return }
        firstNumber = Int(firstInt) ?? 0
        secondNumber = Int(secondInt) ?? 0
    }
  
    @IBAction func goToResultsVCAction(_ sender: UIBarButtonItem) {
        
        if (randomLabel.text != "") {
                  name += " \(randomLabel.text!)"
                   
                   }
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        
        PFUser.logOut()
                 let mySceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
                 mySceneDelegate?.showLogin()
    }
    
}
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//extension UIView {
//    func fadeTransition(_ duration:CFTimeInterval) {
//        let animation = CATransition()
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        animation.type = kCATransitionFade
//        animation.duration = duration
//        layer.add(animation, forKey: kCATransitionFade)
//    }
//}
//errorLabel.animate(newText: "Hello Animation", characterDelay: 0.5)
