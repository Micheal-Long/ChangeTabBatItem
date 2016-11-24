//
//  WPNavigationController.swift
//  ChangeTabBatItem
//
//  Created by Micheal on 2016/11/23.
//  Copyright © 2016年 Micheal. All rights reserved.
//

import UIKit

class WPNavigationController: UINavigationController,UIGestureRecognizerDelegate {
    //  重写initialize方法，只调用一次
    override class func initialize() {
        //  设置整个项目所有item的主题样式
        let item = UIBarButtonItem.appearance()
        //  普通状态
        item.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 0.0, green: 190.0/255.0, blue: 12.0/255.0, alpha: 1.0),NSFontAttributeName:UIFont.systemFont(ofSize: 13.0)], for: .normal)
        //  不可用状态
        item.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.7),NSFontAttributeName:UIFont.systemFont(ofSize: 13.0)], for: .disabled)
        //  取出设置主题对象
        let navBar = UINavigationBar.appearance(whenContainedInInstancesOf: [WPNavigationController.self])
        navBar.backgroundColor = UIColor(red: 38.0/255.0, green: 38.0/255.0, blue: 38.0/255.0, alpha: 1.0);
        //  设置导航栏的背景图片
        navBar.isTranslucent = false
        navBar.tintColor = .white
        let backImage = UIImage.createImageWithColor(color: UIColor(red: 38.0/255.0, green: 38.0/255.0, blue: 38.0/255.0, alpha: 1.0))
        navBar.setBackgroundImage(backImage, for: .default)
        //  标题
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  开启滑动返回
        interactivePopGestureRecognizer!.delegate = self
    }
    // MARK: - 右滑返回上一界面
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // 默认为支持右滑反回
        var ok = true
        if (topViewController?.isKind(of: WPNavigationController.self))! {
            
            if (topViewController?.responds(to: #selector(WPNavigationController.gestureRecognizerShouldBegin(_:))))! {
                
                let controller = topViewController as! WPNavigationController
                ok = controller.gestureRecognizerShouldBegin(gestureRecognizer)
            }
        }
        return ok
    }
    // MARK: - 重写这个方法的目的，能拦截push进来的控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
//            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"btn_back_normal" highImage:@"btn_back_pressed"];
            viewController.view.backgroundColor = .white
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension UIImage {
    
    class func createImageWithColor(color:UIColor) -> UIImage {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage!
    }
    
}
