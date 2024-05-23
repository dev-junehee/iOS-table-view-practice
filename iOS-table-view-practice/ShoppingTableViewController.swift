//
//  ShoppingTableViewController.swift
//  iOS-table-view-practice
//
//  Created by junehee on 5/23/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designHeader()
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

}
