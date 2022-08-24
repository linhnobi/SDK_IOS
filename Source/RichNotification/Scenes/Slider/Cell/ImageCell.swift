//
//  ImageCell.swift
//  SliderApp
//
//  Created by Sun on 16/08/2022.
//

import UIKit

final class ImageCell: UICollectionViewCell {

    // MARK: - Outlet
    @IBOutlet private weak var imageView: UIImageView!
        
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Data
    func setContent(image: UIImage?) {
        if let image = image {
            imageView.image = image
        }
    }
}
