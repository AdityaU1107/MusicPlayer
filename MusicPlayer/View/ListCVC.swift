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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
    @IBAction func playBtn(_ sender: UIButton) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "MusicListVC") as! MusicListVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
