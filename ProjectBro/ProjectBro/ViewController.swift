//
//  ViewController.swift
//  ProjectBro
//
//  Created by SONGBRO on 2022/03/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    private let arr = ["1", "2", "3", "4", "5"] // 임시 데이터

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
        
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 테이블 뷰 셀 등록
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        /* plusBtn 설정(오토레이아웃) */
        view.addSubview(plusBtn)
        plusBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        plusBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        plusBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        plusBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
}

/* MARK: - SwiftUI Preview */
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct ViewPreview: PreviewProvider {
    
    static var previews: some View {
        
        ViewControllerRepresentable()
    }
}
