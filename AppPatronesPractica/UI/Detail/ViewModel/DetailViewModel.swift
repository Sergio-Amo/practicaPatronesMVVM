//
//  DetailViewModel.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 7/10/23.
//

import Foundation

// MARK: - PROTOCOL -
protocol DetailViewModelProtocol {
    func onViewsLoaded()
    var characterData: Hero { get }
}

// MARK: - CLASS -
final class DetailViewModel {
    
    // Comunicarse con el Controller
    private weak var viewDelegate: DetailViewProtocol?
    
    var viewData: Hero
    
    // Comunicarse con el Controller
    init(viewDelegate: DetailViewProtocol?, viewData: Hero) {
        self.viewDelegate = viewDelegate
        self.viewData = viewData
    }
    
    private func loadData() {
        self.viewDelegate?.updateView()
    }
}

// MARK: - EXTENSION -
extension DetailViewModel: DetailViewModelProtocol {

    var characterData: Hero {
        return viewData
    }
    
    func onViewsLoaded() {
        loadData()
    }
}
