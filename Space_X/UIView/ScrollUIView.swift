//
//  ScrollUIView.swift
//  Space_X
//
//  Created by Ahmet Balaman on 11.08.2023.
//

import Foundation
import UIKit
import Lottie

/*
 
 let imageView:UIImageView = {
     let image = UIImageView()
     image.contentMode = .scaleAspectFit
     
     return image;
 }()
 
 */
class ScrollUIView: UIView {
    
    var lottieView:LottieAnimationView!
    
    let label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label;
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect ,lottieName:String, inset: UIEdgeInsets){
        super.init(frame: frame)
        lottieView = LottieAnimationView(name: lottieName)
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 1
        
        setUpConstraint(inset)
        
        
    }
    
    func playAnimation(){
        lottieView.play()
        
    }
    func stopAnimation(){
        lottieView.stop()
    }
    
    private func setUpConstraint(_ inset: UIEdgeInsets){
        addSubview(lottieView)
        addSubview(label)
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -inset.bottom),
                label.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -inset.right),
                label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset.left),
        
            lottieView.topAnchor.constraint(equalTo: self.topAnchor,constant: inset.top),
            lottieView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: inset.left),
            lottieView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right),
                lottieView.bottomAnchor.constraint(equalTo: label.topAnchor,constant: -20),
        ])
    }
    
}

