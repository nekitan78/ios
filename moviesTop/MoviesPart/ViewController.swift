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
            description: "Back to the Future is a 1985 American science fiction film directed by Robert Zemeckis and written by Zemeckis and Bob Gale. It stars Michael J. Fox, Christopher Lloyd, Lea Thompson, Crispin Glover, and Thomas F. Wilson. Set in 1985, it follows Marty McFly (Fox), a teenager accidentally sent back to 1955 in a time-traveling DeLorean automobile built by his eccentric scientist friend Emmett Doc Brown (Lloyd), where he inadvertently prevents his future parents from falling in love – threatening his own existence – and is forced to reconcile them and somehow get back to the future."
            ),
        
        Movie(
            title: "interstellar",
            poster: .int,
            description: "Interstellar is a 2014 epic science fiction drama film directed by Christopher Nolan, who co-wrote the screenplay with his brother Jonathan. It stars Matthew McConaughey, Anne Hathaway, Jessica Chastain, Bill Irwin, Ellen Burstyn, Matt Damon, and Michael Caine. Set in a dystopian future where Earth is suffering from catastrophic blight and famine, the film follows a group of astronauts who travel through a wormhole near Saturn in search of a new home for mankind."
            ),
        
        Movie(
            title: "the judge",
            poster: .judge,
            description: "The Judge is a 2014 American legal drama film directed by David Dobkin.[2] The film stars Robert Downey Jr. and Robert Duvall with Vera Farmiga, Vincent D'Onofrio, Jeremy Strong, Dax Shepard and Billy Bob Thornton in supporting roles.[2] The film was released in the United States on October 10, 2014. It received mixed reviews; critics praised the performances of Duvall and Downey and Thomas Newman's score. However, they criticized the formulaic nature of its script and the lack of development for supporting characters."
            ),
        
        Movie(
            title: "The matrix",
            poster: .matrix,
            description: "The Matrix is a 1999 science fiction action film[5][6] written and directed by the Wachowskis.[a] It is the first installment in the Matrix film series, starring Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving, and Joe Pantoliano, and depicts a dystopian future in which humanity is unknowingly trapped inside the Matrix, a simulated reality that intelligent machines have created to distract humans while using their bodies as an energy source.[7] When computer programmer Thomas Anderson, under the hacker alias Neo, uncovers the truth, he joins a rebellion against the machines along with other people who have been freed from the Matrix."
            ),
        
        Movie(
            title: "The godFather",
            poster: .godFather,
            description: "The Godfather is a 1972 American epic gangster film[2] directed by Francis Ford Coppola, who co-wrote the screenplay with Mario Puzo, based on Puzo's best-selling 1969 novel. The film stars an ensemble cast including Marlon Brando, Al Pacino, James Caan, Richard Castellano, Robert Duvall, Sterling Hayden, John Marley, Richard Conte and Diane Keaton. It is the first installment in The Godfather trilogy, chronicling the Corleone family under patriarch Vito Corleone (Brando) from 1945 to 1955. It focuses on the transformation of his youngest son, Michael Corleone (Pacino), from reluctant family outsider to ruthless mafia boss."
            ),
        
        Movie(
            title: "Inception",
            poster: .inception,
            description: "Inception is a 2010 science fiction action heist film[4][5][6][7] written and directed by Christopher Nolan, who also produced it with Emma Thomas, his wife. The film stars Leonardo DiCaprio as a professional thief who steals information by infiltrating the subconscious of his targets. He is offered a chance to have his criminal history erased as payment for the implantation of another person's idea into a target's subconscious.[8] The ensemble cast includes Ken Watanabe, Joseph Gordon-Levitt, Marion Cotillard, Elliot Page,[a] Tom Hardy, Cillian Murphy, Tom Berenger, Dileep Rao, and Michael Caine."
            ),
        Movie(
            title: "The dark Knight",
            poster: .batman,
            description: "The Dark Knight is a 2008 superhero film directed by Christopher Nolan, from a screenplay co-written with his brother Jonathan. Based on the DC Comics superhero Batman, it is the sequel to Batman Begins (2005), and the second installment in The Dark Knight trilogy. The plot follows the vigilante Batman, police lieutenant James Gordon, and district attorney Harvey Dent, who form an alliance to dismantle organized crime in Gotham City. Their efforts are derailed by the Joker, an anarchistic mastermind who seeks to test how far Batman will go to save the city from chaos. The ensemble cast includes Christian Bale, Michael Caine, Heath Ledger, Gary Oldman, Aaron Eckhart, Maggie Gyllenhaal, and Morgan Freeman."
            ),
        Movie(
            title: "White Chicks",
            poster: .whiteChicks,
            description: "White Chicks is a 2004 American buddy cop crime comedy film directed by Keenen Ivory Wayans from a screenplay co-written by Wayans, Xavier Cook, Andy McElfresh, Michael Anthony Snowden, with additional contributions by and starring Marlon Wayans and Shawn Wayans. It also stars Jaime King, Frankie Faison, Lochlyn Munro, and John Heard. In the film, two black male FBI agents go undercover as white women by using whiteface to protect two hotel heiresses from a kidnapping plot targeting socialites."
            ),
        Movie(
            title: "Fight club",
            poster: .fight,
            description: "Fight Club is a 1999 American film directed by David Fincher and starring Brad Pitt, Edward Norton, and Helena Bonham Carter. It is based on a 1996 novel by Chuck Palahniuk. Norton plays the unnamed narrator, who is discontented with his white-collar job. He forms a fight club with soap salesman Tyler Durden (Pitt) and becomes embroiled in a relationship with an impoverished but beguilingly attractive woman, Marla Singer (Bonham Carter)."
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.myButton.tag = indexPath.row
        cell.myButton.addTarget(self, action: #selector(doButton), for: .touchUpInside)
        let currentModel = movies[cell.myButton.tag]
        cell.configure(currentModel)
            return cell
    }
    
    @objc func doButton(_ sender: UIButton){
        selectedMovie = movies[sender.tag]
        performSegue(withIdentifier: "Detail", sender: nil)
    }
}


