let world;
let boxes = [];
let boundaries = [];
let maxBoxes = 1000;

function setup() {
  createCanvas(800, 600);

  // Create the Box2D world
  let gravity = new box2d.b2Vec2(0, 10); // Gravity vector pointing down
  world = new box2d.b2World(gravity);

  // Add boundaries (left, right, top, bottom)
  boundaries.push(new Boundary(width / 2, 0, width, 10));  // Top
  boundaries.push(new Boundary(width / 2, height, width, 10));  // Bottom
  boundaries.push(new Boundary(0, height / 2, 10, height));  // Left
  boundaries.push(new Boundary(width, height / 2, 10, height));  // Right

  // Add a bunch of boxes with varying sizes and weights
  for (let i = 0; i < maxBoxes; i++) {
    let w = random(10, 30);
    let h = random(10, 30);
    let x = random(width);
    let y = random(height / 2);
    boxes.push(new Box(x, y, w, h));
  }
}

function draw() {
  background(51);
  // Step the physics world
  world.Step(1 / 60, 10, 10);

  // Draw boundaries
  for (let boundary of boundaries) {
    boundary.display();
  }

  // Draw boxes
  for (let box of boxes) {
    box.display();
  }
}

class Box {
  constructor(x, y, w, h) {
    this.w = w;
    this.h = h;

    let bd = new box2d.b2BodyDef();
    bd.type = box2d.b2BodyType.b2_dynamicBody;
    bd.position = scaleToWorld(x, y);

    this.body = world.CreateBody(bd);

    let shape = new box2d.b2PolygonShape();
    shape.SetAsBox(scaleToWorld(w / 2), scaleToWorld(h / 2));

    let fd = new box2d.b2FixtureDef();
    fd.shape = shape;
    fd.density = 1.0;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    this.body.CreateFixture(fd);
  }

  display() {
    let pos = scaleToPixels(this.body.GetPosition());
    let angle = this.body.GetAngle();
    let col = map(this.w * this.h, 100, 900, 100, 255);  // Map size to color
    fill(col);
    stroke(255);
    push();
    translate(pos.x, pos.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, this.w, this.h);
    pop();
  }
}

class Boundary {
  constructor(x, y, w, h) {
    this.w = w;
    this.h = h;

    let bd = new box2d.b2BodyDef();
    bd.position = scaleToWorld(x, y);
    bd.type = box2d.b2BodyType.b2_staticBody;

    this.body = world.CreateBody(bd);

    let shape = new box2d.b2PolygonShape();
    shape.SetAsBox(scaleToWorld(w / 2), scaleToWorld(h / 2));

    this.body.CreateFixture(shape, 1);
  }

  display() {
    fill(127);
    stroke(200);
    let pos = scaleToPixels(this.body.GetPosition());
    rectMode(CENTER);
    rect(pos.x, pos.y, this.w, this.h);
  }
}
