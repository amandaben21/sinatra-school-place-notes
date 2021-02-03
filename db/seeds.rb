#create some seed data to work
#create 2 users

amanda = User.create(username:"Amanda", email:"amanda@amanda.com", password:"piggy")
ariel = User.create(username:"Ariel", email:"ariel@ariel.com", password:"piggy")

#create some notes
Note.create(subject_name:"Math", date:"Jan.1st", note_entry:"One of the most basic sets of numbers is the whole numbers", user_id: amanda.id)

