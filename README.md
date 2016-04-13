
# Week 8 Lab - Slack
## Slack: a React and Rails API based chat room
##### Due Tuesday, March 29, 2016  ReactJS
We'll use react-rails and a Rails API to build a Chatroom based application (like Slack). You'll be able to sign in, choose a room, and chat it up with other people who sign in.

# Objectives
## Learning Objectives
After completing this assignment, you should…
* Demonstrate knowledge of JavaScript proficiently
* Demonstrate expertise in data from forms to params (and APIs sending params)
* Demonstrate ability to update data from server without page loads
 

## Performance Objectives
After completing this assignment, you be able to effectively use
* React
* JSON API Endpoints


# Details
## Deliverables
* A Rails 4.2.4 utilizing
  * react-rails
  * a JSON API
  * has-secure-password
  * Seed data for conversations from 3 people in two rooms
* A link to a working Heroku instance


# Requirements
## Normal Mode
As you sign in, you'll be presented a list of rooms. Or, you can create a new room. Clicking on the room will present you with the latest 100 messages in that room.

You can post a message to the room and others will receive it in the order the messages are received within 3 seconds). Other people's messages will appear on your room's message list within 3 seconds as well.

Page loads should happen when I sign in, sign up, and choose a room, but other than that it should reload its own data.

As always, the design should be not-embarassing. Bootstrap, Materialize, Bourbon, or roll your own.

## Hard Mode
Everything in Normal Mode, plus:

1. A user's post should render in Markdown, not just text
2. Display the user's image (either gravatar or an uploaded profile image) next to their name
3. If a user has a username "frank" and I say `@frank what's up` that should be bolded
4. If a user posts a link to an image (ends in .gif, .jpg, .png) it should change that to a markdown image and display inline
5. If I paste a link, it should be clickable in a new tab.
 

## Nightmare Mode
Everything in Hard Mode, plus:

1. Instead of only showing the latest 100 messages, you should allow the user to click "Previous messages"
2. Add ability to search messages and display them
3. Add ability to upload an image and have it display
4. If someone posts a youtube link, change it to be an embed code and display the video.


# Additional Resources
* JWO creating [React Video](https://vimeo.com/141703779)
* [React Rails Tutorial](http://www.railsonmaui.com/blog/2014/09/29/react-on-rails-4-dot-2-simple-tutorial/)
* [facebook React Tutorial](https://facebook.github.io/react/docs/tutorial.html)
