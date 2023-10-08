//
//  HomeCellTableViewCell.swift
//  AppPatronesPractica
//
//  Created by Sergio Amo on 6/10/23.
//

import UIKit

class HomeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCellHome: UILabel!
    @IBOutlet weak var imageCellHome: UIImageView!
    @IBOutlet weak var viewCellHome: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCellHome.layer.cornerRadius = 4.0
    }
    
    override func prepareForReuse() {
        nameCellHome.text = nil
        imageCellHome.image = nil
    }
    
    func updateViews(data: Hero?) {
        update(name: data?.name)
        update(image: data?.photo)
    }
    
    private func update(name: String?) {
        nameCellHome.text = name ?? nil
    }
    
    private func update(image: URL?) {
        guard let image else { return }
        imageCellHome.setImage(for: image)
    }
}
