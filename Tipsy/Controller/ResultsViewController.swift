//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Lesya Kotty on 14.04.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var total = ""
    var numberOfPeople = ""
    var tipPercentage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = total
        descriptionLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
