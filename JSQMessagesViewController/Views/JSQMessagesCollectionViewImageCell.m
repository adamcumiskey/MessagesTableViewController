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

#import "JSQMessagesCollectionViewImageCell.h"

#import "JSQMessagesCollectionViewCellIncoming.h"
#import "JSQMessagesCollectionViewCellOutgoing.h"
#import "JSQMessagesCollectionViewLayoutAttributes.h"

#import "UIView+JSQMessages.h"

#import <AFNetworking/UIImageView+AFNetworking.h>


@interface JSQMessagesCollectionViewImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation JSQMessagesCollectionViewImageCell

#pragma mark - Class methods

+ (UINib *)nib
{
    NSAssert(NO, @"ERROR: method must be overridden in subclasses: %s", __PRETTY_FUNCTION__);
    return nil;
}

+ (NSString *)cellReuseIdentifier
{
    NSAssert(NO, @"ERROR: method must be overridden in subclasses: %s", __PRETTY_FUNCTION__);
    return nil;
}

#pragma mark - Initialization

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc
{
    _imageView = nil;
}

#pragma mark - Collection view cell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.cellTopLabel.text = nil;
    self.messageBubbleTopLabel.text = nil;
    self.cellBottomLabel.text = nil;
    
    self.imageView.image = nil;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    
    [self setNeedsUpdateConstraints];
}

#pragma mark - UIResponder

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)becomeFirstResponder
{
    return [super becomeFirstResponder];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:));
}

- (void)copy:(id)sender
{
    [[UIPasteboard generalPasteboard] setImage:self.imageView.image];
    [self resignFirstResponder];
}

@end
