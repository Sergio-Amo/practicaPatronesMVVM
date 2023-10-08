//
//  HomeViewModel.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 6/10/23.
//

import Foundation

// MARK: - PROTOCOL -
protocol HomeViewModelProtocol {
    var dataCount: Int {get}
    func onViewsLoaded()
    func data(at index: Int) -> Hero?
    func onItemSelected(at index: Int)
}


// MARK: - CLASS -
final class HomeViewModel {
    
    private weak var viewDelegate: HomeViewProtocol?
    
    private var heroes: [Hero]
    
    init(viewDelegate: HomeViewProtocol?, heroes: [Hero]) {
        self.viewDelegate = viewDelegate
        self.heroes = heroes
    }
    
    private func loadData() {
        viewDelegate?.updateViews()
    }
}


// MARK: - EXTENSION -
extension HomeViewModel: HomeViewModelProtocol {
    func onItemSelected(at index: Int) {
        guard let data = data(at: index) else { return }
        viewDelegate?.navigateToDetail(with: data)
    }
    
    func data(at index: Int) -> Hero? {
        guard index < dataCount else { return nil }
        return heroes[index]
    }
    
    var dataCount: Int {
        return heroes.count
    }
    
    func onViewsLoaded() {
        loadData()
    }
}
