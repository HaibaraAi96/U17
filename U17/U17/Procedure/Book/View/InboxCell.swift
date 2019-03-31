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

class InboxCell: UBaseTableViewCell {
    // photo circle
    public lazy var photoView: UIImageView = {
        let photoView = UIImageView()
        photoView.contentMode = .scaleAspectFit
        photoView.layer.borderWidth = 1
        photoView.layer.masksToBounds = false
        photoView.layer.borderColor = UIColor.yellow.cgColor
        photoView.layer.cornerRadius = self.frame.width / 2
        photoView.clipsToBounds = true
        return photoView
    }()
    
    // writer name
    public lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        return nameLabel
    }()
    
    // writer description
    public lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = UIColor.black
        descLabel.font = UIFont.systemFont(ofSize: 14)
        return descLabel
    }()
    
    override func configUI() {
        clipsToBounds = true
        
        contentView.addSubview(photoView)
        photoView.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.height.equalTo(25)
            $0.left.equalTo(photoView.snp.right).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.top.equalTo(nameLabel.snp.bottom).offset(15)
            $0.left.equalTo(photoView.snp.right).offset(20)
        }
    }
    
    var style: UIWriterCellStyle = .withNameAndDesc {
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
