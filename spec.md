# Specifications for the Sinatra Assessment

Specs:

- [x] Use Sinatra to build the app 
    - Sinatra is used

- [x] Use ActiveRecord for storing information in a database
    - used ActiveRecord for migrations and data storage table creation

- [x] Include more than one model class (e.g. User, Post, Category)
    - two models, one for Trainers and one for Pokemon

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - Trainer has many Pokemon 

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - Pokemon belong to a trainer

- [x] Include user accounts with unique login attribute (username or email)
    - email is required for sign up / login

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - views and controller actions complete for all CRUD actions. all tested and working.

- [x] Ensure that users can't modify content created by other users
    - Pokemons Controller validates ownership of resource before allowing access to edit/delete.

- [x] Include user input validations
    - validates if resource owner is the same user that is currently logged in.

- [x] BONUS - not required - Display validation 
failures to user with error message (example form URL e.g. /posts/new)
    - used 'locals: {message " "}' to let user know if there are sign up or authentication errors.

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - README includes all required sections. used a README generator and then edited the README to fit requirements.

Confirm

- [x] You have a large number of small Git commits
    - 20+ commits.

- [x] Your commit messages are meaningful
    - commit messages detail what was done without over-explaining.

- [x] You made the changes in a commit that relate to the commit message
    - commit messages directly relate to the changes done.

- [x] You don't include changes in a commit that aren't related to the commit message
    - only changes described in the message were done.
