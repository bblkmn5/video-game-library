# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
#used sinatra-activerecord gem, RESTful routes for Sinatra::Base.

- [x] Use ActiveRecord for storing information in a database
#used sinatra-activerecord gem, and ActiveRecord::Migrate for database tables and ActiveRecord::Base for controller routes.

- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
#User, Console, Game model classes

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
#Console has_many :games, user has_many :consoles

- [x] Include user accounts
#has a User table with different user.ids

- [x] Ensure that users can't modify content created by other users
#checks if session[:user_id]/current_user == user_id

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
#console belongs_to :user, and game belongs_to :console

- [x] Include user input validations
#when signing up, validates that all fields are filled in. In addition, checks for empty fields when creating new game or console.

- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
#shows error message in redirected URL when requirements not filled in, or when current_user is not the creator of console or game.

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
#README has description and install instructions, and CONTRIBUTORS and LICENSE have own files

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
