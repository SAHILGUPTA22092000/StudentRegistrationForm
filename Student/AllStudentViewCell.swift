//
//  AllStudentViewCell.swift
//  Student
//
//  Created by Sahil Gupta on 19/07/22.
//

import UIKit

class AllStudentViewCell: UITableViewCell {
    
    static let allStudentViewCellIdentifier = "AllStudentViewCell"
    static func nib()->UINib
    {
        return UINib(nibName: "AllStudentViewCell", bundle: nil)
    }
    
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var studentNameDisplayLabel: UILabel!
    
    func allStudentViewCellConfigure(with title : String, imageName : String )
    {
        studentNameDisplayLabel.text=title
        studentImage.image=UIImage(systemName: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        studentImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
