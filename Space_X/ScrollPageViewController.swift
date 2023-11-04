//
//  ScrollPageViewController.swift
//  Space_X
//
//  Created by Ahmet Balaman on 11.08.2023.
//

import UIKit

class ScrollPageViewController: UIViewController {
    private let  scrollView = UIScrollView()
    let pageControl: UIPageControl  = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .systemBlue
       return pageControl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(pageControl)

        view.addSubview(scrollView)
      
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 0, y: view.frame.size.height-100, width: view.frame.size.width-20, height: 70)
        
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-100)
        
        if scrollView.subviews.count == 2{
            configureScrollView()
        }
    }
    
     
     private func configureScrollView(){
         scrollView.contentSize = CGSize(width: view.frame.size.width , height: scrollView.frame.size.height)
         scrollView.isPagingEnabled = true

         let colors: [UIColor] = [.yellow,.blue,.brown,.cyan,.gray]
         for x in 0..<5{
             let page = UIView(
                frame:
                    CGRect(
                        x: CGFloat(x) * view.frame.size.height,
                        y: 0,
                        width: view.frame.size.width,
                        height: scrollView.frame.size.height))
             page.backgroundColor = colors[x]
             scrollView.addSubview(page)
         }
     }

}
