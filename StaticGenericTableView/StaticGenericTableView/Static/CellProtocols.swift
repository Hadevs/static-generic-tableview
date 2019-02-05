//
//  CellProtocols.swift
//  StaticGenericTableView
//
//  Created by Hadevs on 05/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

protocol Fonted {
	var font: UIFont? { get }
}

protocol FontedConfigurable {
	func configure(by model: Fonted)
}

protocol Titled {
	var title: String? { get }
}

protocol TitledConfigurable {
	func configure(by model: Titled)
}

protocol Subtitled {
	var subtitle: String? { get }
}

protocol SubtitledConfigurable {
	func configure(by model: Subtitled)
}

protocol Imaged {
	var image: UIImage? { get }
}

protocol ImagedConfigurable {
	func configure(by model: Imaged)
}
