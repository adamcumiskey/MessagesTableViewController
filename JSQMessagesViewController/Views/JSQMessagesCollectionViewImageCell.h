//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSMessagesViewController
//
//
//  The MIT License
//  Copyright (c) 2014 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "JSQMessagesCollectionViewCell.h"

#import "JSQMessagesLabel.h"

/**
 *  The `JSQMessagesCollectionViewCell` is an abstract class that presents the content for a single message data item
 *  when that item is within the collection view’s visible bounds. The layout and presentation
 *  of cells is managed by the collection view and its corresponding layout object.
 */
@interface JSQMessagesCollectionViewImageCell : JSQMessagesCollectionViewCell

/**
 *  Returns the text view of the cell. This text view contains the message body text.
 */
@property (weak, nonatomic, readonly) UIImageView *imageView;

@end
