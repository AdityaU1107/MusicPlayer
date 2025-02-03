//
//  ListCVC.swift
//  MusicPlayer
//
//  Created by Aditya on 03/02/25.
//

import UIKit

class ListCVC: UICollectionViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var durationXPlbl: UILabel!
    @IBOutlet weak var favouritebtn: UIButton!
    @IBOutlet weak var musicname: UILabel!
    var favoriteButtonAction: (() -> Void)?
        var playButtonAction: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func favouriteBtnTapped(_ sender: UIButton) {
            sender.isSelected.toggle()
            favoriteButtonAction?()
        }
    
    @IBAction func playBtn(_ sender: UIButton) {
        
                playButtonAction?()
            
    }
}
