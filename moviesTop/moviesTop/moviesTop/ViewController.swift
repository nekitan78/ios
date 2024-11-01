//
//  ViewController.swift
//  moviesTop
//
//  Created by Student on 01.11.2024.
//

import UIKit

struct Movie{
    var title:String
    var poster:UIImage
    var description:String
}

class ViewController: UIViewController {
    
    
    
    var movies:[Movie] = [
        Movie(
            title: "Back",
            poster: .bCK,
            description: "oaoaoao"
            ),
        
        Movie(
            title: "interstellar",
            poster: .int,
            description: "ocsdfdfdfo"
            ),
        
        Movie(
            title: "the judge",
            poster: .judge,
            description: "oaoaodsdfsfdsfdfao"
            )
    ]
    
    
    
    
    
    

    
    @IBOutlet weak var tablePoster: UITableView!
    
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablePoster.dataSource = self
        tablePoster.delegate = self
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SecondViewController else{
            return
        }
        dest.configure(with: selectedMovie)
    }

    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "Detail", sender: nil)

    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        let currentModel = movies[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}


