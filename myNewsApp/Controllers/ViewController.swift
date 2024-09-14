//
//  ViewController.swift
//  myNewsApp
//
//  Created by Alikhanov Yelnur on 05.09.2024.
//

import UIKit
import SafariServices
class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    var query = ""
    var newsData : NewsData?
    var newsManager = NewsManager()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: NewTableViewCell.cell)
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(newFetch), userInfo: nil, repeats: false)
        tableView.rowHeight = 140
    }
    @IBAction func searchPressed(_ sender: UIButton) {
        if let text = searchTextField.text{
            query = text
            newsManager.fetchNews(requestName: query) { [weak self] newsData in
                self?.newsData = newsData
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            
            
        }
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text{
            query = text
            newsManager.fetchNews(requestName: query) { [weak self] newsData in
                self?.newsData = newsData
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    @objc func newFetch(){
        newsManager.fetchNews(requestName: "everything") { [weak self] newsData in
            self?.newsData = newsData
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.cell, for: indexPath) as! NewTableViewCell
        if let article = newsData?.articles[indexPath.row] {
            cell.titleLabel.text = article.title
            if let imageURL = article.urlToImage{
                cell.setImage(urlString: imageURL)
            }
            else{
                cell.newsImage.image = UIImage(named: "placeholder")
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let articles = newsData?.articles[indexPath.row], let url = URL(string: articles.url!){
             let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true)
            
        }
    }
}

