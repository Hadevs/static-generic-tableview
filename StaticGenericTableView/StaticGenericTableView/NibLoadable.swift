//
//  NibLoadable.swift
//  StaticGenericTableView
//
//  Created by Hadevs on 05/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

public extension NibLoadable {
	static var name: String {
		return String(describing: self)
	}
}
public protocol NibLoadable: class {
	static var nib: UINib { get }
}

public extension NibLoadable {
	static var nib: UINib {
		return UINib(nibName: String(describing: self), bundle: nil)
	}
}

public extension NibLoadable where Self: UIView {
	static func loadFromNib() -> Self {
		guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
			fatalError("The nib \(nib) expected its root view to be of type \(self)")
		}
		return view
	}
}
