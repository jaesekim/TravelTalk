//
//  ChatListTableViewCell.swift
//  TravelTalk
//
//  Created by 김재석 on 1/17/24.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        userNameLabel.font = .boldSystemFont(ofSize: 15)
        
        statusLabel.font = .systemFont(ofSize: 13)
        
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textAlignment = .right
        
    }

    func setDataInCell(data: Chat) {
        profileImageView.image = UIImage(named: data.user.profileImage)
        userNameLabel.text = data.user.rawValue
        statusLabel.text = data.message
        dateLabel.text = data.date
    }
    
}
