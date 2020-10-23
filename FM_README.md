Welcome to Flatiron Motors!

This app does TWO things:
1. It helps users to find the car of their dreams!
2. It provides the owner of the app/dealership with built-in analytics to help them gauge how successful
   the app is for their business!

The first part is satisfied by Regular User Mode.  When the user first starts the app they are prompted to give us their name.  The user name is then collected and used to create a new instance of User in the database.

Then the user starts an interview process, in which they are asked what type of vehicle they are looking for (sedan, minivan, truck, etc.), their budget, and their desired color and trim level.  At each point the user input is saved for use in searching the inventory database.

At the end of the interview the app searches the database and returns the car matching their desired set of features, and tells them the price and the total amount due after sales tax is included.  The user can then make a decision as to whether or not they want to purchase the car.

If they decide "yes", a new instance of Purchase is created using the user ID and car ID, and the user gets a congratulations message.  If not, no purchase is created, and the user is told to restart the app if they would like to try again.

Finally, the user is asked to provide a review of their experience by giving the app a star rating from 1 to 5, and the program exits.

The second part of the function is provided by Super User Mode.  If the user logs on with the name "super_user" the app goes directly to a SU console.  In it, they are provided with a list of built-in analytics to choose from.  They can get a list of the total current inventory, the average of all the star ratings given for the app, the percentage of total users who actually purchased cars, the average sale price of all purchased cars, etc.  The menu continues in a loop until the user selects "Exit", at which point the program closes.

In this way, management of the company can look at data to determine the effectiveness of the app.  Custom analytics available on request.... :)

THANK YOU FOR READING!

