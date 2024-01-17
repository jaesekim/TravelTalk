//
//  ChatListViewController.swift
//  TravelTalk
//
//  Created by 김재석 on 1/17/24.
//

import UIKit

class ChatListViewController: UIViewController{
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var chatTableView: UITableView!
    
    let chatInfo = ChatRoom.mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        searchBarDesign()
    }
}

extension ChatListViewController {
    func configureView() {
        navigationItem.title = "Travel Talk"
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        // xib 연결
        let xib = UINib(
            nibName: "ChatListTableViewCell",
            bundle: nil
        )
        chatTableView.register(
            xib,
            forCellReuseIdentifier: "ChatListTableViewCell"
        )
    }
    func searchBarDesign() {
        searchBar.placeholder = "친구 이름을 검색해보세요"
    }
}

extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChatListTableViewCell",
            for: indexPath) as! ChatListTableViewCell
        
        cell.setDataInCell(data: chatInfo[indexPath.row].chatList.last!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1. storyboard 지정
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // 2. connect storyboard with view controller
        let vc = sb.instantiateViewController(withIdentifier: "ChatDetailListViewController") as! ChatDetailListViewController
        
        // data 넘겨주기
        vc.props = chatInfo[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
