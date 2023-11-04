//
//  ViewController.swift
//  Space_X
//
//  Created by Ahmet Balaman on 10.08.2023.
//

import UIKit

import SafariServices

//historical_events yedek olanda history

class HomeViewController: UIViewController {

    // MARK: Veriables
    var myScrollUIViewPages: [ScrollUIView] = []
    var scrollThroughPageControl: Bool = false
    private let scrollView = UIScrollView()

    // MARK: Outlets

    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = myPages.count

        pageControl.pageIndicatorTintColor = .label
        pageControl.currentPageIndicatorTintColor = .red
        return pageControl
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollableContent()
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(whichOnePageSelected(_:)), for: .valueChanged)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if scrollView.subviews.count == 2 {
            setUpAnimationList()
            configureScrollView()
        }
    }

    // MARK: IBActions


    @IBAction func swipeUp(_ sender: Any) {
        //YUKARIYA GİDİNCE COLLECTİON VİEW AÇILSIN
    }

    private func setUpAnimationList() {


        for i in 0..<myPages.count {

            myScrollUIViewPages.append(ScrollUIView(frame: .zero, lottieName: myPages.values[i].rawValue, inset: UIEdgeInsets(top: 30, left: 30, bottom: 100, right: 30)))

        }
        myScrollUIViewPages.first?.playAnimation()
    }


  
}
extension HomeViewController{
    //MARK: Functions

    private func setupScrollableContent() {
        view.addSubview(pageControl)
        view.addSubview(scrollView)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }

 

    private func configureScrollView() {

        scrollView.contentSize = CGSize(
            width: view.frame.size.width * CGFloat(myPages.count),
            height: scrollView.bounds.size.height
        )
        print(scrollView.bounds.size)
        print(scrollView.contentSize)


        scrollView.showsHorizontalScrollIndicator = false

        scrollView.isPagingEnabled = true

        let myTitles = Array(myPages.keys)
        for x in 0..<myPages.count {

            let page = myScrollUIViewPages[x]
            page.frame = CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height)
//            page.layer.borderWidth = 10
            page.label.text = myTitles[x]
//            page.imageView.image = UIImage(named: myImages[x].rawValue)



            page.tag = x
            page.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pageDidTap(_:))))




//            page .backgroundColor = colors[x]
            scrollView.addSubview(page)
        }
    }


    @objc private func pageDidTap(_ recognizer: UITapGestureRecognizer) {

        guard let whichOne = recognizer.view?.tag else {
            return
        }
        switch whichOne {
        case 0:
            //Launches
            let vc = storyboard?.instantiateViewController(identifier: "LaunchesViewStoryBoard") as! LaunchesViewController

            navigationController?.pushViewController(vc, animated: true)

            break;
        case 1:
            //rocketViewStoryID
            let vc = storyboard?.instantiateViewController(identifier: "rocketViewStoryID") as! RocketViewController

            navigationController?.pushViewController(vc, animated: true)

            //Rockets
            break;
        case 2:
            //Missions
            break;
        case 3:
            // Landing pads
            break;
        case 4:
            //Historical Events
            break;
        case 5:
            //Dragons
            break;
        case 6:
            // Capsule
            break
        case 7:
            // Cores
            break

        default:
            print("nothing")
        }

    }




    @objc private func whichOnePageSelected(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(
            CGPoint(
                x: scrollView.contentSize.width / CGFloat(5) * CGFloat(current),
                y: .zero
            ),
            animated: true
        )
        scrollThroughPageControl = true
    }
}

extension HomeViewController: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        myScrollUIViewPages.forEach { view in
            view.stopAnimation()
        }

        if !scrollThroughPageControl {


            let centerXOfContainer = scrollView.contentOffset.x + scrollView.contentSize.width / 2 / CGFloat(5)
            let pageNumer = scrollView.bounds.size.width > 0
                ? Int(floor(Float(centerXOfContainer / scrollView.bounds.size.width)))
            : 0

            pageControl.currentPage = pageNumer
        }
        guard !(myScrollUIViewPages.isEmpty) else {
            return
        }
        myScrollUIViewPages[pageControl.currentPage].playAnimation()
    }
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {




        scrollThroughPageControl = false


    }
    
}






/*
 
 if self.traitCollection.userInterfaceStyle == .dark {
     print("its dark mode")
 } else {
     print("its white mode")
 }
 
 view did load
 
 //        pageCollectionView.register(PageCollectionViewCell.nib(), forCellWithReuseIdentifier: PageCollectionViewCell.identifider)
 //
 //        pageCollectionView.dataSource = self
 //        pageCollectionView.delegate = self

 
 extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         myPages.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         let arrayOfTitles = Array(myPages.keys)
         let arrayOfImages = Array(myPages.values)
         let cell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: PageCollectionViewCell.identifider, for: indexPath) as? PageCollectionViewCell
         
         cell?.pageImage.image = UIImage(named: arrayOfImages[indexPath.row] )
         
         cell?.pageTitle.text = arrayOfTitles[indexPath.row]
         
         return cell ?? UICollectionViewCell();
         
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
     }
             
     
     
     
 }



 */


/*
 Karanlık modda ise animasyon değiştir özelliğini yap
 var isDarkMode:Bool = false
 override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
     
     // Trait collection has already changed
     self.traitCollection.userInterfaceStyle == .dark ? (isDarkMode = true) : (isDarkMode = false)
     
 }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        // Trait collection will change. Use this one so you know what the state is changing to.

    }


 */


/*
 
 YAPILACAKLAR: DİĞER UYGULAMALARIMIZ KISMINA BUNU EKLE.
 
 UIApplication.shared.open(URL(string: "MarvelDevTips://")!) { success in
     
     print(success.description)
     
     if(!success){
         UIApplication.shared.open(URL(string: "https://stackoverflow.com/questions/33932303/swift-how-to-open-a-new-app-when-uibutton-is-tapped")!)
     }
 }
 
 
 
 */
