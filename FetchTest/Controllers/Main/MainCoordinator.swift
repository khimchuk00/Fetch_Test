//
//  MainCoordinator.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

class MainCoordinator: Coordinator {
    // MARK: - Dependencies
    var controller: MainViewController
    var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        controller = MainViewController.fromStoryboard
    }
    
    func start() {
        controller.viewModel = viewModel
        controller.modalPresentationStyle = .fullScreen
        presenter.pushViewController(controller, animated: true)
    }
    
    var viewModel: MainViewModel {
        let viewModel = MainViewModel(delegate: controller)
        
        return viewModel
    }
}
