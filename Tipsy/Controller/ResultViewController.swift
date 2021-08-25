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
    var tip: String?
    var tipAndSplitInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billPerPerson.text = tip
        splitInfoLabel.text = tipAndSplitInfo
    }
    
}
