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

#import "JSQMessagesCollectionViewCellIncoming.h"
#import "JSQMessagesCollectionViewCellOutgoing.h"
#import "JSQMessagesCollectionViewLayoutAttributes.h"

#import "UIView+JSQMessages.h"

#import <AFNetworking/UIImageView+AFNetworking.h>


@interface JSQMessagesCollectionViewCell ()

@property (weak, nonatomic) IBOutlet JSQMessagesLabel *cellTopLabel;
@property (weak, nonatomic) IBOutlet JSQMessagesLabel *messageBubbleTopLabel;
@property (weak, nonatomic) IBOutlet JSQMessagesLabel *cellBottomLabel;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIView *messageBubbleContainerView;
@property (weak, nonatomic) IBOutlet UIView *avatarContainerView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewTopVerticalSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewBottomVerticalSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewAvatarHorizontalSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewMarginHorizontalSpaceConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewTopVerticalSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewBottomVerticalSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewAvatarHorizontalSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewMarginHorizontalSpaceConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellTopLabelHeightContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageBubbleTopLabelHeightContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellBottomLabelHeightContraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatarContainerViewWidthContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatarContainerViewHeightContraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageBubbleLeftRightMarginConstraint;

@property (assign, nonatomic) UIEdgeInsets textViewFrameInsets;
@property (assign, nonatomic) UIEdgeInsets imageViewFrameInsets;

@property (assign, nonatomic) CGSize avatarViewSize;

@end



@implementation JSQMessagesCollectionViewCell

#pragma mark - Class methods

+ (UINib *)nib
{
    return nil;
}

+ (NSString *)cellReuseIdentifier
{
    return nil;
}

#pragma mark - Initialization

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.backgroundColor = [UIColor whiteColor];
    
    self.cellTopLabelHeightContraint.constant = 0.0f;
    self.messageBubbleTopLabelHeightContraint.constant = 0.0f;
    self.cellBottomLabelHeightContraint.constant = 0.0f;
    
    self.avatarViewSize = CGSizeZero;
    
    self.cellTopLabel.textAlignment = NSTextAlignmentCenter;
    self.cellTopLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    self.cellTopLabel.textColor = [UIColor lightGrayColor];
    
    self.messageBubbleTopLabel.font = [UIFont systemFontOfSize:12.0f];
    self.messageBubbleTopLabel.textColor = [UIColor lightGrayColor];
    
    self.cellBottomLabel.font = [UIFont systemFontOfSize:11.0f];
    self.cellBottomLabel.textColor = [UIColor lightGrayColor];
    
    self.textView.textColor = [UIColor blackColor];
    self.textView.editable = NO;
    self.textView.selectable = YES;
    self.textView.userInteractionEnabled = YES;
    self.textView.dataDetectorTypes = UIDataDetectorTypeNone;
    self.textView.showsHorizontalScrollIndicator = NO;
    self.textView.showsVerticalScrollIndicator = NO;
    self.textView.scrollEnabled = NO;
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.contentInset = UIEdgeInsetsZero;
    self.textView.scrollIndicatorInsets = UIEdgeInsetsZero;
    self.textView.contentOffset = CGPointZero;
}

#pragma mark - Collection view cell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.cellTopLabel.text = nil;
    self.messageBubbleTopLabel.text = nil;
    self.cellBottomLabel.text = nil;
    
    self.textView.text = nil;
    self.imageView.image = nil;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    
    JSQMessagesCollectionViewLayoutAttributes *customAttributes = (JSQMessagesCollectionViewLayoutAttributes *)layoutAttributes;
    
    self.textView.font = customAttributes.messageBubbleFont;
    self.messageBubbleLeftRightMarginConstraint.constant = customAttributes.messageBubbleLeftRightMargin;
    self.textViewFrameInsets = customAttributes.textViewFrameInsets;
    self.textView.textContainerInset = customAttributes.textViewTextContainerInsets;
    self.imageViewFrameInsets = customAttributes.imageViewFrameInsets;
    self.cellTopLabelHeightContraint.constant = customAttributes.cellTopLabelHeight;
    self.messageBubbleTopLabelHeightContraint.constant = customAttributes.messageBubbleTopLabelHeight;
    self.cellBottomLabelHeightContraint.constant = customAttributes.cellBottomLabelHeight;
    
    if ([self isKindOfClass:[JSQMessagesCollectionViewCellIncoming class]]) {
        self.avatarViewSize = customAttributes.incomingAvatarViewSize;
    }
    else if ([self isKindOfClass:[JSQMessagesCollectionViewCellOutgoing class]]) {
        self.avatarViewSize = customAttributes.outgoingAvatarViewSize;
    }
    
    [self setNeedsUpdateConstraints];
}

#pragma mark - Setters

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    
    self.cellTopLabel.backgroundColor = backgroundColor;
    self.messageBubbleTopLabel.backgroundColor = backgroundColor;
    self.cellBottomLabel.backgroundColor = backgroundColor;
    
    self.messageBubbleImageView.backgroundColor = backgroundColor;
    self.avatarImageView.backgroundColor = backgroundColor;
    
    self.messageBubbleContainerView.backgroundColor = backgroundColor;
    self.avatarContainerView.backgroundColor = backgroundColor;
}

- (void)setMessageBubbleImageView:(UIImageView *)messageBubbleImageView
{
    if (_messageBubbleImageView) {
        [_messageBubbleImageView removeFromSuperview];
    }
    
    if (!messageBubbleImageView) {
        _messageBubbleImageView = nil;
        return;
    }
    
    messageBubbleImageView.frame = CGRectMake(0.0f,
                                              0.0f,
                                              CGRectGetWidth(self.messageBubbleContainerView.bounds),
                                              CGRectGetHeight(self.messageBubbleContainerView.bounds));
    
    [messageBubbleImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.messageBubbleContainerView insertSubview:messageBubbleImageView belowSubview:self.textView];
    [self.messageBubbleContainerView jsq_pinAllEdgesOfSubview:messageBubbleImageView];
    [self setNeedsUpdateConstraints];
    
    _messageBubbleImageView = messageBubbleImageView;
}

- (void)setAvatarImageView:(UIImageView *)avatarImageView
{
    if (_avatarImageView) {
        [_avatarImageView removeFromSuperview];
    }
    
    if (!avatarImageView) {
        self.avatarViewSize = CGSizeZero;
        _avatarImageView = nil;
        self.avatarContainerView.hidden = YES;
        return;
    }
    
    self.avatarContainerView.hidden = NO;
    self.avatarViewSize = CGSizeMake(CGRectGetWidth(avatarImageView.bounds), CGRectGetHeight(avatarImageView.bounds));
    
    [avatarImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.avatarContainerView addSubview:avatarImageView];
    [self.avatarContainerView jsq_pinAllEdgesOfSubview:avatarImageView];
    [self setNeedsUpdateConstraints];
    
    _avatarImageView = avatarImageView;
}

- (void)setImageViewFromURL:(NSURL *)url
          completionHandler:(JSQImageRequestCompletionBlock)completionHandler
{
    [_imageView setImageWithURLRequest:[NSURLRequest requestWithURL:url]
                      placeholderImage:nil
                               success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                   [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
                                   [self setNeedsUpdateConstraints];
                                   completionHandler(YES, image, nil);
                               }
                               failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                   completionHandler(NO, nil, error);
                               }];
}

- (void)setAvatarViewSize:(CGSize)avatarViewSize
{
    self.avatarContainerViewWidthContraint.constant = avatarViewSize.width;
    self.avatarContainerViewHeightContraint.constant = avatarViewSize.height;
    [self setNeedsUpdateConstraints];
}

- (void)setTextViewFrameInsets:(UIEdgeInsets)textViewFrameInsets
{
    self.textViewTopVerticalSpaceConstraint.constant = textViewFrameInsets.top;
    self.textViewBottomVerticalSpaceConstraint.constant = textViewFrameInsets.bottom;
    self.textViewAvatarHorizontalSpaceConstraint.constant = textViewFrameInsets.right;
    self.textViewMarginHorizontalSpaceConstraint.constant = textViewFrameInsets.left;
    [self setNeedsUpdateConstraints];
}

- (void)setImageViewFrameInsets:(UIEdgeInsets)imageViewFrameInsets
{
    self.imageViewTopVerticalSpaceConstraint.constant = imageViewFrameInsets.top;
    self.imageViewBottomVerticalSpaceConstraint.constant = imageViewFrameInsets.bottom;
    self.imageViewAvatarHorizontalSpaceConstraint.constant = imageViewFrameInsets.right;
    self.imageViewMarginHorizontalSpaceConstraint.constant = imageViewFrameInsets.left;
    [self setNeedsUpdateConstraints];
}

#pragma mark - Getters

- (CGSize)avatarViewSize
{
    return CGSizeMake(self.avatarContainerViewWidthContraint.constant,
                      self.avatarContainerViewHeightContraint.constant);
}

- (UIEdgeInsets)textViewFrameInsets
{
    return UIEdgeInsetsMake(self.textViewTopVerticalSpaceConstraint.constant,
                            self.textViewMarginHorizontalSpaceConstraint.constant,
                            self.textViewBottomVerticalSpaceConstraint.constant,
                            self.textViewAvatarHorizontalSpaceConstraint.constant);
}

- (UIEdgeInsets)imageViewFrameInsets
{
    return UIEdgeInsetsMake(self.imageViewTopVerticalSpaceConstraint.constant,
                            self.imageViewMarginHorizontalSpaceConstraint.constant,
                            self.imageViewBottomVerticalSpaceConstraint.constant,
                            self.imageViewAvatarHorizontalSpaceConstraint.constant);
}

@end
