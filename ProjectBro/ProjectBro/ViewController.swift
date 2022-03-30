//
//  ViewController.swift
//  ProjectBro
//
//  Created by SONGBRO on 2022/03/25.
//

import UIKit

/* MARK: MainViewController */
class ViewController: UIViewController {
    
    // MARK: - Property
    /* 뷰 구성 */
    private let mainTableView: UITableView = { // 메인 테이블 뷰
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cell") // 테이블 뷰 셀 등록
        
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
        
        setDelegate() // 위임자(대리자) 설정
        addSubViews()
        setAutoLayout() // 오토레이아웃 설정
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
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        
//        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
    
    /* UITableViewDelegate */
}

/* MARK: - MainTableViewCell */
class MainTableViewCell: UITableViewCell {
    
    // MARK: - Property
    /* 뷰 구성 */
    private let nameLabel: UILabel = { // 프로젝트 이름
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Project1"
        label.backgroundColor = .yellow
        
        return label
    }()
    
    private let dDayLabel: UILabel = { // D-day
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "D-100"
        label.backgroundColor = .green
        
        return label
    }()
    
    lazy var progressView: UIProgressView = { // 프로그레스 바
       
        let progressview = UIProgressView()
        progressview.translatesAutoresizingMaskIntoConstraints = false
        progressview.trackTintColor = .orange
        progressview.progressTintColor = .red
        progressview.progress = 0.1
        
        return progressview
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp() // 뷰 설정
    }

    required init?(coder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() { // 뷰 설정
        
        addContentViews()
        setAutoLayout() // 오토레이아웃 설정
    }
    
    // MARK: - SetUp
    private func addContentViews() {
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(dDayLabel)
        contentView.addSubview(progressView)
    }
    
    private func setAutoLayout() { // 오토레이아웃 설정
        
        NSLayoutConstraint.activate([
        
            /* nameLabel 설정(오토레이아웃) */
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            /* dDayLabel 설정(오토레이아웃) */
            dDayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            dDayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            dDayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            dDayLabel.widthAnchor.constraint(equalToConstant: 50),
            
            /* progressView 설정(오토레이아웃) */
            progressView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 10)
        ])
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
