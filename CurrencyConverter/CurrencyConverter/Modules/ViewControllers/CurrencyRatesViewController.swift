//
//  CurrencyRatesViewController.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import UIKit
import Combine
import FlagKit

class CurrencyRatesViewController: UIViewController {

    @IBOutlet weak var baseImageView: UIImageView!
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var currencyRatesTableView: UITableView!
    
    let viewModel = CurrencyRatesViewModel()
    private var disposeBag = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        loadData()
    }

    private func bindData() {
        viewModel.$base
            .receive(on: DispatchQueue.main).sink {[unowned self] (base) in
                baseCurrencyLabel.text = base
                let flag = Flag(countryCode: Locale.countryCode(ofCurrencyCode: base))
                baseImageView.image = flag?.image(style: .circle)
            }.store(in: &disposeBag)
        
        viewModel.$rates
            .receive(on: DispatchQueue.main).sink {[unowned self] (rates) in
                hideLoading()
                self.currencyRatesTableView.reloadData()
            }.store(in: &disposeBag)
        
        viewModel.$error
            .receive(on: DispatchQueue.main).sink {[unowned self] (error) in
                if let error = error {
                    hideLoading()
                    showAlert(title: "Error", message: error.message ?? "")
                }
            }.store(in: &disposeBag)

    }
    
    private func loadData(){
        showLoading()
        viewModel.getRates()
    }

}

extension CurrencyRatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRates()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIConstants.Cells.currencyRateCell) as! CurrencyRateCell
        let rateString = String(format: "%.2f", (viewModel.rate(at: indexPath.row) ?? 0.0))
        cell.setup(title: viewModel.code(at: indexPath.row),
                   rate: rateString)
        return cell
    }
    
}

extension CurrencyRatesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rate = viewModel.rate(at: indexPath.row),
              let changeCurrencyVC = ViewController.changeCurrency(storyboard: .main).instance as? ChangeCurrencyViewController else {return}
        let changeCurrencyViewModel = ChangeCurrencyViewModel(rate: rate,
                                                              baseCode: viewModel.base,
                                                              requiredCode: viewModel.code(at: indexPath.row))
        changeCurrencyVC.viewModel = changeCurrencyViewModel
        navigationController?.pushViewController(changeCurrencyVC, animated: true)
    }
}
