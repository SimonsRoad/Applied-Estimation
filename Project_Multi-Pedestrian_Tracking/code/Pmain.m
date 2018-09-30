%% main function for particle filter
function Pmain(videoName)

%% global variable
global video;
global tracks;
global tracks_output;
global frame_count; 
global nextId; 
global colormap;
global kismap;
global v;
global Vheight;
global Vwidth;
global preLoca;

%% initial global variable
saveName = videoName;
videoName = strcat('\Video\',videoName,'.avi');
video = init(videoName);
tracks = init_tracks_p();        
tracks_output = init_outtracks();
frame_count = 1;
nextId = 1;
colormap = init_colormap();
kismap = init_idsmap();
Vheight = 0;
Vwidth = 0;
preLoca = zeros(100,2);
saveName = strcat('result_',saveName,'.avi');
v = VideoWriter(saveName,'Uncompressed AVI');
v.FrameRate = 10;  % Default 30

%% main loop
open(v);
while ~isDone(video.reader)
    
    %% Read a Video Frame
    frame = read_Frame(); 
	
    if frame_count == 1
        [Vheight, Vwidth, ~] = size(frame);
    end
    
	%% Detect Pedestrian
    [centroids, bboxes] = detect_Pedestrian(frame);
	
	%% Predict the new tracks
    predict_pNew_State();
	
	%% Association, match measurements and tracks, return assigned tracks and unassigned tracks
    [assignments, unassignedTracks, unassignedDetections] = ...
        association_p(centroids, bboxes);  % use Hungarian algorithm for data association
    %% Update tracks
	update_assigned_p_tracks(assignments, centroids, bboxes);
    update_unassigned_p_tracks(unassignedTracks);
   
    %% Delete lost tracks
	delete_lost_tracks_p();
	
    %% Create new tracks
    create_new_tracks_p(unassignedDetections, centroids, bboxes);
	
    %% Display results
    
    [tn, tk] = displayTrackingResults_p(frame, bboxes);
	frame_count = frame_count + 1;
   
   	
end

close(v);

end