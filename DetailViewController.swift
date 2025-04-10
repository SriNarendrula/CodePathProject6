//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Sri Narendrula on 4/9/25.
//

import Foundation
import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    // Store the post passed from the main view controller
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make sure the post has been set before trying to configure the UI
        guard post != nil else {
            print("Error: Post not set before detail view loaded")
            return
        }
        
        // Configure UI with post data
        configureUI()
    }
    
    private func configureUI() {
        // Set navigation title to the summary
        title = "Blog Posts"
        
        // Set caption text (removing HTML tags)
        captionTextView.text = post.caption.trimHTMLTags()
        
        // Make sure the text view is not editable
        captionTextView.isEditable = false
        
        // Load the image using Nuke if available
        if let photo = post.photos.first {
            let url = photo.originalSize.url
            Nuke.loadImage(with: url, into: postImageView)
        }
    }
}
