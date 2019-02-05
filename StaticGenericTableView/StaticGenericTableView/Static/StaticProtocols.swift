//
//  StaticProtocols.swift
//  StaticGenericTableView
//
//  Created by Hadevs on 05/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

protocol StaticCell: StaticTableViewItem {
}

@objc protocol StaticTableViewItem {
	static var height: CGFloat { get }
	@objc optional static var estimatedHeight: CGFloat { get }
}

protocol StaticTableViewConstructorDelegate: class {
	associatedtype ModelType
	
	func itemSelected(item: ModelType)
}
