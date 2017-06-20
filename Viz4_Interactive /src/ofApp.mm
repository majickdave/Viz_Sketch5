#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

    ofBackground(255);
    sphere1.setRadius( ofGetWidth()/9 );
    

    
    sphere1 = ofSpherePrimitive(ofGetWidth()/4, 24);
    
    std::cout << &sphere1 << std::endl;
    
    for (int i=0; i<POLY_COUNT; i++){
        polysLocs[i] = ofVec3f(ofRandom(ofGetWidth()), ofRandom(ofGetHeight()));
        polyRots[i] = ofRandom(-PI, PI);
    }
    
    ofDisableArbTex();
    texture.load("of.png");
    texture.getTexture().setTextureWrap( GL_REPEAT, GL_REPEAT );
    
//    ofSetSmoothLighting(true);
//    pointLight.setDiffuseColor( ofFloatColor(.85, .85, .55) );
//    pointLight.setSpecularColor( ofFloatColor(1.f, 1.f, 1.f));
//    
//    pointLight2.setDiffuseColor( ofFloatColor( 212.f/255.f, 63.f/255.f, 135.f/255.f ));
//    pointLight2.setSpecularColor(ofFloatColor(.5f, .8f, .2f));
    
//    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    
    // Set iOS to Orientation Landscape Right
    
//    ofSetFrameRate(30);
     
    
    grabber.setDesiredFrameRate(45);
    
    // Set front or back
    grabber.setDeviceID(1);
    
    grabber.setup(ofGetWidth(), ofGetHeight(), OF_PIXELS_BGRA);
    tex.allocate(grabber.getWidth(), grabber.getHeight(), GL_RGB);

    
    pix = new unsigned char[ (int)( grabber.getWidth() * grabber.getHeight() * 3.0) ];
    

    


}

//--------------------------------------------------------------
void ofApp::update(){
//    ofSetColor(255, int(130*cos(ofGetFrameNum()/PI)), int(255*cos(ofGetFrameNum()/PI)));
//    pointLight3.setDiffuseColor( ofFloatColor(85.f/255.f,94.f/255.f,77.f/255.f) );
//    pointLight3.setSpecularColor( ofFloatColor(18.f/255.f,111.f/255.f,135.f/255.f) );
//    pointLight.setPosition((ofGetWidth()*.5)+ cos(ofGetElapsedTimef()*.5)*(ofGetWidth()*.3), ofGetHeight()/2, 500);
//    pointLight2.setPosition((ofGetWidth()*.5)+ cos(ofGetElapsedTimef()*.15)*(ofGetWidth()*.3),
//                            ofGetHeight()*.5 + sin(ofGetElapsedTimef()*.7)*(ofGetHeight()), -300);
//    
//    pointLight3.setPosition(
//                            cos(ofGetElapsedTimef()*1.5) * ofGetWidth()*.5,
//                            sin(ofGetElapsedTimef()*1.5f) * ofGetWidth()*.5,
//                            cos(ofGetElapsedTimef()*.2) * ofGetWidth()
//                            );
    

    
    grabber.update();
    
    if(grabber.isFrameNew() == true) {
        ofPixels & pixels = grabber.getPixels();
        unsigned char * src = pixels.getData();
        int totalPix = grabber.getWidth() * grabber.getHeight() * 3;
        
        for(int k = 0; k < totalPix; k+= 3){
            pix[k  ] = 255*cos(ofGetFrameNum()/(100*PI)) - src[k];
            pix[k+1] = 255*cos(ofGetFrameNum()/(100*PI))  - src[k+1];
            pix[k+2] = 255*cos(ofGetFrameNum()/(100*PI))  + src[k+2];
        }
        
        tex.loadData(pix, grabber.getWidth(), grabber.getHeight(), GL_RGB);
    }

}

//--------------------------------------------------------------
void ofApp::draw(){
    
//    float spinX = sin(ofGetElapsedTimef()*.35f);
//    float spinY = cos(ofGetElapsedTimef()*.075f);
    
    // draw video
    ofSetColor(255, 255, 255);
    tex.draw(0, 40, tex.getWidth(), tex.getHeight());
    
//    grabber.draw(0, 40, grabber.getWidth(), grabber.getHeight());
    

    
     // Lighting
//    ofEnableLighting();
//    pointLight.enable();
//    pointLight2.enable();
//    pointLight3.enable();
    
    // Position
    posX = mouseX;
    posY = mouseY;
//    sphere1.rotate(spinX, 1.0, 0.0, 0.0);
//    sphere1.rotate(spinY, 0, 1.0, 0.0);
    
    
    //sphere1.setPosition(posX, posY, 0);
    // Draw
    
    grabber.getTexture().bind();
    tex.bind();
    
    for (int i=0; i<6; i++){
        ofPushMatrix();
        ofTranslate(polysLocs[i].x, polysLocs[i].y);
        ofRotate(rots[i]);
        sphere1.mapTexCoordsFromTexture(tex);
        sphere1.draw();
        ofPopMatrix();
        rots[i] += polyRots[i];
//        ofSetColor(190, 180,230);
    }
    
    
//    sphere1.setRadius(ofGetHeight()/mouseX);
//    sphere1.draw();
    

    
    

}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    sphere1.setPosition(mouseX, mouseY, 0);

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
    

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

    grabber.close();
    grabber.setDeviceID(0);
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
