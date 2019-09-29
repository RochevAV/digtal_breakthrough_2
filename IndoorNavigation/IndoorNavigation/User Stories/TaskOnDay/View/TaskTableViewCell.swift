//
//  TaskTableViewCell.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 29.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: - Private Properties

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var pictureView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: Public Methods

    func condigure(with task: Task, image: UIImage) {
        task.details.forEach { item in
            let detail = UILabel()
            detail.text = item
            stackView.addArrangedSubview(detail)
        }
        titleLabel.text = (titleLabel.text ?? "") + task.identifier
        pictureView.image = image
    }

}
