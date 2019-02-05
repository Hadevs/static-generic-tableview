//
//  ViewController.swift
//  StaticGenericTableView
//
//  Created by Hadevs on 05/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	private let tableView: UITableView = {
		let tableView = UITableView()
		return tableView
	}()
	
	private let constructor = ViewControllerConstructor()
	private lazy var delegateDataSource = constructor.delegateDataSource()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addTableView()
		view.backgroundColor = .white
		constructor.setup(at: tableView, dataSource: delegateDataSource)
	}
	
	private func addTableView() {
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tableView)
		tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
	}
}

