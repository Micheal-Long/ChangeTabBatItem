//
//  WPTabBarController.swift
//  ChangeTabBatItem
//
//  Created by Micheal on 2016/11/23.
//  Copyright © 2016年 Micheal. All rights reserved.
//

import UIKit

class WPTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  设置tabbar的背景色
        let bgView = UIView(frame:tabBar.bounds)
        bgView.backgroundColor = .white
        tabBar.insertSubview(bgView, at: 0)
        tabBar.isOpaque = true
        //  添加子控制器
        self.addChildViewController(WPHomeViewController(), title: "微信", image: "tabbar_mainframe", selectedImage: "tabbar_mainframeHL")
        self.addChildViewController(WPContactViewController(), title: "通讯录", image: "tabbar_contacts", selectedImage: "tabbar_contactsHL")
        self.addChildViewController(WPDiscoverViewController(), title: "发现", image: "tabbar_discover", selectedImage: "tabbar_discoverHL")
        self.addChildViewController(WPMineViewController(), title: "我", image: "tabbar_me", selectedImage: "tabbar_meHL")
    }
    
    @objc private func addChildViewController(_ childController: UIViewController, title: String, image: String, selectedImage:String) {
        //  设置文字
//        childController.tabBarItem.title = title //设置tabBar的文字
//        childController.navigationItem.title = title //设置navigationBar的文字
        childController.title = title//同时设置tabbar与navigationBar的文字
        //  设置背景颜色
        childController.view.backgroundColor = .white
        //  设置图片
        childController.tabBarItem.image = UIImage(named: image)
        //  选中时的图片
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        //  设置不同状态下字体样式 122v126v131
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 122.0/255.0, green: 126.0/255.0, blue: 131.0/255.0, alpha: 1.0)], for: .normal)
        
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 31.0/255.0, green: 185.0/255.0, blue: 34.0/255.0, alpha: 1.0)], for: .selected)
        //  将视图控制器先包装成导航控制器
        let navigationVC = WPNavigationController(rootViewController: childController)
        self.addChildViewController(navigationVC)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
