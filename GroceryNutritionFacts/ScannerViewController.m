//
//  ScannerViewController.m
//  GroceryNutritionFacts
//
//  Created by Don Wettasinghe on 2/17/15.
//  Copyright (c) 2015 Don Wettasinghe. All rights reserved.
//

#import "ScannerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ResultViewController.h"

@import AVFoundation;

@interface Barcode : NSObject
@property (nonatomic, strong) AVMetadataMachineReadableCodeObject *metadataObject;
@property (nonatomic, strong) UIBezierPath *cornersPath;
@property (nonatomic, strong) UIBezierPath *boundingBoxPath;

@end

@implementation Barcode
    
@end


@interface ScannerViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtBox;
@property (nonatomic, weak) IBOutlet UIView *previewView;

@end

@implementation ScannerViewController{
    
    AVCaptureSession *_session;
    AVCaptureDevice *_device;
    AVCaptureDeviceInput *_input;
    AVCaptureMetadataOutput *_output;
    AVCaptureVideoPreviewLayer *_prevLayer;
    
    UIView *_highlightView;
    UILabel *_label;
    NSString *detectionStringValue;
    NSString *lastBarcodeValue;
    
}
#pragma mark -
//-(void)viewDidDisappear:(BOOL)animated{
//    NSLog(@"AA");
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//     NSLog(@"BB");
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _highlightView = [[UIView alloc] init];
    _highlightView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    _highlightView.layer.borderColor = [UIColor greenColor].CGColor;
    _highlightView.layer.borderWidth = 3;
    [self.view addSubview:_highlightView];
    
    _label = [[UILabel alloc] init];
    _label.frame = CGRectMake(0, self.view.bounds.size.height - 80, self.view.bounds.size.width, 40);
    _label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _label.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"(none)";
    [self.view addSubview:_label];
    
    _session = [[AVCaptureSession alloc] init];
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    
    _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&error];
    if (_input) {
        [_session addInput:_input];
    } else {
        NSLog(@"Error: %@", error);
    }
    
    _output = [[AVCaptureMetadataOutput alloc] init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [_session addOutput:_output];
    
    _output.metadataObjectTypes = [_output availableMetadataObjectTypes];
    
    _prevLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _prevLayer.frame = self.view.bounds;
    _prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_prevLayer];
    
    [_session startRunning];
    
    [self.view bringSubviewToFront:_highlightView];
    [self.view bringSubviewToFront:_label];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    CGRect highlightViewRect = CGRectZero;
    AVMetadataMachineReadableCodeObject *barCodeObject;
    NSString *detectionString = nil;
    NSArray *barCodeTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
                              AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
                              AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
    
    for (AVMetadataObject *metadata in metadataObjects) {
        for (NSString *type in barCodeTypes) {
            if ([metadata.type isEqualToString:type])
            {
                barCodeObject = (AVMetadataMachineReadableCodeObject *)[_prevLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
                highlightViewRect = barCodeObject.bounds;
                detectionString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
                break;
            }
        }
        
        if (detectionString != nil)
        {
            _label.text = detectionString;
            
            if([detectionString isEqualToString:lastBarcodeValue])
            {
                return;
            }
            
            lastBarcodeValue = detectionString;
            [self performSegueWithIdentifier:@"fromScanView" sender:self];
            
            break;
        }
        else
            _label.text = @"(none)";
    }
    
    _highlightView.frame = highlightViewRect;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"fromScanView"]) {
//        UINavigationController *navController = (UINavigationController*)segue.destinationViewController;
//        CodeViewController *controller = (CodeViewController*)navController.topViewController;
//        controller.code = mCode;
//    }
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"fromScanView"])
    {
       
        ResultViewController *viewController = segue.destinationViewController;
        viewController.barcodeValue = lastBarcodeValue;
        
    }
}



@end
