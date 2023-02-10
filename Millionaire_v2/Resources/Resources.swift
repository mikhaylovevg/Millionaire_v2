//
//  Resources.swift
//  Millionaire_v2
//
//  Created by Павел Грицков on 10.02.23.
//

import UIKit

/*
 здесь граняться ресурсы проэкста
 к ним будет простой доступ через R.Strings. / R.Images
 */

enum R {
    enum Strings {
        
    }
    
    enum Images {
        
        static let background = "Background"
        
        enum AnswerButton {
            static let blue = "ButtonBlue"
            static let green = "ButtonGreen"
            static let red = "ButtonRed"
            static let violet = "ButtonViolet"
            static let yellow = "ButtonYellow"
        }
        
        enum ClueButton {
            static let callFriend = "CallFriend"
            static let fiftyFifty = "FiftyFifty"
            static let helpAudience = "HelpAudience"
        }
        
        enum GamePlay{
            static let timerSystemImage = "stopwatch.fill"
        }
    }
}
