//
//  BeerTableViewController.swift
//  PUNKBeers
//
//  Created by Heitor Souza on 7/18/17.
//  Copyright © 2017 Heitor Souza. All rights reserved.
//

import UIKit

class BeerTableViewController: UITableViewController {
    
    var dataSource: [Beer] = []
    
    var progress = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dataSource.append(Beer(name: "beer1", ibv: 2.3, imageUrl: "aa"))
        
        progress.center = self.view.center;
        progress.hidesWhenStopped = true;
        progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray;
        view.addSubview(progress)
        progress.startAnimating()
        
        PunkBeerEndpoint.loadBeers(beerPage: 1) { (beers:[Beer]?) in
            if let beers = beers {
                self.dataSource = beers
                self.tableView.reloadData()
                self.progress.stopAnimating()
                
            }
        }
        
        /*self.dataSource.append(Beer(id: 1, name: "a", abv: 1.0, imageUrl: "https://images.punkapi.com/v2/5.png", tagLine: "bb", ibu: 1.0, description: "aa"))*/
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController{
            //vc.product = dataSource[tableView.indexPathForSelectedRow!]
            if tableView.indexPathForSelectedRow != nil{
                vc.selectedBeer = dataSource[tableView.indexPathForSelectedRow!.row]
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        
        let beer  = dataSource[indexPath.row]
        
        cell.name.text = beer.name
        cell.ibv.text = String(beer.abv)
        let url = URL(string: beer.imageUrl)
        let data = try? Data(contentsOf: url!)
        cell.imageUrl.image = UIImage(data: data!)
        

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
