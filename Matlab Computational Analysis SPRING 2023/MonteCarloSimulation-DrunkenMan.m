drunkenman_pos = 50;

walked_pos = [];
steps_taken = [];


walked_pos(1) = drunkenman_pos;
step_size = 1;
index = 1;
steps_taken_idx = 1;
 
while(true)
   index = index + 1;
   prob = randi([0,1]);
   if(prob == 0)
       drunkenman_pos = drunkenman_pos - step_size;
   end

   if(prob == 1)
       drunkenman_pos = drunkenman_pos + step_size;
   end

   walked_pos(index) = drunkenman_pos;

   if(drunkenman_pos >= 100)
         display("Gone by moving forward");
         walked_pos = []; 
         steps_taken(steps_taken_idx) = index;
         steps_taken_idx = steps_taken_idx +1;
         drunkenman_pos = 50;
         index = 1
         if(steps_taken_idx == 5000)
         
        break
         end
         walked_pos = []; 
          
   end
   
   if (drunkenman_pos <= 0)
       
          display("Gone by moving backward");
          steps_taken(steps_taken_idx) = index;
          steps_taken_idx = steps_taken_idx +1;
          drunkenman_pos = 50;
          index = 1
        if(steps_taken_idx == 5000)

        break
         
        end
        walked_pos = [];  

  
    end
end
   f1 = figure;
   plot(walked_pos)
    f2 = figure;
   plot(steps_taken)
   display(sum(steps_taken) / 5000)
