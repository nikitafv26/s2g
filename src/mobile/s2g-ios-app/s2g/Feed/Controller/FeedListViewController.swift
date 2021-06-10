//
//  FeedListViewController.swift
//  s2g
//
//  Created by Nikita Fedorenko on 05.06.2021.
//

import UIKit
import SwiftUI

class FeedListViewController: UIViewController {

    let contentView = UIHostingController(rootView: FeedListView())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(contentView)
        view.addSubview(contentView.view)
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
