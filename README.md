# Applied-Estimation
Course: Applied Estimation
If you have referenced this code, please STAR.   
**NOTES: Directly copy this code will break the Rules and Code of Honor of KTH.**

## Assignment Description 
### Assignment1 EKF
[[Description]](https://github.com/YIN95/Applied-Estimation/blob/master/Lab_1_EKF/doc/lab1_description.pdf), 
[[report]](https://github.com/YIN95/Applied-Estimation/blob/master/Lab_1_EKF/doc/Lab1_Report.pdf)   

### Assignment2 PF
[[Description]](https://github.com/YIN95/Applied-Estimation/blob/master/Lab_2_PF/doc/lab2_description.pdf), 
[[report]](https://github.com/YIN95/Applied-Estimation/blob/master/Lab_2_PF/doc/Lab2_Report.pdf)   

### Project MULTI-Multi-Pedestrian Tracking
The implemenation of multi-pedestrain tracking mostly using Kalman Filter and particle filter which combines the position estimation and size estimation. 
ACF detector and morphological operations are combined to get better observation model. 
Data association is based on Hungarian algorithm, improved by replicating and consider orientation. 
This code is in MATLAB, we writing most code by ourselves, partially using the code in LAB1 and LAB2. and the code about observation model from the motion-based multiple object trakcing code in Mathwork: http://se.mathworks.com/help/vision/ug/multiple-object-tracking.html. 

**File**
* "Init": initialize the initial value;
* "Kalman": the core algorithm for Kalman Filer;
* "Particle": the core algorithm for particle filter;
* "Process": the code in this file is used to create, delete tracks, drawing results, detect pedestrian;
* "Video": this file including the video;
* Kmain: the main function for Kalman Filter, use it like: Kmain("Video");
* Pmain: the main function for particle filter, use it like: Pmain("Video");

[[report]](https://github.com/YIN95/Applied-Estimation/blob/master/Project_Multi-Pedestrian_Tracking/doc/Project-Report.pdf)  
