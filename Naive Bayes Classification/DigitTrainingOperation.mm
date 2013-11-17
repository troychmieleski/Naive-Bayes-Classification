//
//  DigitTrainingOperation.m
//  Naive Bayes Classification
//
//  Created by Troy Chmieleski on 11/17/13.
//  Copyright (c) 2013 Troy Chmieleski. All rights reserved.
//

#import "DigitTrainingOperation.h"

@implementation DigitTrainingOperation {
	DigitSet mDigitSet;
}

- (void)main {
	[self train];
	
	[self didFinishTraining];
}

- (id)initWithDigitSet:(DigitSet)digitSet {
	self = [super init];
	
	if (self) {
		mDigitSet = digitSet;
	}
	
	return self;
}

- (void)train {
	cout << "training" << endl;
	
	int digitIndex = 0;
	
	for (vector<Digit>::iterator it = mDigitSet.digits.begin(); it != mDigitSet.digits.end(); it++) {
		Digit digit = mDigitSet.digits[digitIndex];
		int classIndex = digit.digitClass();
		
		for (int row = 0; row < DIGIT_SIZE; row++) {
			for (int col = 0; col < DIGIT_SIZE; col++) {
				mDigitSet.updatePixelFrequencyMapUsingRowAndColumnForClassIndex(row, col, mDigitSet.digits[digitIndex], classIndex);
			}
		}
		
		digitIndex++;
	}
	
	mDigitSet.printPixelFrequencyMaps();
}

- (void)didFinishTraining {
	if (self.digitTrainingOperationCompletionBlock) {
		self.digitTrainingOperationCompletionBlock();
	}
}

@end
