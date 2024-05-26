//
//  ShoppingTableViewController.swift
//  iOS-table-view-practice
//
//  Created by junehee on 5/23/24.
//

import UIKit

struct ShoppingItem {
    let name: String
    var done: Bool
    var favorite: Bool
}

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = [
        ShoppingItem(name: "그립톡 구매하기", done: true, favorite: true),
        ShoppingItem(name: "사이다 구매", done: false , favorite: false),
        ShoppingItem(name: "아이패드 케이스 최저가 알아보기", done: false, favorite: true),
        ShoppingItem(name: "양말", done: false, favorite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designHeader()
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        
        tableView.rowHeight = 50
    }

    
    // Header 헤더 영역
    // 텍스트 필드
    func designHeader() {
        // 텍스트필드
        textField.placeholder = "무엇을 구매하실 건가요?"
        textField.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        
        // 추가버튼
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        addButton.layer.cornerRadius = 8
        addButton.backgroundColor = .systemGray5
    }
    
    // TableView 테이블뷰 영역
    // 1.섹션 내 셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingList.count
    }
    
    // 2. 셀 디자인, 데이터
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 타입 캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        let data = shoppingList[indexPath.row]
        
        cell.itemName.text = data.name
        cell.itemName.font = .systemFont(ofSize: 14, weight: .regular)
        
        let doneImageName = data.done ? "checkmark.circle.fill" : "checkmark.circle"
        cell.doneButton.setImage(UIImage(systemName: doneImageName), for: .normal)
        cell.doneButton.tag = indexPath.row
        cell.doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        
        
        let favoriteImageName = data.favorite ? "star.fill" : "star"
        cell.favoriteButton.setImage(UIImage(systemName: favoriteImageName), for: .normal)
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
        
        cell.tintColor = .black
        cell.backgroundColor = .systemGray6
        
        return cell
    }
    
    // 추가 버튼 핸들러
    @objc func addButtonClicked(_ sender: UIButton) {
        print("추가!!")
        guard let itemName = textField.text else {
            print("재입력 해주세요")
            return
        }
        let newItem = ShoppingItem(name: itemName, done: false, favorite: false)
        shoppingList.insert(newItem, at: 0)
        tableView.reloadData()
        textField.text = ""
    }
    
    // 완료 버튼 핸들러
    @objc func doneButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        shoppingList[idx].done.toggle()
        tableView.reloadData()
    }
    
    // 즐겨찾기 버튼 핸들러
    @objc func favoriteButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        shoppingList[idx].favorite.toggle()
        tableView.reloadRows(at: [IndexPath(row: idx, section: 0)], with: .automatic)
    }

}
