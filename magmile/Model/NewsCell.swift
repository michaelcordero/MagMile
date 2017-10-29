//
//  NewsCell.swift
//  magmile
//
//  Created by Michael Cordero on 10/28/17.
//  Copyright © 2017 Codec Software. All rights reserved.
//

import Foundation
import UIKit

// MARK - NewsCell Class
class NewsCell: UICollectionViewCell {
    
    // MARK - Attributes
    var nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 2
        let attrText = NSMutableAttributedString(string: "John Q Public", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
        
        //add info
        attrText.append(NSAttributedString(string: "\nOctober 28 •  Urbana  •   ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12),
                       NSAttributedStringKey.foregroundColor : UIColor.init(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrText.addAttributes([NSAttributedStringKey.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: attrText.length))
        
        //add image
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "globe")
        attachment.bounds = CGRect.init(x: 0, y: -2, width: 12, height: 12)
        attrText.append(NSAttributedString.init(attachment: attachment))
        
        //add attributed string to label
        label.attributedText = attrText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profileImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.cyan
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var statusTextView: UITextView = {
        let textView: UITextView = UITextView()
        textView.text = "Test status for Halloween!"
        textView.font = UIFont.systemFont(ofSize: 14)
       return textView
    }()
    
    var statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "SignInBckImg")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - FilePrivate
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        //
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]|", views: profileImageView, statusTextView, statusImageView)
    }
}

// MARK - UIView Extension
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
