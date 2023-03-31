//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Christopher Goldswain on 30.01.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var splitResult = "0.0"
    var numberOfPeople = 2
    var tipPercentage = 0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = splitResult
        settingsLabel.text = "Split between \(numberOfPeople) people with a \(tipPercentage)% tip."
    }
    
    @IBAction private func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
