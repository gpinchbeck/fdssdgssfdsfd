class Cargo extends Obstacle{

	private int x,y, deg;

	Cargo(int x, int y, int obsWidth, int obsHeight){
		super(x,y, obsWidth, obsHeight);
		this.x = x;
		this.y = y;

		spriteCargo = loadImage("./data/obstacle1.png");
		spriteCargo.resize(50,50);
		deg = 0;
	}

	void update(){
        move();
        render();
    }

	void render(){
		pushMatrix();
        translate(this.x,this.y);
        rotate(radians(deg));
        image(spriteCargo,-25,-25);
        popMatrix();
        deg += 2;
	}

	void move(){
		this.y -= 1;
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
