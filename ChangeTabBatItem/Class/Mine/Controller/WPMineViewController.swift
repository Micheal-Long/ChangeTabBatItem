//
//  WPMineViewController.swift
//  ChangeTabBatItem
//
//  Created by Micheal on 2016/11/23.
//  Copyright © 2016年 Micheal. All rights reserved.
//

import UIKit

class WPMineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    fileprivate var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.tableFooterView = UIView()
        tableView!.tableHeaderView = UIView()
        view.addSubview(tableView!)
        //  设置分割线从最左边开始
        if tableView!.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            tableView!.separatorInset = .zero
        }
        if tableView!.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            tableView!.layoutMargins = .zero
        }
    }
    //  MARK: - UITableViewDataSource 
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = .zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            cell.layoutMargins = .zero
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UITableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            cell!.selectionStyle = .none
        }
        cell!.textLabel!.text = "切换TabBar"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController!.pushViewController(WPChangeItemTableViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
