//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import <Foundation/Foundation.h>

/**
 *  The `JSQMessageData` protocol defines the common interface through 
 *  which `JSQMessagesViewController` and `JSQMessagesCollectionView` interacts with message model objects.
 *
 *  It declares the required and optional methods that a class must implement so that instances of that class 
 *  can be displayed properly with a `JSQMessagesCollectionViewCell`.
 */
@protocol JSQMessageData <NSObject>

@required

/**
 *  @return The body text of the message. 
 *  @warning You must not return `nil` from this method.
 */
- (NSString *)text;

/**
 *  @return The name of the user who sent the message.
 *  @warning You must not return `nil` from this method.
 */
- (NSString *)sender;

/**
 *  @return The date that the message was sent.
 *  @warning You must not return `nil` from this method.
 */
- (NSDate *)date;

/**
 *  @return Preview image to display in the input text view with the NSTextAttachment
 */
- (UIImage *)mediaAttachmentPreview;

/**
 *  @return The view to display in the message bubble
 */
- (UIView *)mediaPreview;

/** 
 *  @return The URL of the media
 */
- (NSURL *)mediaURL;

- (UIImage *)image;

@optional

/**
 * @return The size of the image to be displayed
 */
- (CGSize)imageSize;

@end
