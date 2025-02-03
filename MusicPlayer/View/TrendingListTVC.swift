//
//  TrendingListTVC.swift
//  MusicPlayer
//
//  Created by Aditya on 02/02/25.
//

import UIKit

class TrendingListTVC: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var timeAndXPLbl: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageview.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    @IBAction func favrouteBtn(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
}
