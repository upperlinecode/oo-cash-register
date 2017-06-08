### Cha Ching!

Amazon needs a new payment app. You're a Director of Engineering at Amazon, and the CTO just came to you and asked you to rewrite their payment app in time for their Christmas rush. You now need to build an app that can support 426 purchases per second. 


### Instructions
Follow along with the specs in `spec/amazon_transaction_spec.rb`. Remember to run your specs in the terminal by entering `rspec` from the main directory of this lab.

Write your code in the `amazon_transaction.rb` file.

Take it one step at a time, peeps!

### After You Pass All The Tests...
Build out **four more methods** of your choice for your cash register. Think about what functionality would be useful. Maybe you want to build out a `amazon_prime` method that will give a customer free shipping if they have Amazon prime. Or maybe you want the register to print a receipt by `puts`ing the details of the transaction to go in the box with the user's purchase. How would you build a `print_receipt` method? Maybe there is a `gift_box` method that prints out a guest receipt without the cost of the item, and gives the user an option to add a note.

### Bonus
Go to `amazon_transaction_spec.rb` and uncomment the extra tests. Each bonus increases in difficulty and cover new concepts we haven't taught you in class yet. If you've made it to the bonuses then you already know how to build the business logic or back-end of an app. Hooray! These provide just a little extra push if you're looking for even more of a challenge. 

Bonus 1: Build a method called `cancel_order` that will remove the last transaction from the total. You'll need to make an additional attribute accessor and keep track of that last transaction amount somehow. Hint: in what method of the class are you working with an individual item?

Bonus 2: Amazon keeps a history of it's user's transactions so they can access them later in case the customer needs a refund or wants to see past purchases. For this challenge, you'll need to add a randomly generated numeric code as an attribute to the transaction. Then, you'll need to use a class variable to store each transaction's code so Amazon can easily look up each transaction later.

Bonus 3: Want to make your cash register even more realistic? We can use Ruby to write text into different types of files. So instead of printing to the screen you could write a print_receipt method that can actually put the transaction details in a receipt.txt file, which your customers can print out or save. To complete this bonus you'll need to do a bit of research on how to do this (hint: look up File; it's a built-in Ruby class!)

***And that's all folks!*** You've successfully built an object-oriented payment app!

### Resources
* [Codecademy](http://www.codecademy.com/dashboard) - [Banking on Ruby](http://www.codecademy.com/courses/ruby-beginner-en-32cN3/0/1)

