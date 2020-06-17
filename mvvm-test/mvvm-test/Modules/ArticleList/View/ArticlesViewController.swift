//
//  ArticlesViewController.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import UIKit

final class ArticlesViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    private let viewModel = ArticlesViewModel(client: ArtliclesListClient())
    private var blogs: [BlogUserRepresentableModel] = []
    private var isFetchingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.estimatedRowHeight = 250.0
        getBlogs()
    }
    
    private func getBlogs() {
        viewModel.getArticles { [weak self] (blogs, error) in
            guard let welf = self else { return }
            welf.isFetchingMore = false
            if let articles = blogs {
                DispatchQueue.main.async {
                    welf.blogs.append(contentsOf: articles)
                    welf.tableview.reloadData()
                }
            } else {
                //error
                debugPrint(error?.localizedDescription)
            }
        }
    }
    
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ArticleTableViewCell.self), for: indexPath) as! ArticleTableViewCell
        
        cell.populateCell(blogs[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex && !isFetchingMore {
            let spinner = UIActivityIndicatorView(style: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            
            tableView.tableFooterView = spinner
            tableView.tableFooterView?.isHidden = false
            isFetchingMore = true
            viewModel.currentPage = viewModel.currentPage + 1
            getBlogs()
        }
    }
}
