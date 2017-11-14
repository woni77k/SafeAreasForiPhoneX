//
//  SwipingController.swift
//  AutoLayout_Test
//
//  Created by SeungWon Kim on 10/19/29 H.
//  Copyright © 29 Heisei SEUNGWON KIM. All rights reserved.
//

import UIKit

struct Page {
  let imageName: String
  let headerText: String
  let bodyText: String
}

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  let pages = [
    Page(imageName: "canada", headerText: "Join use today in our fun and games!", bodyText:"Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
    Page(imageName: "argentina", headerText: "Subscribe and get coupons on our daily events", bodyText:"Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
    Page(imageName: "jamaica", headerText: "VIP members special services", bodyText:"")
  ]

  private let previousButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Prev", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.gray, for: .normal)
    button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
    return button
  }()
  
  private let nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Next", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    //    let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    button.setTitleColor(.mainPink, for: .normal)
    button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
    return button
  }()

  
  @objc private func handlePrev() {
    print("Trying to advance to prev")
    let nextIndex = max(pageControl.currentPage - 1, 0)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    pageControl.currentPage = nextIndex
    collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  }
  
  @objc private func handleNext() {
    print("Trying to advance to next")
    let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
    let indexPath = IndexPath(item: nextIndex, section: 0)
    pageControl.currentPage = nextIndex
    collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  }
  
  private lazy var pageControl: UIPageControl = {
    let pc = UIPageControl()
    pc.currentPage = 0
    pc.numberOfPages = pages.count
    //     let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    pc.currentPageIndicatorTintColor = .mainPink
    pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
    return pc
  }()
  
  fileprivate func setupBottomControls() {
    view.addSubview(previousButton)
    
    let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
    bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomControlsStackView.distribution = .fillEqually
    //    bottomControlsStackView.axis = .vertical
    
    view.addSubview(bottomControlsStackView)
    if #available(iOS 11.0, *){
      NSLayoutConstraint.activate([
        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }else {
      NSLayoutConstraint.activate([
        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
  }
  override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let x = targetContentOffset.pointee.x
//    print(x, view.frame.width, x / view.frame.width)
    pageControl.currentPage = Int(x / view.frame.width)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBottomControls()
    collectionView?.backgroundColor = .white
    collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
    collectionView?.isPagingEnabled = true
    collectionView?.showsHorizontalScrollIndicator = false
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
    
    let page = pages[indexPath.item]
    cell.page = page
//    cell.flagImageView.image = UIImage(named:page.imageName)
//    cell.descTextView.text = page.headerText;
    //    cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
      return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.invalidateLayout()
    }
    let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
    DispatchQueue.main.async {
      self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
  }
}
