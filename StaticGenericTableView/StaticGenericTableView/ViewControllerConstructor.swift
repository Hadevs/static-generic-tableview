//
//  ViewControllerConstructor.swift
//  StaticGenericTableView
//
//  Created by Hadevs on 05/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class ViewControllerConstructor: StaticConstructorContainer {
	typealias ModelType = CellModel
	
	var models: [CellModel] = [.firstText, .emptyMiddle, .secondText]
	
	func cellType(for model: CellModel) -> StaticTableViewCellClass.Type {
		switch model {
		case .emptyMiddle: return EmptyTableViewCell.self
		case .firstText, .secondText: return TextTableViewCell.self
		}
	}
	
	func configure(cell: UITableViewCell, by model: CellModel) {
		cell.selectionStyle = .none
	}
	
	func itemSelected(item: CellModel) {
		switch item {
		case .emptyMiddle: print("Нажата средняя ячейка")
		default: print("Нажата другая ячейка...")
		}
	}
}
