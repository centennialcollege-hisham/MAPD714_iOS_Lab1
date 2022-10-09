//
//  SwitchingViewController.swift
//  switchview
//
//  Created by Hisham Sanimeh on 09/10/2022.
//

import UIKit


class SwitchingViewController: UIViewController {
    
 
    var blueViewController: BlueViewController!
    var yellowViewController: YellowViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add First story board
        blueViewController =
            storyboard?.instantiateViewController(withIdentifier: "BlueScreen")
            as! BlueViewController

            blueViewController.view.frame = view.frame
            switchViewController(from: nil, to: blueViewController)
            // helper method to navigate
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        // switch button clicked
        if yellowViewController?.view.superview == nil {
                if yellowViewController == nil {
                    yellowViewController =
                        storyboard?.instantiateViewController(withIdentifier: "YellowScreen")
                        as? YellowViewController
                }
            } else if blueViewController?.view.superview == nil {
                if blueViewController == nil {
                    blueViewController =
                        storyboard?.instantiateViewController(withIdentifier: "BlueScreen")
                        as? BlueViewController
                }
            }
        
            UIView.beginAnimations("View Flip", context: nil)
            UIView.setAnimationDuration(0.4)
            UIView.setAnimationCurve(.easeInOut)
            
            // Switch view controllers
            if blueViewController != nil
                && blueViewController!.view.superview != nil {
                UIView.setAnimationTransition(.flipFromRight,
                                                          for: view, cache: true)
                yellowViewController.view.frame = view.frame
                switchViewController(from: blueViewController,
                                     to: yellowViewController)
            } else {
                UIView.setAnimationTransition(.flipFromLeft,
                                                          for: view, cache: true)
                blueViewController.view.frame = view.frame
                switchViewController(from: yellowViewController,
                                     to: blueViewController)
            }
            UIView.commitAnimations()
        }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
            
            if blueViewController != nil
                && blueViewController!.view.superview == nil {
                blueViewController = nil
            }
            if yellowViewController != nil
                && yellowViewController!.view.superview == nil {
                yellowViewController = nil
            }
        }
    
    private func switchViewController(from fromVC:UIViewController?,
                                          to toVC:UIViewController?) {
            if fromVC != nil {
                fromVC!.willMove(toParent: nil)
                fromVC!.view.removeFromSuperview()
                fromVC!.removeFromParent()
            }
            
            if toVC != nil {
                self.addChild(toVC!)
                self.view.insertSubview(toVC!.view, at: 0)
                toVC!.didMove(toParent: self)
            }
        }
    

}
