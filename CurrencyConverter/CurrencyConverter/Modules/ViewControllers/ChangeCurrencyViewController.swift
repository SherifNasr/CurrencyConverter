//
//  ChangeCurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import UIKit
import Combine

class ChangeCurrencyViewController: UIViewController {
    var viewModel: ChangeCurrencyViewModel?
    private var disposeBag = Set<AnyCancellable>()

    @IBOutlet weak var baseCodeLabel: UILabel!
    @IBOutlet weak var resultCodeLabel: UILabel!
    @IBOutlet weak var resultValueLabel: UILabel!
    @IBOutlet weak var baseValueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseCodeLabel.text = viewModel?.baseCode
        resultCodeLabel.text = viewModel?.requiredCode
        baseValueTextField.text = "1.00"
        resultValueLabel.text = "\(viewModel?.rate ?? 0.00)"
    }
        
    @IBAction func baseValueDidChange(_ sender: UITextField) {
        guard let baseVal = Double(baseValueTextField.text ?? "")  else {return}
        resultValueLabel.text = "\(viewModel?.changeCurrency(of: baseVal) ?? 0.0)"
    }
    
}
