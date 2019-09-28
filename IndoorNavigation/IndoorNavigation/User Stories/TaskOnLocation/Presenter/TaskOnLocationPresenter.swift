//
//  TaskOnLocationPresenter.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

final class TaskOnLocationPresenter: TaskOnLocationViewOutput, TaskOnLocationModuleInput {

    // MARK: - Properties

    weak var view: TaskOnLocationViewInput?
    var router: TaskOnLocationRouterInput?
    var output: TaskOnLocationModuleOutput?

    // MARK: - TaskOnLocationViewOutput

    // MARK: - TaskOnLocationModuleInput

}
