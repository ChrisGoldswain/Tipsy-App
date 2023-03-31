//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var tipAmount = 0.0
    private var billAmount = 0.0
    private var peoplePaying = 2
    private var finalResult = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction private func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipAmount = buttonTitleAsANumber / 100
    }
    
    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        peoplePaying = Int(sender.value)
    }
    
    @IBAction private func calculatePressed(_ sender: UIButton) {

        let bill = billTextField.text!
        if bill != "" {
            billAmount = Double(bill)!
            let result = billAmount * (1 + tipAmount) / Double(peoplePaying)
            finalResult = String(format: "%.2f", result)
        }

        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberOfPeople = peoplePaying
            destinationVC.tipPercentage = Int(tipAmount * 100)
            destinationVC.splitResult = finalResult
        }
    }
    
}
