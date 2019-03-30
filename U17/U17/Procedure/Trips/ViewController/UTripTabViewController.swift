//
//  UTripTabViewController.swift
//  U17
//
//  Created by hanjing on 3/30/19.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit

class UTripTabViewController: UBaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var triptitle: UILabel!
    
    @IBOutlet weak var travelmap: UILabel!
    @IBOutlet weak var history: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configUI()
    }
    
    override func configUI() {
       
    }
}
