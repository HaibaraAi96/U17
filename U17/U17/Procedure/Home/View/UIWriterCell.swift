//
//  UIWriterCell.swift
//  U17
//
//  Created by hanjing on 3/30/19.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit

enum UIWriterCellStyle {
    case none
    case withName
    case withNameAndDesc
}

class UIWriterCell: UBaseCollectionViewCell {
    // photo circle
    private lazy var photoView: UIImageView = {
        let photoView = UIImageView()
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = photoView.frame.size.height / 2
        photoView.layer.masksToBounds = true
        photoView.layer.borderWidth = 0
        return photoView
    }()
    
    // writer name
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        return nameLabel
    }()
    
    // writer description
    private lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = UIColor.white
        descLabel.font = UIFont.systemFont(ofSize: 12)
        return descLabel
    }()
    
    override func configUI() {
        clipsToBounds = true
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIEdgeInsetsMake(0, 10, 0, 10))
            $0.height.equalTo(25)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        contentView.addSubview(photoView)
        photoView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(nameLabel.snp.top)
        }
        
        contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(UIEdgeInsetsMake(0, 10, 0, 10))
            $0.height.equalTo(20)
            $0.top.equalTo(nameLabel.snp.bottom)
        }
    }
    
    var style: UIWriterCellStyle = .withName {
        didSet {
            switch style {
            case .none:
                nameLabel.snp.updateConstraints{
                    $0.bottom.equalToSuperview().offset(25)
                }
                nameLabel.isHidden = true
                descLabel.isHidden = true
            case .withName:
                nameLabel.snp.updateConstraints{
                    $0.bottom.equalToSuperview().offset(-10)
                }
                nameLabel.isHidden = false
                descLabel.isHidden = true
            case .withNameAndDesc:
                nameLabel.snp.updateConstraints{
                    $0.bottom.equalToSuperview().offset(-25)
                }
                nameLabel.isHidden = false
                descLabel.isHidden = false
            }
        }
    }
    
    
    var model: WriterModel? {
        didSet {
            guard let model = model else { return }
            photoView.kf.setImage(urlString: model.photo,
                                 placeholder: (bounds.width > bounds.height) ? UIImage(named: "normal_placeholder_h") : UIImage(named: "normal_placeholder_v"))
            nameLabel.text = model.name ?? model.name
            descLabel.text = model.description ?? "更新至\(model.name ?? "0")集"
        }
    }
}
