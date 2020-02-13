class Balloon extends Obstacle{
	private int x,y, deg;

	Balloon(int x, int y, int obsWidth, int obsHeight){
		super(x,y, obsWidth, obsHeight);
		this.x = x;
		this.y = y;

		spriteBalloon = loadImage("./data/balloon.png");
		spriteBalloon.resize(spriteBalloon.width/4,spriteBalloon.height/4);

		this.obsWidth = spriteBalloon.width/4;
		this.obsHeight = spriteBalloon.height/2;
	}

	void update(){
        move();
        render();
    }

	void render(){
		imageMode(CENTER);
		image(spriteBalloon, this.x, this.y);
	}

	void move(){
		this.y -= 1;
	}

	boolean collision(Player other){
		if(this.x < other.x + other.playerWidth && this.x + this.obsWidth > other.x && this.y-this.obsHeight/2 < other.y + other.playerHeight && this.y-this.obsHeight/2 + this.obsHeight > other.y)
		{
		    return true;
		}
		else{
			return false;
		}
	}
}