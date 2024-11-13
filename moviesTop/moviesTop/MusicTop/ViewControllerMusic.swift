//
//  ViewControllerMusic.swift
//  moviesTop
//
//  Created by BMK on 12.11.2024.
//

import UIKit

struct Song{
    var title:String
    var poster:UIImage
    var description:String
}

class ViewControllerMusic: UIViewController {

    
    
    var songs:[Song] = [
        Song(
            title: "idfc",
            poster: .idfc,
            description: "Good music"
            ),
        
        Song(
            title: "Godzilla",
            poster: .godzilla,
            description: "Eminem is so f fast"
            ),
        
        Song(
            title: "Cinnamon Girl",
            poster: .cinn,
            description: "Lana Del Rey is performing soo good"
            ),
        
        Song(
            title: "Vertigo",
            poster: .vertigo,
            description: "Calm music"
            ),
        
        Song(
            title: "Runaway",
            poster: .runaway,
            description: "Cool music"
            ),
        
        Song(
            title: "Umbrella",
            poster: .umbrella,
            description: "driving song"
            ),
        Song(
            title: "End of begining",
            poster: .end,
            description: "great song"
            ),
        Song(
            title: "Mercy",
            poster: .mercy,
            description: "funnny music"
            ),
        Song(
            title: "Snowman",
            poster: .snowman,
            description: "i have a good memories"
            )
    ]
    
    
    
    @IBOutlet weak var MusicTable: UITableView!
    
    var selectedSong: Song?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        MusicTable.dataSource = self
        MusicTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SecondViewControllerMusic else{
            return
        }
        dest.configureMusic(with: selectedSong)
    }
    
    
}

extension ViewControllerMusic: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
    
extension ViewControllerMusic: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCellMusic
        cell.myButtonMusic.tag = indexPath.row
        cell.myButtonMusic.addTarget(self, action: #selector(doButton), for: .touchUpInside)
        let currentModel = songs[cell.myButtonMusic.tag]
        cell.configureMusic(currentModel)
            return cell
    }
    @objc func doButton(_ sender: UIButton){
        selectedSong = songs[sender.tag]
        performSegue(withIdentifier: "DetailMusic", sender: nil)
    }
}
