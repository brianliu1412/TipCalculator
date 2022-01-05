//
//  ViewController.swift
//  Prework
//
//  Created by Brian on 1/3/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var peopleIncrement: UIStepper!
    @IBOutlet weak var numPeople: UILabel!
    
    @IBOutlet weak var settings: UIBarButtonItem!
    @IBOutlet weak var totalPerPerson: UILabel!
    var totalNum = 0.00
    var tipPercent = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        peopleIncrement.wraps = true
        peopleIncrement.autorepeat = true
        peopleIncrement.maximumValue = 30
        self.billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        billAmountTextField.becomeFirstResponder()
    }
    
    
    
    
    
    
    
    @IBAction func billAmountChange(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipAmount = bill * (Double(tipPercent) / 100)
        let total = bill + tipAmount
        let people = Double(numPeople.text!) ?? 0
        let totalPP = total / people
        
        totalNum = total
        totalPerPerson.text = String(format: "$%.2f", totalPP)
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func tipSliderControl(_ sender: UISlider) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let sliderValue = Int(sender.value)
        
        let tipAmount = bill * (Double(sliderValue) / 100)
        let people = Double(numPeople.text!) ?? 0
        let total = bill + tipAmount
        let totalPP = total / people
        
        
        tipPercent = sliderValue
        
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
        tipPercentage.text = String(sliderValue) + "%"
        totalPerPerson.text = String(format: "$%.2f", totalPP)
    }
    
    
    @IBAction func peopleValueChanged(_ sender: UIStepper) {
        let people = Int(sender.value)
        
        let total = Double(totalNum)
        let totalPerP = total / Double(people)
        numPeople.text = String(people).description
        totalPerPerson.text = String(format: "$%.2f", totalPerP)
    
    
    }


}

