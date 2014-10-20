//
//  TTTImageView.swift
//  tictactoe
//
//  Created by Wilson Burhan on 10/17/14.
//  Copyright (c) 2014 Wilson Burhan. All rights reserved.
//

import UIKit

class TTTImageView: UIImageView {
    
    var player:String?
    var activated:Bool = false
    
    func setPlayer(_player:String){
        self.player = _player;
        
        if activated == false{
            if _player == "X" {
                self.image = UIImage(named: "X")
            }
            else{
                self.image = UIImage(named: "O")
            }
            activated = true
        }
    }
   
}
