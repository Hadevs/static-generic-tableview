//
//  ViewControllerCellModel.swift
//  StaticGenericTableView
//
//  Created by Hadevs on 05/02/2019.
//  Copyright © 2019 Hadevs. All rights reserved.
//

import Foundation

enum CellModel: Titled {
	case firstText
	case emptyMiddle
	case secondText
	
	var title: String? {
		switch self {
		case .firstText: return "Я - первый"
		case .secondText: return "Я - второй"
		default: return nil
		}
	}
}
