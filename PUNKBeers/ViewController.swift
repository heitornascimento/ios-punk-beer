//
//  ViewController.swift
//  PUNKBeers
//
//  Created by Heitor Souza on 7/18/17.
//  Copyright © 2017 Heitor Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var tagLine: UILabel!
    
    
    @IBOutlet weak var beerDescription: UILabel!
    
    
    @IBOutlet weak var abv: UILabel!
    
    

    @IBOutlet weak var ibu: UILabel!
    
    
    
    @IBOutlet weak var beerLogo: UIImageView!
   
    
    var selectedBeer: Beer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = selectedBeer.name;
        tagLine.text = selectedBeer.tagLine;
        beerDescription.text = selectedBeer.description;
        ibu.text = String(selectedBeer.ibu)
        abv.text = String(selectedBeer.abv)
        
        let url = URL(string: selectedBeer.imageUrl)
        let data = try? Data(contentsOf: url!)
        beerLogo.image = UIImage(data: data!)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

