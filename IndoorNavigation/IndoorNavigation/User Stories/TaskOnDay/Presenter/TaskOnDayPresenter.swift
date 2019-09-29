//
//  TaskOnDayPresenter.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

final class TaskOnDayPresenter: TaskOnDayModuleInput {

    // MARK: - Properties

    weak var view: TaskOnDayViewInput?
    var router: TaskOnDayRouterInput?
    var output: TaskOnDayModuleOutput?

    // MARK: - Private Properties

    var taskService = TaskService()

    // MARK: - TaskOnDayViewOutput

}

// MARK: - TaskOnDayViewOutput

extension TaskOnDayPresenter: TaskOnDayViewOutput {

    func viewDidLoad() {

        taskService.getTasks()
        .onCompleted { tasks in

        }
    }

    func selected(task: Task) {

    }
}
