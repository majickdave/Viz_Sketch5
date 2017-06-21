#pragma once

#include "ofxiOS.h"
#include "MyPoly.h"

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
        // Camera
        ofVideoGrabber grabber;
        ofTexture tex;
        ofTexture tex1;
        ofImage texture;
        unsigned char * pix;

    
    // Declare Object Classes
    const static int POLY_COUNT = 20;
    ofVec3f polysLocs[POLY_COUNT];
    float rots[POLY_COUNT];
    float polyRots[POLY_COUNT];
    
    ofSpherePrimitive sphere1;
    
    
    // Declare parameters
    
    float posX; float posY;

    
    //Light
    ofLight pointLight;
    ofLight pointLight2;
    ofLight pointLight3;
    
    bool frontCamera;
    
    int camera = 1;
    bool running;
    

};


