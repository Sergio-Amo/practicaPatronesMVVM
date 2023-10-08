//
//  SplashViewModel.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 6/10/23.
//

import Foundation

// MARK: - PROTOCOL -
protocol SplashViewModelProtocol {
    func onViewsLoaded()
}

// MARK: - CLASS -
final class SplashViewModel {
    
    // Comunicarse con el Controller
    private weak var viewDelegate: SplashViewProtocol?
    
    private let model = NetworkModel()
    
    // Comunicarse con el Controller
    init(viewDelegate: SplashViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewDelegate?.animateLoading(true)
        // Load heroes, simulate a >1 second response
        model.getHeroes { result in
            switch result {
            case let .success(heroes):
                // simulate a >1 second response to test activity indicator animation
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
                //DispatchQueue.main.async { [weak self] in
                    self?.viewDelegate?.animateLoading(false)
                    self?.viewDelegate?.navigateToHome(with: heroes)
                }
            case let .failure(error):
                print("Error: \(error)")
            }
        }
        
    }
}

// MARK: - EXTENSION -
extension SplashViewModel: SplashViewModelProtocol {
    
    func onViewsLoaded() {
        loadData()
    }
}
