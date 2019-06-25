//
//  TableViewCell.swift
//  BibliotecaDeFotos
//
//  Created by Rodrigo Vivas on 6/24/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
