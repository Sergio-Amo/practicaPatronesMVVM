//
//  HomeTableViewController.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 6/10/23.
//

import UIKit

// MARK: - PROTOCOL -
protocol HomeViewProtocol: AnyObject {
    func updateViews()
    func navigateToDetail(with data: Hero?)
}

// MARK: - CLASS -
class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeViewModelProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        viewModel?.onViewsLoaded()
    }

    private func registerCells() {
        tableView.register(UINib(nibName: "HomeCellTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataCount ?? 0
    }
    
    // Update view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCellTableViewCell else {
            return UITableViewCell()
        }
        
        if let data = viewModel?.data(at: indexPath.row) {
            cell.updateViews(data: data)
        }
        
        return cell
    }
    
    // Select item
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.onItemSelected(at: indexPath.row)
    }
}

// MARK: - EXTENSION -
extension HomeTableViewController: HomeViewProtocol {
    func updateViews() {
        tableView.reloadData()
    }
    
    func navigateToDetail(with data: Hero?) {
        let nextVC = DetailViewController()
        guard let data else { return }
        nextVC.viewModel = DetailViewModel(viewDelegate: nextVC, viewData: data)
        //navigationItem.backButtonTitle = "TEST"
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
