//
//  userTableViewCell.swift
//  Users
//
//  Created by Azeem Ur Rehman on 31/01/21.
//

import UIKit

class userTableViewCell: UITableViewCell {
    
    @IBOutlet var userName:UILabel!
    @IBOutlet var userdetail:UILabel!
    @IBOutlet var userImage:UIImageView!
    
    @IBAction func deleteUser(_ sender: UIButton) {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
