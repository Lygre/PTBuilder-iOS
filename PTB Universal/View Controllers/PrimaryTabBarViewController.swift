//
//  PrimaryTabBarViewController.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/7/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

public class PrimaryTabBarViewController: UITabBarController, UITabBarControllerDelegate {


    override public func viewDidLoad() {
        super.viewDidLoad()
		viewControllers = [
			storyboard?.instantiateViewController(withIdentifier: "firstView"),
			storyboard?.instantiateViewController(withIdentifier: "teamMembersView"),
			storyboard?.instantiateViewController(withIdentifier: "teamOverviewView"),
			storyboard?.instantiateViewController(withIdentifier: "pokedexView"),
			storyboard?.instantiateViewController(withIdentifier: "calculatorSplitViewController")
			] as? [UIViewController]
        // Do any additional setup after loading the view.
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
