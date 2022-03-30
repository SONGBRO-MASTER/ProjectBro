//
//  ViewController.swift
//  ProjectBro
//
//  Created by SONGBRO on 2022/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Property
    /* 뷰 구성 */
    private let mainTableView: UITableView = { // 메인 테이블 뷰
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 테이블 뷰 셀 등록
        
        return tableView
    }()
    
    private let plusBtn: UIButton = { // 플러스 버튼
       
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .red
        
        return btn
    }()
    
    private let arr = ["1", "2", "3", "4", "5"] // 임시 데이터

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad!")
        view.backgroundColor = .yellow
        
        setUp() // 뷰 설정
    }
    
    private func setUp() { // 뷰 설정
        
        setDelegate()
        addSubViews()
        setAutoLayout()
    }
    
    // MARK: - SetUp
    private func setDelegate() { // 위임자(대리자) 설정
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    private func addSubViews() {
        
        view.addSubview(mainTableView)
        view.addSubview(plusBtn)
    }
    
    private func setAutoLayout() { // 오토레이아웃 설정
        
        NSLayoutConstraint.activate([
        
            /* mainTableView 설정(오토레이아웃) */
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            /* plusBtn 설정(오토레이아웃) */
            plusBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            plusBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            plusBtn.widthAnchor.constraint(equalToConstant: 50),
            plusBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

/* MARK: - Delegate */
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    /* UITableViewDataSource */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
    
    /* UITableViewDelegate */
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
