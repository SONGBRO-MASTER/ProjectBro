//
//  ViewController.swift
//  ProjectBro
//
//  Created by SONGBRO on 2022/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    /* 뷰 구성 */
    private let mainTableView: UITableView = { // 메인 테이블 뷰
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private let plusBtn: UIButton = { // 플러스 버튼
       
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .red
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad!")
        view.backgroundColor = .yellow
        
        /* mainTableView 설정(오토레이아웃) */
        view.addSubview(mainTableView)
        mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        /* plusBtn 설정(오토레이아웃) */
        view.addSubview(plusBtn)
        plusBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        plusBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        plusBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        plusBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
