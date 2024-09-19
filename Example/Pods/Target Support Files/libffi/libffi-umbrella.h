#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ffi.h"
#import "fficonfig.h"
#import "ffitarget.h"
#import "ffi_cfi.h"
#import "ffi_common.h"
#import "tramp.h"
#import "fficonfig_arm64.h"
#import "fficonfig_x86_64.h"
#import "ffitarget_arm64.h"
#import "ffitarget_x86_64.h"
#import "ffi_arm64.h"
#import "ffi_x86_64.h"

FOUNDATION_EXPORT double libffiVersionNumber;
FOUNDATION_EXPORT const unsigned char libffiVersionString[];

