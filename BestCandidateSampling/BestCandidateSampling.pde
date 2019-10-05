/*-----------------------------------------
-- Title: 
-- Date: 28/09/2019 9:15 
-- Database: 
-- Author: Christopher Ried
-- Purpose: 
-- Based on the following article 
https://bost.ocks.org/mike/algorithms/
-----------------------------------------
*/
int numCandidates; 
PVector[] = new PVector

void setup()
{
  size(500,500); 
  background(255,255,255); 
  
}

void draw() 
{
} 


void sample() 
{
    PVector bestCandidate, bestDistance; 
  
  for (int i = 0; i < numCandidates; i++)
  {
    
  }
 
} 


float distance(PVector a, PVector b) 
{
  float dx, dy; 
  dx = a.x - b.x; 
  dy = a.y - a.y; 
  
  return sqrt(dx*dx+dy*dy); 

}
