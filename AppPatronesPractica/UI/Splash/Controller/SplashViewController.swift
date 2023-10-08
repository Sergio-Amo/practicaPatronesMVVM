//
//  SplashViewController.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 6/10/23.
//

import UIKit

// MARK: - PROTOCOL -
protocol SplashViewProtocol: AnyObject {
    func animateLoading(_ animate: Bool)
    func navigateToHome(with data: [Hero]?)
}

// MARK: - CLASS -
class SplashViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Comunicarse con el ViewModel
    var viewModel: SplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }
}

// MARK: - EXTENSION -
extension SplashViewController: SplashViewProtocol {
    // Animar activity indicator
    func animateLoading(_ animate: Bool) {
        switch animate {
        case true where !activityIndicator.isAnimating:
            activityIndicator.startAnimating()
        case false where activityIndicator.isAnimating:
            activityIndicator.stopAnimating()
        default:
            break
        }
    }
    // Navegar a la home
    func navigateToHome(with data: [Hero]?) {
        guard let data else { return }
        let nextVC = HomeTableViewController()
        nextVC.viewModel = HomeViewModel(viewDelegate: nextVC, heroes: data)
        navigationController?.setViewControllers([nextVC], animated: true)
    }
}
