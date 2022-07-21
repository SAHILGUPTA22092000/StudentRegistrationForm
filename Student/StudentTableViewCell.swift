//
//  AllStudentViewCell.swift
//  Student
//
//  Created by Sahil Gupta on 19/07/22.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    static let studentTableViewCellIdentifier = "StudentTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StudentTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    func cellConfigure(with title : String, imageName : String ) {
        nameLbl.text = title
        studentImageView.image = UIImage(systemName: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        studentImageView.contentMode = .scaleAspectFill
    }
}
