//
//  UIViewControllerExtension.swift
//  CurrencyConverter
//
//  Created by Sherif Nasr on 21/04/2021.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    func showAlert(title: String?, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showLoading(){
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func hideLoading(){
        MBProgressHUD.hide(for: view, animated: true)
    }

}
