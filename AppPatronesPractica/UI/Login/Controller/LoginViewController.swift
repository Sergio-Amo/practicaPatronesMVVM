//
//  LoginViewController.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 8/10/23.
//

import UIKit

// MARK: - PROTOCOL -
protocol LoginViewProtocol: AnyObject {
    func navigateToSplash()
}

// MARK: - CLASS -
class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Comunicarse con el ViewModel
    var viewModel: LoginViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }

    @IBAction func loginTapped(_ sender: Any) {
        viewModel?.loginTapped(
            name: userNameTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }
}

// MARK: - EXTENSION -
extension LoginViewController: LoginViewProtocol {
    
    func navigateToSplash() {
        let nextVC = SplashViewController()
        nextVC.viewModel = SplashViewModel(viewDelegate: nextVC)
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
