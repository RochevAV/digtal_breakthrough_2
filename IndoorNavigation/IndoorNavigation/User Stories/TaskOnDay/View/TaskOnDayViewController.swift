//
//  TaskOnDayViewController.swift
//  IndoorNavigation
//
//  Created by Rochev Studio on 28/09/2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import UIKit

final class TaskOnDayViewController: UIViewController, ModuleTransitionable {

    // MARK: - Constants

    private enum Constants {
        static let countSection = 1
        static let cellIdentfier = "TasksCell"
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: TaskOnDayViewOutput?

    // MARK: Private Properties

    private var tasks = [Task]()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = [
            Task(identifier: "со склада 2", details: ["Большой болт", "Зайди к Васе","Верни отвертку","Ящик с молотками"]),
            Task(identifier: "со склада 5", details: ["Сегодня работает до 20:00", "Подготовься к хаХатону","Отвертку так и не вернул","Микросхемки"]),
            Task(identifier: "со склада 1", details: ["Большой болт", "Зайди к Васе","Верни отвертку","Ящик с молотками"]),
            Task(identifier: "бытовка 2", details: ["Большой болт", "Зайди к Васе","Верни отвертку","Ящик с молотками"]),
            Task(identifier: "С-1Б5", details: ["Большой болт", "Зайди к Васе","Верни отвертку","Ящик с молотками"])]
        output?.viewDidLoad()
    }

    // MARK: - Private Methods

    private func configureAppearance() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentfier)
        navigationItem.title = "Дела на сегодня"
    }

}

// MARK: - TaskOnDayViewInput

extension TaskOnDayViewController: TaskOnDayViewInput {

    func update(with tasks: Tasks) {
        tableView.reloadData()
    }

}

// MARK: - UITableViewDelegate

extension TaskOnDayViewController: UITableViewDelegate {

}

// MARK: - UITableViewDataSource

extension TaskOnDayViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        let image: UIImage
        if indexPath.row == 1 {
            image = Asset._1.image
        } else if indexPath.row == 2 {
            image = Asset._2.image
        } else {
            image = Asset._3.image
        }
        cell.condigure(with: tasks[indexPath.row], image: image)
        return cell
    }
}
