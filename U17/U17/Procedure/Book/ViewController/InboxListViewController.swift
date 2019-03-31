//
//  URecListViewController.swift
//  U17
//
//  Created by hanjing on 3/30/19.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit

class InboxListViewController: UBaseViewController {
    
    private var recList = [WriterModel]()
    
    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .plain)
        tw.backgroundColor = UIColor.background
        tw.tableFooterView = UIView()
        tw.separatorStyle = .none
        tw.delegate = self
        tw.dataSource = self
        tw.separatorStyle = .none
        tw.register(cellType: InboxCell.self)
        tw.uHead = URefreshHeader{ [weak self] in self?.loadData() }
        tw.uempty = UEmptyView { [weak self] in self?.loadData() }
        return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    @objc private func loadData() {
        recList.append(WriterModel(photo: "https://stickershop.line-scdn.net/stickershop/v1/product/1041194/LINEStorePC/main.png;compress=true", name: "oneadasdasdadadsadasdasdas", description: "34 stories"))
        recList.append(WriterModel(photo: "https://stickershop.line-scdn.net/stickershop/v1/product/1041194/LINEStorePC/main.png;compress=true", name: "two", description: "2 stories"))
        recList.append(WriterModel(photo: "https://stickershop.line-scdn.net/stickershop/v1/product/1041194/LINEStorePC/main.png;compress=true", name: "three", description: "199 stories"))
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
    }
}

extension InboxListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: InboxCell.self)
        cell.model = recList[indexPath.row]
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenWidth * 0.4
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = recList[indexPath.row]
//        let vc = URecListViewController(argCon: model.photo,
//                                          argName: model.name,
//                                          argValue: model.description)
//        vc.title = "\(model.title!) List"
//        navigationController?.pushViewController(vc, animated: true)
//    }
}

