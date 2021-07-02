//
//  ViewController.swift
//  Tipsy
//
//  Created by Binaya on 18/05/2021.
//

import UIKit

class TipsyViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    var tipBrain = TipBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitLabel.text = String(format: "%.0f", stepper.minimumValue)
        calculateButton.layer.cornerRadius = 10
        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString(string: "e.g. 123.56", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    @IBAction func tipPercentagePressed(_ sender: UIButton) {
        textField.endEditing(true)
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        textField.endEditing(true)
        splitLabel.text = String(format: "%.0f", sender.value)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let totalBill = Double(textField.text ?? "0") ?? 0.0
        let noOfPplToSplit = stepper.value
        
        if zeroPercentButton.isSelected {
            tipBrain.getTipPerPersonWith(totalBill, 0.0, noOfPplToSplit)
            
        }else if tenPercentButton.isSelected {
            tipBrain.getTipPerPersonWith(totalBill, 0.1, noOfPplToSplit)
        }else {
            tipBrain.getTipPerPersonWith(totalBill, 0.2, noOfPplToSplit)
        }
            
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.tip = tipBrain.getTip()
            resultVC.tipAndSplitInfo = tipBrain.getMessage()
        }
        
    }
}

