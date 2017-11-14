//
//  PageCell.swift
//  AutoLayout_Test
//
//  Created by SeungWon Kim on 10/20/29 H.
//  Copyright © 29 Heisei SEUNGWON KIM. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
  
  var page:Page? {
    didSet {
//      print(page?.imageName)
      guard let unwrappedPage = page else { return }
      
      flagImageView.image = UIImage(named: unwrappedPage.imageName)
      
      let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font:  UIFont.boldSystemFont(ofSize: 18)])
      attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
      descTextView.attributedText = attributedText
      descTextView.textAlignment = .center
    }
  }
  
  private let flagImageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "canada"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let descTextView: UITextView = {
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  private func setupLayout() {
    let topImageContainerView = UIView()
    
    addSubview(topImageContainerView)
    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false;
    topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    topImageContainerView.addSubview(flagImageView)
    flagImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
    flagImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
    flagImageView.heightAnchor.constraint(equalTo:topImageContainerView.heightAnchor, multiplier:0.5).isActive = true
    
    topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    
    addSubview(descTextView)
    descTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
    descTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
    descTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
    descTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
