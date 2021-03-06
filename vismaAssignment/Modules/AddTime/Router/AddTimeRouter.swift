//
//  AddTimeRouter.swift
//  vismaAssignment
//
//  Created by hasti on 2/16/20.
//  Copyright © 2020 visma. All rights reserved.
//

import UIKit

class AddTimeRouter {
    weak var view: UIViewController?
    let dataManager: DBDataManager
    
    init(dataManager: DBDataManager) {
        self.dataManager = dataManager
    }
    
    func makeAddTimeViewController(id: String) -> AddTimeViewController {
        let interactor = AddTimeInteractor(dataManager: dataManager, id: id)
        let presenter = AddTimePresenter(interactor: interactor, router: self)
        let viewController = AddTimeViewController(presenter: presenter)
        
        presenter.view = viewController
        self.view = viewController
        interactor.output = presenter
        
        return viewController
    }
    
    func closeAddTimeView() {
        view?.navigationController?.popViewController(animated: true)
    }
}
