//
//  URecListViewController.swift
//  U17
//
//  Created by hanjing on 3/30/19.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit

class URecListViewController: UBaseViewController {
    
    private var recList = [WriterModel]()
    
    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .plain)
        tw.backgroundColor = UIColor.background
        tw.tableFooterView = UIView()
        tw.separatorStyle = .none
        tw.delegate = self
        tw.dataSource = self
        tw.separatorStyle = .none
        tw.register(cellType: URankTCell.self)
        tw.uHead = URefreshHeader{ [weak self] in self?.loadData() }
        tw.uempty = UEmptyView { [weak self] in self?.loadData() }
        return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    @objc private func loadData() {
        recList.append(WriterModel(photo: ((resourceName: "logo") as! String) , name: "one", description: "one"))
        recList.append(WriterModel(photo: ((resourceName: "logo") as! String) , name: "two", description: "two"))
        recList.append(WriterModel(photo: ((resourceName: "logo") as! String) , name: "three", description: "three"))
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
    }
}

extension URecListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UIWriterCell.self)
        cell.model = recList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenWidth * 0.4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = recList[indexPath.row]
        let vc = URecListViewController(argCon: model.photo,
                                          argName: model.name,
                                          argValue: model.description)
        vc.title = "\(model.title!) List"
        navigationController?.pushViewController(vc, animated: true)
    }
}

