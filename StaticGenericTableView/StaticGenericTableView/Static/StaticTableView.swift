//
//  StaticTableView.swift
//  StaticGenericTableView
//
//  Created by Hadevs on 05/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

protocol StaticConstructorContainer {
	associatedtype ModelType
	var models: [ModelType] { get }
	func cellType(for model: ModelType) -> StaticTableViewCellClass.Type
	func configure(cell: UITableViewCell, by model: ModelType)
	func itemSelected(item: ModelType)
}

extension StaticConstructorContainer {
	typealias StaticTableViewCellClass = StaticCell & NibLoadable
	func delegateDataSource() -> StaticDataSourceDelegate<Self> {
		return StaticDataSourceDelegate<Self>.init(container: self)
	}
	
	func setup<T: StaticConstructorContainer>(at tableView: UITableView, dataSource: StaticDataSourceDelegate<T>) {
		models.forEach { (model) in
			let type = cellType(for: model)
			tableView.register(type.nib, forCellReuseIdentifier: type.name)
		}
		
		tableView.delegate = dataSource
		tableView.dataSource = dataSource
		dataSource.tableView = tableView
	}
}

class StaticDataSourceDelegate<Container: StaticConstructorContainer>: NSObject, UITableViewDelegate, UITableViewDataSource {
	private let container: Container
	weak var tableView: UITableView?
	
	init(container: Container) {
		self.container = container
	}
	
	func reload() {
		tableView?.reloadData()
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		let type = container.cellType(for: container.models[indexPath.row])
		return type.estimatedHeight ?? type.height
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let type = container.cellType(for: container.models[indexPath.row])
		return type.height
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return container.models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = container.models[indexPath.row]
		let type = container.cellType(for: model)
		let cell = tableView.dequeueReusableCell(withIdentifier: type.name, for: indexPath)
		
		if let typedCell = cell as? TitledConfigurable, let titled = model as? Titled {
			typedCell.configure(by: titled)
		}
		
		if let typedCell = cell as? SubtitledConfigurable, let subtitle = model as? Subtitled {
			typedCell.configure(by: subtitle)
		}
		
		if let typedCell = cell as? ImagedConfigurable, let imaged = model as? Imaged {
			typedCell.configure(by: imaged)
		}
		
		container.configure(cell: cell, by: model)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let model = container.models[indexPath.row]
		container.itemSelected(item: model)
	}
}
