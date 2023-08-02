//
//  ViewController.swift
//  CalculateNew
//
//  Created by Edgar Sargsyan on 06.05.23.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var persentButton: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var tree: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var multiplay: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var common: UIButton!
    @IBOutlet var operatonsCollection: [UIButton]!
    
    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false
    var previousResult: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonsCollection = [acButton,  plusMinusButton,  persentButton,
                                 division, multiplay, minus, plus, equal, common,
                                 one, two, tree, four, five, six, seven, eight, nine]
        
        for button in buttonsCollection {
            button?.layer.cornerRadius = (button?.frame.height)! / 2
        }
    }
    
    @IBAction func digits(_ sender: UIButton) {
        _ = sender.tag
        sender.layer.cornerRadius = sender.frame.height / 2
        
        if result.text!.count < 10 {
            
            
            if result.text!.count == 10{
                // +1int
                result.text! += "\(sender.tag)"
                result.text = result.text
            }
            
            if result.text! == "0" {
                result.text = ""
            }
            
            if mathSign == true {
                result.text = String(sender.tag)
                mathSign = false
            } else {
                result.text = result.text! + String (sender.tag)
            }
            
            numberFromScreen = Double(result.text ?? "") ?? 0
        }
    }
    
    @IBAction func common(_ sender: UIButton) {
        
        
        if !self.result.text!.contains(".") {
            if mathSign == false {
                if (self.result.text?.count)! <= 8 {
                    self.result.text = self.result.text! + "."
                }
            }
           } else {
             return
        }
        numberFromScreen = Double(self.result.text!) ?? 0
    }
    
    
    @IBAction func plusAndMinusnumber(_ sender: UIButton) {
        
        if Double(self.result.text!) != nil {
            
            let minusNumber = Double(self.result.text!)! * (-1)
            if Double(Int(minusNumber)) == Double(minusNumber) {
                self.result.text = String(Int(minusNumber))
            } else {
                self.result.text = String(minusNumber)
            }
            numberFromScreen = Double(minusNumber)
        }
    }
    
    @IBAction func persentButton(_ sender: UIButton) {
        if  (self.result.text!) == (nil) {
            print("")
            
        }else{
                let persent = Double(self.result.text!)! / 100 * 10
                if Double(Int(persent)) == Double (persent){
                    self.result.text = String(Int(persent))
                }else {
                    self.result.text = String(persent)
                }
                numberFromScreen = Double(persent)
            }
    }
    
    @IBAction func buttons(_ sender: UIButton) {

        operatonsCollection.forEach { button in
            
            if sender.tag == button.tag {
                button.backgroundColor = UIColor.white
            } else {
                button.backgroundColor = UIColor.systemOrange
            }
        }
        
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = (Double(result.text ?? "") ?? 0)
            
            
            operation = sender.tag
            mathSign = true
        } else if sender.tag == 15 {
            if operation == 11 {
                mathSign = true
                
                result.text = Double(Int(firstNum / numberFromScreen)) == Double(firstNum / numberFromScreen) ? String(Int(firstNum / numberFromScreen)) : String(Double(firstNum / numberFromScreen))
                
            } else if operation == 12 {
                mathSign = true
                
                result.text = Double(Int(firstNum * numberFromScreen)) == Double(firstNum * numberFromScreen) ? String(Int(firstNum * numberFromScreen)) : String(Double(firstNum * numberFromScreen))
                
            } else if operation == 13 {
                mathSign = true
                
                result.text = Double(Int(firstNum - numberFromScreen)) == Double(firstNum - numberFromScreen) ? String(Int(firstNum - numberFromScreen)) : String(Double(firstNum - numberFromScreen))
                
            } else if operation == 14 {
                mathSign = true
                
                result.text = Double(Int(firstNum + numberFromScreen)) == Double(firstNum + numberFromScreen) ? String(Int(firstNum + numberFromScreen)) : String(Double(firstNum + numberFromScreen))
            }
            
        } else if sender.tag == 10 {
            
            result.text = "0"
            
            firstNum = 0
            numberFromScreen = 0
            operation = 0
            
        }
    }
}
