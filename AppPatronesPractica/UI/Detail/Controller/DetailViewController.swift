//
//  DetailViewController.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 6/10/23.
//

import UIKit

// MARK: - PROTOCOL -
protocol DetailViewProtocol: AnyObject {
    func updateView()
}

// MARK: - CLASS -
class DetailViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UITextView!
    
    // Comunicarse con el ViewModel
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }
    
    private func update(image: URL?) {
        guard let image else { return }
        imageOutlet.setImage(for: image)
    }
    
    private func update(name: String?) {
        nameOutlet.text = name ?? nil
    }
    
    private func update(description: String?) {
        descriptionOutlet.text = description ?? nil
    }

}

// MARK: - EXTENSION -
extension DetailViewController: DetailViewProtocol {
    func updateView() {
        if let data = viewModel?.characterData {
            update(image: data.photo)
            update(name: data.name)
            update(description: data.description)
        }
    }
}
