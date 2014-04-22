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

#import <UIKit/UIKit.h>

#import "JSQMessagesLabel.h"

typedef void (^JSQImageRequestCompletionBlock)(BOOL success, UIImage *image, NSError *error);

@interface JSQMessagesCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic, readonly) JSQMessagesLabel *cellTopLabel;
@property (weak, nonatomic, readonly) JSQMessagesLabel *messageBubbleTopLabel;
@property (weak, nonatomic, readonly) JSQMessagesLabel *cellBottomLabel;

@property (weak, nonatomic, readonly) UITextView *textView;
@property (weak, nonatomic, readonly) UIImageView *imageView;

@property (weak, nonatomic) UIImageView *messageBubbleImageView;
@property (weak, nonatomic) UIImageView *avatarImageView;

#pragma mark - Class methods

+ (UINib *)nib;

+ (NSString *)cellReuseIdentifier;

#pragma mark - Instace methods

- (void)setImageFromURL:(NSURL *)url
      completionHandler:(JSQImageRequestCompletionBlock)completionHandler;

@end
