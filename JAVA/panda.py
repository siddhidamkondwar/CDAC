import turtle

t = turtle.Turtle()
t.speed(3)

# Draw face (big circle)
t.penup()
t.goto(0, -100)
t.pendown()
t.color("black", "white")
t.begin_fill()
t.circle(100)
t.end_fill()

# Left ear
t.penup()
t.goto(-70, 80)
t.pendown()
t.color("black")
t.begin_fill()
t.circle(30)
t.end_fill()

# Right ear
t.penup()
t.goto(70, 80)
t.pendown()
t.begin_fill()
t.circle(30)
t.end_fill()

# Left eye patch
t.penup()
t.goto(-40, 20)
t.pendown()
t.begin_fill()
t.circle(20)
t.end_fill()

# Right eye patch
t.penup()
t.goto(40, 20)
t.pendown()
t.begin_fill()
t.circle(20)
t.end_fill()

# Eyes
t.penup()
t.goto(-40, 30)
t.pendown()
t.color("white")
t.begin_fill()
t.circle(8)
t.end_fill()

t.penup()
t.goto(40, 30)
t.pendown()
t.begin_fill()
t.circle(8)
t.end_fill()

# Nose
t.penup()
t.goto(0, 0)
t.pendown()
t.color("black")
t.begin_fill()
t.circle(10)
t.end_fill()

# Smile
t.penup()
t.goto(-30, -20)
t.pendown()
t.setheading(-60)
t.circle(40, 120)

turtle.done()