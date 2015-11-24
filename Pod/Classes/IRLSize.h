//
//  IRLSize.h
//  Pods
//
//  Created by Jeff Kelley on 11/13/14.
//
//


#ifndef IRLSize_h
#define IRLSize_h

struct IRLSize {
    float width;	// in meters
    float height;	// in meters
};
typedef struct IRLSize IRLSize;

#ifdef NS_ASSUME_NONNULL_BEGIN
#define IRL_ASSUME_NONNULL_BEGIN NS_ASSUME_NONNULL_BEGIN
#else
#define IRL_ASSUME_NONNULL_BEGIN
#endif

#ifdef NS_ASSUME_NONNULL_END
#define IRL_ASSUME_NONNULL_END NS_ASSUME_NONNULL_END
#else
#define IRL_ASSUME_NONNULL_END
#endif

#endif
