//
//  ChatDetailListViewController.swift
//  TravelTalk
//
//  Created by 김재석 on 1/17/24.
//

import UIKit

class ChatDetailListViewController: UIViewController {
    
    @IBOutlet var chatTableView: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    var props =  ChatRoom(
        chatroomId: 0,
        chatroomImage: [],
        chatroomName: "",
        chatList: []
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        print(props)
    }
    
}

extension ChatDetailListViewController {
    func configureView() {
        navigationItem.title = props.chatList.last?.user.rawValue
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        // xib 연결
        let myXib = UINib(nibName: "MyChatTableViewCell", bundle: nil)
        let otherXib = UINib(nibName: "OtherChatTableViewCell", bundle: nil)
        chatTableView.register(
            myXib,
            forCellReuseIdentifier: "MyChatTableViewCell"
        )
        chatTableView.register(
            otherXib,
            forCellReuseIdentifier: "OtherChatTableViewCell"
        )
        
        chatTableView.separatorStyle = .none
        searchBar.placeholder = "메시지를 입력하세요"
    }
}

extension ChatDetailListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return props.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detailChatList = props.chatList
        let curUser = detailChatList[indexPath.row].user.rawValue
        
        // 나일 때
        if curUser == User.user.rawValue {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "MyChatTableViewCell",
                for: indexPath
            ) as! MyChatTableViewCell
            cell.setDataInCell(data: detailChatList[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "OtherChatTableViewCell",
                for: indexPath
            ) as! OtherChatTableViewCell
            cell.setDataInCell(data: detailChatList[indexPath.row])
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
