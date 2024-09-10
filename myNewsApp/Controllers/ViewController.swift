//
//  ViewController.swift
//  myNewsApp
//
//  Created by Alikhanov Yelnur on 05.09.2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, NewsModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var newsModel : NewsModel?
    var newsManager = NewsManager()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        newsManager.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: NewTableViewCell.cell)
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(newFetch), userInfo: nil, repeats: true)
    }
    @IBAction func searchPressed(_ sender: UIButton) {
        if let text = searchTextField.text{
            newsManager.fetchNews(requestName: text)
            
        }
    
    }
    
    func newsUpdate(_ newsManager: NewsManager, news: NewsModel) {
        DispatchQueue.main.async{
            
        }
    }
    @objc func newFetch(){
        newsManager.fetchNews(requestName: "everything") { [weak self] newsModel in
            self?.newsModel = newsModel
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.cell, for: indexPath)
        return cell
    }
}

