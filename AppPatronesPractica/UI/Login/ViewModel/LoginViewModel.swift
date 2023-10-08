//
//  LoginViewModel.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 8/10/23.
//

import Foundation

// MARK: - PROTOCOL -
protocol LoginViewModelProtocol {
    func onViewsLoaded()
    func loginTapped(name: String, password: String)
}

// MARK: - CLASS -
final class LoginViewModel {
    
    // Comunicarse con el Controller
    private weak var viewDelegate: LoginViewProtocol?
    
    private let model = NetworkModel()
    
    // Comunicarse con el Controller
    init(viewDelegate: LoginViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
}

// MARK: - EXTENSION -
extension LoginViewModel: LoginViewModelProtocol {
    func loginTapped(name: String, password: String) {
        guard !name.isEmpty, !password.isEmpty else { return }
        
        /* Si el login ha sido pulsado y los campos no están vacíos,
        ** obtener token y navegar al splash */
        model.login(user: name, password: password) { [weak self] result in
            switch result {
            case .success(_):
                //print("token received, navigating...")
                DispatchQueue.main.async { [weak self] in
                    self?.viewDelegate?.navigateToSplash()
                }
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
    
    func onViewsLoaded() {
        // Puede que sea útil en algún momento, por eso lo he dejado
    }
}
