# Data-Simulation-Model
A simulation model aiming to mimic Google Maps in finding the fastest route based on a set of parameters. By considering different variables that affect travel time, such as road characteristics, traffic lights, and speed limits we try to find the fastest route among the given set of roads.

# Simulated variables
We have defined 6 variables, of which 1 is inputted by the user, which is “n,” corresponding to the number of roads the user would wish to compare, and the rest are randomly generated using simulation. We have taken into consideration that they must be generated from different distributions since we would need the generated numbers to have specific characteristics to be as much as the real-life data. Here is a description of the variables used throughout the simulation.

- n → the number of roads the user would wish to compare
- total_distance → corresponding to the total distance of each route to the same destination in kilometers
- no_traffic → the number of traffic lights the user might encounter during the journey 
- dlight → the distance to the first traffic light encountered in kilometers
- tlight → the time for which the traffic light would remain red from 0 to 60 seconds according to each traffic light
- splimit → represents the speed limit in each of the routes in kilometers per hour

# Output
The code outputs the shortest route that would take the least time out of all the routes to reach the destination. The output of the function isn't the same after each run because it delivers the shortest route, which varies because new data is randomly generated every time. 
