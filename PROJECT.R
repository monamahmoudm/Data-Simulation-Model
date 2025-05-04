n=100 #how many roads we are comparing

shortest_route= function(n){
  
  total_distance=rexp(n,0.003) #total distance in km
  no_traffic= runif(n,0,n) #number of traffic light from 0 to n
  dlight=rnorm(n,0,1) #distance to the first traffic light in km 
  dlight=pmax(dlight,0) #to select only the positive numbers generated from the previous normal distribution
  tlight=runif(n,30,60) #time of traffic light being red from 30 to 60 in seconds
  splimit= rexp(n,0.2) #speed limit (maximum speed) in km/h
  limit=runif(n,0,splimit)# speed of each car in km/h
  
avg_time= function(total_distance,no_traffic, dlight,tlight, limit){
    
    tttraffic= (dlight/limit)  #time in hours to reach first traffic light
    tttraffic= tttraffic *3600  #time in seconds to reach first traffic light
    
    
    #time to reach first traffic light determines if car will stop at all of them or none at all, because all traffic lights are connected
    #if the time to reach the first traffic light is during a green light, the car won’t stop at any traffic lights.
    #if the time to reach the first traffic light is during a red light, the car will stop at all traffic lights
    x= (tttraffic %%tlight)/tlight
    
    stop= numeric(n) #creates an array containing the total time of the car stopping due to traffic lights 
    z= sample(1:3,n,replace=T) # takes a sample of size n with numbers from 1 = red, 2= yellow, 3= green
    for (i in  1:n) {
      if((z[i]==1) || (x[i]< tlight[i]/60)){
        stop[i]=no_traffic[i]*tlight[i] # waiting time at red light
      }else if ((z[i]==2) || (x[i]== tlight[i]/60)){
        stop[i]=no_traffic[i]*tlight[i]*0.5 # waiting time at yellow light
      }else if ((z[i]==3) || (x[i]> tlight[i]/60)){
        stop[i]=0 #waiting time at green light
      }
    }
    
    stop= stop/3600 #converting stopping time to hours
    
    end_time= (total_distance/limit)
    end_time=end_time+stop  #total time of travel and stopping time
    
    return(end_time)
  }
  
  #storing all routes together in an array to compare them
  route <- numeric(n) 
  for(i in 1:n){
    y= avg_time(total_distance,no_traffic, dlight,tlight, limit)
    route[i]= y[i]
    
  }
  
  print(paste("The fastest route is route", which.min(route),"and it takes",round(min(route)*60,2), "minutes to arrive"))
  
}

# to call the function
shortest_route(n)
