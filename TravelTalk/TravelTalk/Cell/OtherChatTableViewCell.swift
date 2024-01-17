//
//  OtherChatTableViewCell.swift
//  TravelTalk
//
//  Created by 김재석 on 1/17/24.
//

import UIKit

class OtherChatTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var edgeView: UIView!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        edgeView.layer.borderColor = UIColor.systemGray5.cgColor
        edgeView.layer.cornerRadius = 8
        edgeView.layer.borderWidth = 1
        
        userNameLabel.font = .boldSystemFont(ofSize: 14)
        
        profileImageView.contentMode = .scaleAspectFit
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 11)
    }

    func setDataInCell(data: Chat) {
        profileImageView.image = UIImage(named: data.user.profileImage)
        
        userNameLabel.text = data.user.rawValue
        messageLabel.text = data.message
        dateLabel.text = "11:11 오전"
    }
    
}
