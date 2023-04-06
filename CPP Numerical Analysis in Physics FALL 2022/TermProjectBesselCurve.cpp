/*Summary: Bessel curvature method is used for making an interpolation between points in our valarray 
In this project, we created a sinusodial function(mybessel) from a linear function(myvals) and 
tried to obtain peaks values that are stored in mypeaks array. This method is useful in many fields like
frequency modulation, calculating electromagnetic waves in a cylindrical waveguide, differaction 
from helical objects etc... I found this project's purpose similar to frequency modulation 
because by finding the peaks, the distance between x axis, then, the frequency can be found. 
(Which is roughly 80). I explained each method,loop and, variable more detailed below.
*/

#include <iostream>
#include <cmath> 
#include <valarray>
using namespace std;

#define pi 3.141593

double fGA(int n, double x, double theta){ //This method takes the most part of the Euler Quadrate method.
                                           //Basically, we are doing it to create sinusodial series.
  double res = cos(x*sin(theta)-n*theta);
  return res;
}

double besseljGA(int n, double x) { /* ..Bessel curvature method is used for making an 
                                       interpolation between points in our valarray.. */

  double res = 0.0;
  double zi = 0.0;
  int M = 10000;  /* M is like a precision coeffiecent. By increasing M, the accuracy can be increased. 
                  Because the length between [i] [i-1] are divided into more pieces. 
                  So the graph resolution increases more */

  for(int i=1; i<M; i++){ //This loop calculates the summation symbol part in Euler quadrature method.
    zi = (0.0 + (i-1)*(pi-0.0)/M); 
    res+= fGA(n,x,zi);    /*Add summation part to result (I will divide it by pi in the end. 
                          Here I aimed to make an optimization.
                          (Because dividing pi in each condition is not effective.) */
  }

  res = (1/pi) * ((pi-0.0)/M) * (res); //Here I divided by pi and M

  return res;
}

void findmyPeaksGA(valarray<double> v,valarray<double> &peaks){ 
  /*This method finds peaks of our 
  sinusodial bessel function. Here, I used peaks array as a reference object(&) because it is more useful 
  for calculating new things outside of this method.
  In each calculation peaks decrease because we divided the resolution by M in the bessel function. */

  int numIteration = 0;

  /* In the project folder, negative peaks were declined. 
  So I decided to check whether the curvature is decreasing or not from below.
  At first values are increasing. Therefore, I set it to false. */
  bool isDecreasing = false; 

  for(int i=2; i<v.size(); i++){ //First 2 elements are ignored because the 2nd one was too close to the first element.

    if(numIteration != peaks.size()){ /* If the iteration numbers are lower than size of our peaks array. 
                                      Then loops should continue */

      if(v[i] > 0){
        if(isDecreasing == false)
        if((v[i+1] < v[i])){
          peaks[numIteration] = v[i]; //I push elements into array by increasing the iteration number.
          numIteration++;
 
          isDecreasing = true;
        }
      }

      else if(v[i] < 0){   //For checking below zero conditions.
        isDecreasing = true; //If it graph is below 0 then it is decreasing.

        if((v[i] > v[i-1])){ //If the curvature is bended upward, it means it is increasing.
          isDecreasing = false; //It is increasing. So, set it false.
        }

      }
    }
    else{ //If the peaks array is filled. Break the for loop.
        break;
      }
   }

}

int main(){

  //Schools number is ended by 7.
  int num1 = 8000;
  int num2 = 9;
  int num3 = 7;
  double h = 0.08;

  double initial = 0.0;


  valarray<double> myvals(num1);
  valarray<double> mybessel(num1);
  valarray<double> mypeaksGA(num2);

  myvals[0] = num1;
  mybessel[0] = num1;
  mypeaksGA[0] = num2;


  for(int i = 0; i<myvals.size(); i++){ //Pushing elements to the values array.
      myvals[i] = initial+i*h;
  }

  for(int i = 0; i<mybessel.size(); i++){  //Pushing elements to the bessels array.
      mybessel[i] = besseljGA(num3,myvals[i]);
  }

  findmyPeaksGA(mybessel,mypeaksGA); //Find peaks of the bessels curvature.

  for(int i = 0; i<mypeaksGA.size(); i++){ //Display the peaks after finding method.
      cout<<mypeaksGA[i]<<endl;
  }       

  return 0;
} 
