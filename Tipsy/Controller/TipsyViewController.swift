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
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.tintColor = .black
            navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        }
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
        
        let textWithNoWhiteSpaces = textField.text!.trimmingCharacters(in: .whitespaces)
        
        if textWithNoWhiteSpaces.isEmpty {
            showErrorAlert(with: "Please enter a value. TextField is empty.")
            return
        }else if Double(textWithNoWhiteSpaces) == nil {
            showErrorAlert(with: "Please enter a valid value")
            return
        }
        
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
    
    //MARK: - Instance Method
    
    func showErrorAlert(with errorMessage: String) {
        let alertController = UIAlertController(title: "ERROR!", message: errorMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    
}

