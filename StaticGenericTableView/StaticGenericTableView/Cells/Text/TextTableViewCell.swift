//
//  TextTableViewCell.swift
//  StaticGenericTableView
//
//  Created by Hadevs on 05/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell, StaticCell, NibLoadable {
	static var height: CGFloat = 44
	
	@IBOutlet private weak var label: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
}

extension TextTableViewCell: TitledConfigurable {
	func configure(by model: Titled) {
		label.text = model.title
	}
}
