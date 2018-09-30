# Multi-Predestrian Tracking based on KF and PF

This code is for EL2320 Course Project. 
The implemenation of face detection mostly using Kalman Filter and particle filter which combines the position estimation and size estimation. 
ACF detector and morphological operations are combined to get better observation model. 
Data association is based on Hungarian algorithm, improved by replicating and consider orientation. 
This code is in MATLAB, we writing most code by ourselves, partially using the code in LAB1 and LAB2. and the code about observation model from the motion-based multiple object trakcing code in Mathwork: http://se.mathworks.com/help/vision/ug/multiple-object-tracking.html. 

## File
* "Init": initialize the initial value;
* "Kalman": the core algorithm for Kalman Filer;
* "Particle": the core algorithm for particle filter;
* "Process": the code in this file is used to create, delete tracks, drawing results, detect pedestrian;
* "Video": this file including the video;
* Kmain: the main function for Kalman Filter, use it like: Kmain("Video");
* Pmain: the main function for particle filter, use it like: Pmain("Video");

## Result
I attached part of the experiment result on Youtube:
https://www.youtube.com/watch?v=ngKAOCGIMkk
https://www.youtube.com/watch?v=Mc9X7OEv_pQ
https://www.youtube.com/watch?v=CulFpvLhwho
https://www.youtube.com/watch?v=JFEKYivvocI
https://www.youtube.com/watch?v=ohbBkhFYqAU
https://www.youtube.com/watch?v=DIV7CNrgpyg
https://www.youtube.com/watch?v=4-TyOicNLhw