//
//  CurrencyRateCell.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import UIKit
import FlagKit

class CurrencyRateCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    func setup(title: String, rate: String){
        titleLabel.text = title
        rateLabel.text = rate
        let flag = Flag(countryCode: Locale.countryCode(ofCurrencyCode: title))
        flagImage.image = flag?.originalImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.addShadow()
        selectionStyle = .none
    }
}
