//
//  ViewController.swift
//  AutoLayout_Test
//
//  Created by SeungWon Kim on 10/19/29 H.
//  Copyright © 29 Heisei SEUNGWON KIM. All rights reserved.
//

import UIKit

extension UIColor {
  static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {

  let flagImageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "canada"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  let descTextView: UITextView = {
    let textView = UITextView()
    let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font:  UIFont.boldSystemFont(ofSize: 18)])
    attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hole to see you in our stores soon.", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
    textView.attributedText = attributedText
//    textView.text = "Join us today in our fun and games!"
//    textView.font = UIFont.boldSystemFont(ofSize: 18)
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.textAlignment = .center
    textView.isEditable = false;
    textView.isScrollEnabled = false
    return textView
  }()
  
//  private let previousButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.setTitle("Prev", for: .normal)
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//    button.setTitleColor(.gray, for: .normal)
//    return button
//  }()
//
//  private let nextButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.setTitle("Next", for: .normal)
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
////    let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
//    button.setTitleColor(.mainPink, for: .normal)
//    return button
//  }()
//
//  private let pageControl: UIPageControl = {
//    let pc = UIPageControl()
//    pc.currentPage = 0
//    pc.numberOfPages = 4
////     let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
//    pc.currentPageIndicatorTintColor = .mainPink
//    pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
//    return pc
//  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
//    view.addSubview(flagImageView)
//    view.addSubview(descTextView)
//    setupBottomControls()
//    setupLayout()
   
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


//  fileprivate func setupBottomControls() {
//    view.addSubview(previousButton)
//    
//    let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
//    bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//    bottomControlsStackView.distribution = .fillEqually
////    bottomControlsStackView.axis = .vertical
//    
//    view.addSubview(bottomControlsStackView)
//    if #available(iOS 11.0, *){
//    NSLayoutConstraint.activate([
//      bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//      bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//      bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//      bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
//      ])
//    }else {
//      NSLayoutConstraint.activate([
//        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//  }
  
//  private func setupLayout() {
//    let topImageContainerView = UIView()
//
//    view.addSubview(topImageContainerView)
//
//    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false;
//    topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//    topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//    topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//    topImageContainerView.addSubview(flagImageView)
//    flagImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
//    flagImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
//    flagImageView.heightAnchor.constraint(equalTo:topImageContainerView.heightAnchor, multiplier:0.5).isActive = true
//
//    topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
//
//    descTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
//    descTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
//    descTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
//    descTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//  }
}

