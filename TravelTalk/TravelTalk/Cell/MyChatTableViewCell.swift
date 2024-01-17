//
//  MyChatTableViewCell.swift
//  TravelTalk
//
//  Created by 김재석 on 1/17/24.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {

    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var edgeView: UIView!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        edgeView.backgroundColor = .systemGray5
        edgeView.layer.borderColor = UIColor.systemGray5.cgColor
        edgeView.layer.cornerRadius = 8
        edgeView.layer.borderWidth = 1
        
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0
        
        dateLabel.textAlignment = .right
        dateLabel.font = .systemFont(ofSize: 11)
    }

    func setDataInCell(data: Chat) {
        messageLabel.text = data.message
        dateLabel.text = "11:11 오전"
    }
    
}
