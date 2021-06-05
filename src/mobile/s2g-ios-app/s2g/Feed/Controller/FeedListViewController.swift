//
//  FeedListViewController.swift
//  s2g
//
//  Created by Nikita Fedorenko on 05.06.2021.
//

import UIKit
import SwiftUI

class FeedListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftUIController = UIHostingController(rootView: FeedListView())
        addChild(swiftUIController)
        view.addSubview(swiftUIController.view)
        
        swiftUIController.didMove(toParent: self)
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
