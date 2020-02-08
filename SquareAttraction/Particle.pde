
class Particule { 
  PVector location; 
  PVector velocity; 
  PVector acceleration; 
  float mass; 
  float g = 0.4; 
  color col;
  
  float angle = 0; 
  float aVelocity = 0; 
  float aAcceleration = 0.01; 

  Particule(float m, float x, float y) 
  {

    GetPallette(); 
    location = new PVector(x, y); 
    velocity = new PVector(1, 2); 
    acceleration = new PVector(0, 0); 
    mass = m;
    col = redblue[int(random(0,4))];
  }
  
  
    PVector attract(Particule m) {
 
      
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
 
    float strength = (g * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }



  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); 
    acceleration.add(f);
  }

  void update()
  {
    velocity.add(acceleration); 
    location.add(velocity); 
    
    aAcceleration = acceleration.x / 10.0; 
    aVelocity += aAcceleration; 
    aVelocity = constrain(aVelocity, -0.1,0.1); 
    angle += aVelocity; 
    
    acceleration.mult(0);
  }

  void display() 
  {
    stroke(0); 
    fill(col,100);
    rectMode(CENTER); 
    pushMatrix(); 
    translate(location.x, location.y); 
    rotate(angle); 
    rect(0,0,mass*16, mass*16);
    popMatrix(); 
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width; 
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;   
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1; 
      location.y = height;
    }
  }
}
