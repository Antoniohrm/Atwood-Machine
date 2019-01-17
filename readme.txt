Our computational approach to the Atwood machine with pulleys with mass is to obtain the numerical results from the analytic solution and code a simulation in which the user can see in a video the exact same movements that would take place if the experiment was done in real life conditions. 

First of all, the program asks the user for all of the input variables, being the mass of both hanging objects, the mass of the pulley, the radius of the pulley, the initial position of the system, the initial velocity, the total length of the string and the frame-rate that the simulation will use. 

Then, it calculates the acceleration of the system, display it, and set it as constant for the problem.

After that, the program calculates the pairs (x, t) for the whole simulation, until the object number one either touches the pulley or falls until the string finishes. The time increase between frames is the exact one so that there are as many frames each second as fps in the final video.

To continue, it plots every precise moment of the movement and saves it as a video frame. Then, it composes them and exports a video file.

The powerful feature of this approach is that it let us visualize how the experiment would look like in real time, and of course provides us with any numerical data that we would need. Even though the code only automatically displays the acceleration, we have a measure of all of the simulation parameters.