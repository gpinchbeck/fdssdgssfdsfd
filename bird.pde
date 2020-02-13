class Bird extends Obstacle{

	private int x,y,currentFrame, previousDisplayTime, deltaTime, xSpeed;

	private PImage[] animation;

	Bird(int x, int y, int obsWidth, int obsHeight){
		super(x,y,obsWidth,obsHeight);
		this.x = x;
		this.y = y;
		this.xSpeed = 2;

		currentFrame = 0;
		deltaTime = 150;
		previousDisplayTime = 0;

		animation = new PImage[4];

		for (int i = 0; i<4;i++){
			PImage spr = loadImage("./data/Bird A/frame-" + int(i+1)+".png");
			spr.resize(obsWidth,obsHeight);
			animation[i] = spr;
		}
	}

	void update(){
        move();
        render();

    }

	void render(){
		if (millis() > previousDisplayTime + deltaTime){
			currentFrame++;
			if (currentFrame > 3){
				currentFrame = 0;
			}
			previousDisplayTime = millis();
		}
		if (this.xSpeed > 0){
			image(animation[currentFrame], this.x,this.y);
		}
		else {
			pushMatrix();
			scale(-1,1);
			image(animation[currentFrame],-this.x,this.y);
			popMatrix();
		}	
	}

	void move(){
		this.y -= 1;
		if (this.x >= width|| this.x <= 0){
	      this.xSpeed *= -1;
	    }
	    this.x += this.xSpeed;
	}

	boolean collision(Player other){
		if(this.x < other.x + other.playerWidth && this.x + this.obsWidth > other.x && this.y < other.y + other.playerHeight && this.y + this.obsHeight > other.y)
		{
		    return true;
		}
		else{
			return false;
		}
	}
}