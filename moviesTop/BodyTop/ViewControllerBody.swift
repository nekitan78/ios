//
//  ViewControllerBody.swift
//  moviesTop
//
//  Created by BMK on 13.11.2024.
//

import UIKit
struct Body{
    var title: String
    var description: String
    var poster:UIImage
}

class ViewControllerBody: UIViewController {
    
    var bodies:[Body] = [
        Body(
            title: "Chris Bumsted",
            description: "Chris Bumstead, also known as 'CBum' is a Canadian IFBB professional bodybuilder known for his classic aesthetics and impressive symmetry. He competes in the Classic Physique division and has won the Mr. Olympia Classic Physique title multiple times (from 2019 to 2024). Bumstead is admired for his vintage, golden-era physique, with a narrow waist, broad shoulders, and well-defined legs, which perfectly embodies the classic bodybuilding look. His disciplined training, humble personality, and massive social media following have made him one of the most popular figures in modern bodybuilding.",
            poster: .chris
            ),
        Body(
            title: "Ronny Coulman",
            description: "Known for his immense size and strength, Ronnie Coleman won Mr. Olympia eight times, tying the record. He is known for his powerful physique and extreme training intensity.",
            poster: .rony
            ),
        Body(
            title: "Arnold Schwarzenegger",
            description: "Perhaps the most famous bodybuilder of all time, Arnold won Mr. Olympia seven times and is known for his aesthetic physique, charisma, and influence on the bodybuilding world. He later became an actor and politician.",
            poster: .arn
        ),
        Body(
            title: "Jay Cutler",
            description: "A four-time Mr. Olympia winner, Cutler was known for his massive build and impressive muscle density, particularly in his legs.",
            poster: .jay
            ),
        Body(
            title: "Dorian Yates",
            description: " Yates, a six-time Mr. Olympia winner, was known for his extremely high intensity training and ushering in the “mass monster” era with his dense, massive physique.",
            poster: .dor
            ),
        Body(
            title: "Phil Heath",
            description: "Known as “The Gift,” Heath won Mr. Olympia seven times, known for his 3D muscle look and symmetry. He is admired for his balanced aesthetics and definition.",
            poster: .phil
            ),
        Body(
            title: "Frank Zane",
            description: "Known for his aesthetic, lean, and symmetrical physique, Zane won Mr. Olympia three times. He is celebrated for his emphasis on proportion and conditioning over sheer size.",
            poster: .frank
            ),
        Body(
            title: "Sergio Oliva",
            description: "Nicknamed “The Myth” for his otherworldly proportions, Oliva won Mr. Olympia three times and was one of the most famous bodybuilders of the 1960s and ’70s.",
            poster: .sergio
            ),
        Body(
            title: "Lou Ferrigno",
            description: "Known for his massive size and role as “The Incredible Hulk” on television, Ferrigno competed in Mr. Olympia and became one of the first bodybuilders to make a significant crossover into mainstream entertainment.",
            poster: .lou
            ),
        Body(
            title: "Lee Haney",
            description: "An eight-time Mr. Olympia champion, Haney was known for his broad shoulders, slim waist, and balanced physique, holding the record for most Mr. Olympia titles alongside Coleman.",
            poster: .lee
            ),
        
    ]
    
    
    @IBOutlet weak var tableBody: UITableView!
    
    
    var selectedBody: Body?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableBody.delegate = self
        tableBody.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SecondViewControllerBody else{
            return
        }
        dest.configureBody(with: selectedBody)
    }

    
    
    
}

extension ViewControllerBody: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewControllerBody: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bodies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCellBody
        cell.bodyButton.tag = indexPath.row
        cell.bodyButton.addTarget(self, action: #selector(bodyB), for: .touchUpInside)
        let currentModel = bodies[cell.bodyButton.tag]
        cell.configureBody(currentModel)
            return cell
        
    }
    
    @objc func bodyB(_ sender: UIButton){
        selectedBody = bodies[sender.tag]
        performSegue(withIdentifier: "DetailBody", sender: nil)
    }
}
