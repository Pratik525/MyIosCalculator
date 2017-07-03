//
//  ViewController.swift
//  test
//
//  Created by Pratik on 28/06/17.
//  Copyright © 2017 Pratik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var expressionTv: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultText: UILabel!
    var isTypingNumber = false
    var isOperatorTapped = false
    var firstNumber = ""
    var secondNumber = ""
    var operation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultText.layer.borderWidth = 2.0
        resultText.layer.borderColor = UIColor.red.cgColor
        resultText.layer.cornerRadius = 12.0
        
    }
    
    @IBAction func clearResult(_ sender: UIButton) {
        resultText.text = ""
        firstNumber = ""
        secondNumber = ""
        operation = ""
        expressionTv.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if resultText.text!.isEmpty {
            return
        }
        else{
            firstNumber = resultText.text!
            let operatorPressed = sender.currentTitle as String?
            operation = operatorPressed!
            
            isTypingNumber = false
            
            if isOperatorTapped {
                let currentExpression : NSString = expressionTv.text! as NSString
                currentExpression.substring(to: currentExpression.length-1)
                expressionTv.text = (currentExpression as String) + operatorPressed!
            }
            else{
                expressionTv.text = expressionTv.text! + operatorPressed!
            }
            
            isOperatorTapped = true     
            
            
        }
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        let number = sender.currentTitle as String?
        isOperatorTapped = false
        if isTypingNumber {
            resultText.text = resultText.text! + number!
            
        }
        else {
            resultText.text = number
            isTypingNumber = true
            
        }
        expressionTv.text = expressionTv.text! + number!
        
    }
    
    
    @IBAction func equalityTapped(_ sender: UIButton) {
        doOperation()
    }
    
     func doOperation(){
        isTypingNumber = false
        var result = 0
        secondNumber = resultText.text!
        if(firstNumber==""){
        }
        else{
            if operation == "+" {
                result = Int(firstNumber)! + Int(secondNumber)!
                resultText.text = "\(result)"
                expressionTv.text = "\(result)"
            }
            else if operation == "-" {
                result = Int(firstNumber)! - Int(secondNumber)!
                resultText.text = "\(result)"
                expressionTv.text = "\(result)"
            }
            else if operation == "*" {
                result = Int(firstNumber)! * Int(secondNumber)!
                resultText.text = "\(result)"
                expressionTv.text = "\(result)"
            }
            else if operation == "/" {
                if Int(secondNumber)==0{
                    // Do nothing
                }
                else{
                    result = Int(firstNumber)! / Int(self.secondNumber)!
                    resultText.text = "\(result)"
                    expressionTv.text = "\(result)"
                }
            }
            
        }
    }
    
}
