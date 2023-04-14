import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var billCalculator = BillCalculator()
    
    @IBAction func billTextFilled(_ sender: UITextField) {
        billCalculator.billValue = sender.text
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        selectTip(sender)
        billCalculator.calculatePrc(sender.currentTitle!)
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billCalculator.split = Int(sender.value)
        splitNumberLabel.text = String(billCalculator.split)
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        billCalculator.calculateTotal()
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.total = billCalculator.getTotal()
            resultsVC.numberOfPeople = billCalculator.getSplit()
            resultsVC.tipPercentage = billCalculator.getPercentage()
        }
    }
    
    func selectTip(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    
}


