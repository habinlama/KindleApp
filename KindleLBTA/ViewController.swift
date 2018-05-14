//
//  ViewController.swift
//  KindleLBTA
//
//  Created by Aayush Bajracharya on 5/8/18.
//  Copyright © 2018 Aayush Bajracharya. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    
    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Kindle"
        
        setupBooks()
        fetchbooks()
    }
    
    func fetchbooks() {
        print("Fetching books...")
        if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json"){
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let err = error {
                    print("Failed to fetch external json books: ", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    print(json)
                } catch let jsonError {
                    
                    print("Failed to parse JSON properly: ", jsonError)
                }
                
                
                
            }).resume()
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
//        print(book?.title)
//        return
        
        let layout = UICollectionViewFlowLayout()
        let bookPagerController = BookPagerController(collectionViewLayout: layout)
        
        bookPagerController.book = selectedBook
        
        let navController = UINavigationController(rootViewController: bookPagerController)
        present(navController, animated: true, completion: nil)
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
        
        let book = books?[indexPath.row]
        
        cell.book = book
        
        return cell
        
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = books?.count {
            return count
        }
        return 0
    }
    
    func setupBooks() {
        let page1 = Page(number: 1, text: "This is page 1")
        let page2 = Page(number: 2, text: "This is page 2")
        
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Issacson", image: #imageLiteral(resourceName: "steve_jobs"), pages: pages)
        
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Bercraft", image: #imageLiteral(resourceName: "bill_gates"), pages: [
            Page(number: 1, text: "Page 1"),
            Page(number: 2, text: "Page 2"),
            Page(number: 3, text: "Page 3")
            ])
        
        self.books = [book, book2]
    }
}

}
