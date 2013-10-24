#######################################
#	Ariel Espinal
#	kazzan0vah@gmail.com
#	(516)404-0058
#	New Hyde Park, NY.
#######################################

How to Run

In Terminal

"ruby tw-salestax.rb <filename>.txt"

Files (<filename.txt>):

input1.txt
input2.txt
input3.txt
_____________________________________________________________________
Testing

Tests were done with rspec.
cd spec
rspec <filename>.rb

Files:

input_spec.rb - Testing for file input
cal_spec.rb - Testing for caculating sales tax and totals
print_spec.rb - Testing for displaying the output
trial_spec.rb - Testing all 3 inputs
_____________________________________________________________________

Assumptions

The input text file follows the following syntax:
    1 book at 12.49
    qty, name, "at", price
Product Quanity is a whole positive number
Price is a positive number
Items to be excluded from the goods sales tax (10%) is included in a text file called exclusions.txt placed in the root directory of this script.
Imported items have the word 'imported' in them.
Flow

A high level flow of how this application works is as follows:
1. User runs runtax.rb with the text file of their choice located in the input directory.

2. runtax.rb runs and calls /lib/input where the text file is loaded and turned into an array and then the following occurs:

text file:

1 book at 1.99 1 imported watches at 5.99
text file to array:

`["1 book at 1.99", "1 imported watch at 5.99"]`
array is split up:

[ ["1", "book", "at", "1.99"], ["1", "imported", "watch", "at", "5.99"] ]
split up arrays are converted into a hash:

["1", "book", "at", "1.99"]
index:   0    1       2     3
:name - determined by taking the index 1 (we can assume index 0 is the item quantity) and taking the ending index of "at" - 1 which would be index 1 in this case. For the imported watch, index 1 to index 2 would be joined, creating "imported watch" and this is determined by the starting point being index 1 and the ending point being whatever the index of "at" is, which in this case is 3 so 3 - 1 = index 2.

:qty - determined by taking index 0 because it is assumed the first item would be quantity.

:price - determined by find the index of "at" and adding 1.

:good - determined by looking up the exclusions.txt list and checking if any items in the array match the items listed in exclusions.txt. If one is found, the boolean of false is applied, otherwise it is set to true.

:import - determined by checking if the array has the string "imported". If found a boolean of true is set, else it is set to false.

:total - determined by multiplying the qty * price.

While, turning the array into a array of hashes you can observe the keys :good and :import, this is the part where tax rules are applied. :good can be true if the item is not in exclusions.txt, or it is false if it is listed in exlclusions.txt.

Similarly, :import can be true if the string "imported" is found and if it is not found it is false.

3. Next the /lib/calculator is called. This is where the goods tax, import tax, total sales tax and total price will be calculated.

@sum_goods_tax is calculated by checking the array of hashes for a value of true.
@sum_import_tax is calculated by checking the array of hashes for a value of true.
@total_sales_tax is calculated by adding sum_goods_tax and sum_imports_tax.
@total_price is calculated by adding @total_sales_price to the sum_base_prices (this is the sum of the price of the items (price * qty) before any taxes are applied). The item hash passed into Calculator, :total is updated to reflect price + goods tax + imports tax.
Notes about rounding:
The problem says to round UP to the nearest 0.05 cent. This is determined by taking 1 / 0.05 = 20.
@nearest_cent is set to (1 / 0.05)
Rounding UP to the nearest 0.05 cent is done by the following:
    ((taxable amount * @nearest_cent).ceil / @nearest_cent)
    .ceil instead of .round is used because we want to round UP.

4. After the totals are calculated, /lib/print is called. This is what outputs everything into the terminal.

The updated items hash from running Calculator is passed into Print, along with total_sales_tax and total_price.

The values of :total, total_sales_tax, and total_price are all "scrubbed" with a method that turns the integer into a string and then applies rjust(2, '0') to make sure 2 decimal spots is displayed.

5. The output should now be as follows:

Input from input1.txt:
1 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85

Output:
1 book: 12.49
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 29.83
Thought Process

As I was writing this, I broke the application down into 3 major components:

Input - where a file is taken in and broken down into something more readable
Calculator - where the readable format taken from input is used to calculate the total values

Print - where the input, revised input and total values are taken to be outputted

I have been studying 3 different languages in the past year which include C, Java,and Ruby. I have decided to use ruby since it is a more easier/powerful way to do this project with a bit of ease. This has been a challenge for me since I actually started learning ruby 3 months ago. I'm a quick learner and I hope I can portray that in this exersize. 
