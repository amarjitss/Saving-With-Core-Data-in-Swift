//
//  MainViewController.swift
//  CoreDataSwift
//
//  Created by amarjit singh on 4/13/16.
//  Copyright © 2016 amarjit singh. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    @IBAction func btnSave(sender: UIButton)
    {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue(txtUserName.text, forKey: "username")
        newUser.setValue(txtPassword.text, forKey: "password")
        
        try! context.save();
        
        print(newUser)
        print("Object Saved")
    }
  
    @IBAction func btnLoad(sender:  UIButton)
    {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let result: NSArray = try context.executeFetchRequest(request)
            
            if(result.count > 0)
            {
                for res in result
                {
                    print(res)
                }
            }else
            {
                print("0 results returned. Potential ERROR!")
            }
        }catch
        {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
