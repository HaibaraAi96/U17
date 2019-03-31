//
//  UTabBarController.swift
//  U17
//
//  Created by charles on 2017/9/29.
//  Copyright © 2017年 None. All rights reserved.
//

import UIKit

class UTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        
        /// 首页
        let onePageVC = UHomeViewController(titles: ["推荐",
                                                     "VIP",
                                                     "订阅",
                                                     "RANK"],
                                            vcs: [UBoutiqueListViewController(),
                                                  UVIPListViewController(),
                                                  USubscibeListViewController(),
                                                  URankListViewController()],
                                            pageStyle: .navgationBarSegment)
        addChildViewController(onePageVC,
                               title: "首页",
                               image: UIImage(named: "tab_home"),
                               selectedImage: UIImage(named: "tab_home_S"))
        
        
        /// 分类
        let classVC = UCateListViewController()
        addChildViewController(classVC,
                               title: "分类",
                               image: UIImage(named: "tab_class"),
                               selectedImage: UIImage(named: "tab_class_S"))
        
        
        /// TRIPS
        let tripsVC = UTripTabViewController()
        addChildViewController(tripsVC,
                               title: "Trips",
                               image: UIImage(named: "tab_trips"),
                               selectedImage: UIImage(named: "tab_trips_S"))
        
        
        /// Inbox
        let inboxVC = UBookViewController(titles: ["MESSAGES",
                                                  "NOTIFICATIONS"],
                                         vcs: [InboxListViewController(),
                                               UDocumentListViewController()],
                                         pageStyle: .navgationBarSegment)
        addChildViewController(inboxVC,
                               title: "Inbox",
                               image: UIImage(named: "tab_inbox"),
                               selectedImage: UIImage(named: "tab_inbox_S"))
        
        
        /// 我的
        let mineVC = UMineViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tab_mine"),
                               selectedImage: UIImage(named: "tab_mine_S"))
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
        addChildViewController(UNavigationController(rootViewController: childController))
    }
    
}

extension UTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
