//
//  CurrencyRatesViewController.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import UIKit
import MBProgressHUD
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
                MBProgressHUD.hide(for: view, animated: true)
                self.currencyRatesTableView.reloadData()
            }.store(in: &disposeBag)
    }
    
    private func loadData(){
        MBProgressHUD().show(animated: true)
        viewModel.getRates()
    }

}

extension CurrencyRatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRates()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIConstants.Cells.CurrencyRateCell) as! CurrencyRateCell
        cell.setup(title: viewModel.code(at: indexPath.row),
                   rate: "\(viewModel.rate(at: indexPath.row) ?? 0.0)")
        return cell
    }
    
}

extension CurrencyRatesViewController: UITableViewDelegate{
    
}
