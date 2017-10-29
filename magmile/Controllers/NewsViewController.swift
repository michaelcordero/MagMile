//
//  NewsViewController.swift
//  magmile
//
//  Created by Michael Cordero on 9/15/17.
//  Copyright © 2017 com.codec. All rights reserved.
//

import UIKit

class NewsViewController: UICollectionViewController {
    
    let cellID = "cellID"
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.tabBarItem = UITabBarItem.init(title: "News", image: #imageLiteral(resourceName: "newsfeed"), tag: 0)
        self.collectionView?.backgroundColor = UIColor(white: 0.95, alpha:1)
        self.navigationItem.title = "Mag Mile Bartenders"
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // collectionView?.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
