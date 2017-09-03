/*Creator: Alben Kalambukadu
Date Created: October,30 2014 */

Rect stage;
Ghost Boo;


void setup()
{
  size(700,500);
  stage = new Rect();
  Boo = new Ghost();
  frameRate(60);
}

void draw()
{
  background(0);
  if(!Boo.Gamelost) // GameLost is false by default, so run the game. //
  {
    runGame();
    if(Boo.lives <= 0) // If Boo's life is 0, then gamelost is true. //
      {
        Boo.Gamelost = true;
      }
  }
  else // Restart the game. //
  {
    displayRestart();
    if(keyPressed)
    {
      Boo.x = 90;
      Boo.y = 50;
      Boo.Gamelost = false;
      Boo.lives = 3;
      Boo.score = 0;
     }
  }
}

void displayRestart() // To restart game if you loose. //
{
  fill(255,0,0);
  text("You lost! Try Again(Press any key)", (width/2)/2, height/2);
}

void runGame() // To load everything. //
{
     stage.display();
     Boo.display();
     Boo.move();
     if((stage.paddle/2) <= mouseX && mouseX <= (width - stage.paddle/2)) // Stage cannot go past 0 or width. //
      {
        stage.x = mouseX;
      } 
      
      
     if((Boo.y >= Boo.hitline) && (Boo.x >= stage.x-stage.paddle/2) && (Boo.x <= stage.x+stage.paddle/2)) // Boo bounces back and score increases when Boo hits stage //
      {
       //Boo.xSpeed = Boo.xSpeed * -1;//
       Boo.ySpeed = Boo.ySpeed * -1;
       Boo.score += 5;
      } 
    
     if(Boo.y+Boo.booHeight >= height) // If Boo touches the ground you loose a life.
      {
       Boo.lives -= 1;
      }
    
    textSize(20); // Display score and lives //
    fill(255,0,0);
    text("Score:"+Boo.score, 10, 100);
    text("Lives:"+Boo.lives, 10, 150);
}

class Rect
{
 int RectHeight;
 int paddle;
 int x;
 
  Rect()
  {
   RectHeight = 20;
   paddle = 200;
   x = width/2;
  }

  void display()
  {
    rectMode(CENTER);
    noStroke();
    fill(255,0,0);
    rect(x, height, paddle, RectHeight);
  }
}


  
  
  
  

