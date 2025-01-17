//
//  AllertPresentable.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

protocol AlertPresentableVC {
    func presentAlert(text: String, description: String)
}

extension AlertPresentableVC where Self: UIViewController {
    func presentAlert(text: String, description: String) {
        let alert = UIAlertController(title: text, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}
