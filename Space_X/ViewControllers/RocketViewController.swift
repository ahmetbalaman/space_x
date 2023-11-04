//
//  RocketViewController.swift
//  Space_X
//
//  Created by Ahmet Balaman on 22.08.2023.
//

import UIKit

class RocketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
     getRockets()
    }
    
    
    func getRockets(){
        
        NetworkManager.shared.RocketAPI { result in
            switch result{
            case .success(let rocket):
                rocket?.forEach({ RocketModel in
                    print(RocketModel.rocketName)
                })
                break
            case .failure(let error):
                print("\(error) in rocketAPI ")
                break
            }
        }
    }
    

}
