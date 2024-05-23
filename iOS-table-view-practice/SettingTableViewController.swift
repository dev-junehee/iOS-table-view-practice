//
//  SettingTableViewController.swift
//  iOS-table-view-practice
//
//  Created by junehee on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let data: [String: [String]] = [
        "전체 설정": ["공지사항", "실험실", "버전 정보"],
        "개인 설정": ["개인/보안", "알림", "채팅", "멀티프로필"],
        "기타": ["고객센터/도움말"]
    ]
    
    let titles = ["전체 설정", "개인 설정", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 섹션 개수 구성
    override func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    // 섹션별 타이틀 구성
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }

    // 섹션별 셀 개수 구성
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 섹션 타이틀을 찾아서 data에서 맞는 key의 value.count만큼 섹션 안에 셀 생성
        let key = titles[section]
        guard let cells = data[key]?.count else { return 0 }
        return cells
    }
    
    // 셀의 높이 설정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    // 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath : [section 섹션, row 셀]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else { return UITableViewCell() }
        
        let section = indexPath.section
        let idx = indexPath.row
        let key = titles[section]
        
        cell.textLabel?.text = data[key]?[idx]
        
        return cell
    }

}
