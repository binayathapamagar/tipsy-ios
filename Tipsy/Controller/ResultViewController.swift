//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Binaya on 19/05/2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var billPerPerson: UILabel!
    @IBOutlet weak var splitInfoLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    var tip: String?
    var tipAndSplitInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recalculateButton.layer.cornerRadius = 10
        billPerPerson.text = tip
        splitInfoLabel.text = tipAndSplitInfo
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
