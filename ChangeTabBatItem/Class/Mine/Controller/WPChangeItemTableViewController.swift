//
//  WPChangeItemTableViewController.swift
//  ChangeTabBatItem
//
//  Created by Micheal on 2016/11/24.
//  Copyright © 2016年 Micheal. All rights reserved.
//

import UIKit

class WPChangeItemTableViewController: UITableViewController {

    fileprivate let dataSource = ["Wechat","Discover"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "首页TabBar设置"
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UITableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            cell!.selectionStyle = .blue
        }
        cell!.textLabel!.text = dataSource[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let window = UIApplication.shared.delegate!.window
        let tabBarController:WPTabBarController = window!!.rootViewController as! WPTabBarController
        
        var tabbarViewControllers = tabBarController.viewControllers
        
        let wechatController:WPNavigationController = tabbarViewControllers![0] as! WPNavigationController
        let contactController:WPNavigationController = tabbarViewControllers![1] as! WPNavigationController
        let discoverController:WPNavigationController = tabbarViewControllers![2] as! WPNavigationController
        let mineController:WPNavigationController = tabbarViewControllers![3] as! WPNavigationController
        
        if indexPath.row == 0 {
            if (wechatController.topViewController?.isKind(of: WPHomeViewController.self))! {
                tabBarController.viewControllers = [wechatController,contactController,discoverController,mineController]
            }else {
                tabBarController.viewControllers = [contactController,wechatController,discoverController,mineController]
            }
        }else {
            if (wechatController.topViewController?.isKind(of: WPHomeViewController.self))! {
                tabBarController.viewControllers = [contactController,wechatController,discoverController,mineController]
            }else {
                tabBarController.viewControllers = [wechatController,contactController,discoverController,mineController]
            }
        }
    }

}
