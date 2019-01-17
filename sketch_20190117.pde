void setup(){
 
  size(720, 720);
  frameRate(30);
  colorMode(HSB);
  strokeWeight(3);
}

void draw(){
  
  background(239);
  randomSeed(39);
  
  translate(width / 2, height / 2);
  
  ArrayList<PVector> locations = new ArrayList<PVector>();
  for(int i = 0; i < 50; i++)
  {
    float x = map(noise(random(1000), frameCount * 0.0065), 0, 1, -500, 500);
    float y = map(noise(random(1000), frameCount * 0.0065), 0, 1, -500, 500);
    
    locations.add(new PVector(x, y));    
  }
  
  for(int i = 0; i < locations.size(); i++)
  {
    PVector location = locations.get(i);
    float min = width * height;  
    for(int j = 0; j < locations.size(); j++)
    {
      if(i == j) continue;
      
      PVector other = locations.get(j);
      float distance = PVector.dist(location, other);
      if(distance < min)
      {
        min = distance;
      }
    }
    
    fill(random(255), 200, 255);
    ellipse(location.x, location.y, min, min);
  }
}
