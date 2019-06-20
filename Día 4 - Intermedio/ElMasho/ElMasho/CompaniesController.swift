//
//  CompaniesController.swift
//  SBvsCodeSpeedRun
//
//  Created by Brian Voong on 1/30/18.
//  Copyright © 2018 Lets Build That App. All rights reserved.
//

import UIKit

class CompanyCell: GenericCell<Company> {
    override var item: Company! {
        didSet {
            textLabel?.text = item.name
            nameLabel.text = item.name
            ceoLabel.text = item.ceo
        }
    }
    
    let nameLabel = UILabel()
    let ceoLabel = UILabel()
    override func setupViews() {
        super.setupViews()
        let stackView = UIStackView(arrangedSubviews: [nameLabel, ceoLabel])
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 12, bottom: 0, right: 12))
    }
}

class CompaniesController: GenericTableViewController<CompanyCell, Company> {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Companies"
        //tableView.rowHeight = 50
        items = Company.companies
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employeesController = EmployeesController()
        let company = items[indexPath.item]
        employeesController.company = company
        navigationController?.pushViewController(employeesController, animated: true)
    }
}

class EmployeeCell: GenericCell<Employee> {
    override var item: Employee! {
        didSet {
            textLabel?.text = item.name
        }
    }
}

class EmployeesController: GenericTableViewController<EmployeeCell, Employee> {
    var company: Company! {
        didSet {
            navigationItem.title = company.name
            self.items = company.employees
        }
    }
}








