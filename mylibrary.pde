class Ghost
{
  float x;
  float y;
  PImage ghost;
  float booWidth;
  float booHeight;
  float xSpeed;
  float ySpeed;
  int score;
  int lives;
  int hitline;
  boolean Gamelost;
  
  
  Ghost()
  {
    x = 90;
    y = 50;
    booWidth = 80;
    booHeight = 80;
    xSpeed = 4;
    ySpeed = 2;
    score = 0;
    lives = 3;
    hitline = 400;
    Gamelost = false;
   }
  
  void display() // display image of Boo //
  {
    ghost = loadImage("boo.gif");
    ghost.resize(80,80);
    image(ghost,x,y);
  }
  
  void move() // movement of Boo //
  {
    x = x + xSpeed;
    y = y + ySpeed;
    if(x + booWidth >= width || x <= 0) // Boo cannot go out of screen //
    {
      xSpeed = xSpeed * -1;
    }
    if(y+ booHeight >= height || y <= 0) // Boo cannot go out of screen //
    {
      ySpeed = ySpeed * -1;
    }
   }
  }


