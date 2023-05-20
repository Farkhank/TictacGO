import UIKit
class ViewController: UIViewController {
    
    var currentPlayer: Int = 1
    var board: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameActive: Bool = true
    
    @IBAction func buttonPressed(_sender: AnyObject) {
                if gameActive {
            let tag = sender.tag
                        if board[tag-1] == 0 {
                     board[tag-1] = currentPlayer

                sender.setTitle(currentPlayer == 1 ? "X" : "O", for: .normal)
                
                if isWinning(player: currentPlayer) {
                    showAlert(message: "Player \(currentPlayer) wins!")
                    gameActive = false
                }

                else if isBoardFull() {
                    showAlert(message: "Game is tied!")
                    gameActive = false
                }
                else {
                    currentPlayer = currentPlayer == 1 ? 2 : 1
                }
            }
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default) { (action) in
            self.restartGame()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func isWinning(player: Int) -> Bool {
        if board[0] == player && board[1] == player && board[2] == player { return true }
        if board[3] == player && board[4] == player && board[5] == player { return true }
        if board[6] == player && board[7] == player && board[8] == player { return true }
        if board[0] == player && board[3] == player && board[6] == player { return true }
        if board[1] == player && board[4] == player && board[7] == player { return true }
        if board[2] == player && board[5] == player && board[8] == player { return true }
        if board[0] == player && board[4] == player && board[8] == player { return true }
        if board[2] == player && board[4] == player && board[6] == player { return true }
        return false
    }

func isBoardFull() -> Bool {
    
    for i in 0..<board.count {
        if board[i] == 0 {
            return false
        }
    }    
    return true
}

	func restartGame() {
    		currentPlayer = 1
    		board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
  		  gameActive = true
    
   		 for i in 1...9 {
       		 if let button = view.viewWithTag(i) as? UIButton {
            	button.setTitle("", for: .normal)
        		}
    		}
 	 }
}
