//
//  CatalogViewController.swift
//
//  Created by Filip Gulan on 01/02/2019.
//  Copyright (c) 2019 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CatalogViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: CatalogPresenterInterface!
    
    // MARK: - Private properties -
    
    private lazy var tableView: UITableView = createTableView()
    
    private lazy var tableDataSource: TableDataSourceDelegate = {
        return TableDataSourceDelegate(tableView: tableView)
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure()
    }
	
}

// MARK: - Extensions -

extension CatalogViewController: CatalogViewInterface {
}

private extension CatalogViewController {
    
    func setupUI() {
        title = "Catalog"
    }
    
    func configure() {
        tableView.registerClass(cellOfType: CatalogItemTableViewCell.self)
        tableDataSource.sections = presenter.sections()
    }
    
    func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.pinToSuperview()
        
        return tableView
    }
    
}
