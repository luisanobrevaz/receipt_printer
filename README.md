# Receipt Printer

This is a Ruby application to print a basket receipt given a products list input.

Setup
-----------------------
- Install rspec with:
```bash
bundle install
```

Running the application
-----------------------
- You can run the app with:
```bash
ruby run.rb
```
- You can also pass a file path as argument.
```bash
ruby run.rb inputs/input.txt
```
- Input examples from task can be executed with:
```bash
ruby run.rb inputs/input1.txt
ruby run.rb inputs/input2.txt
ruby run.rb inputs/input3.txt
```

Running Tests
-----------------------
### How to run test
- Specs are ran with rspec. Simply run rspec on your command line.
```bash
rspec
```

Future Improvements
-----------------------
- A better solution to categorize products
- Improve specs readability
- Improve Receipt.print_receipt output

Assumptions
-----------------------
- Product name input x output

In the given input and output pairs there were only 2 products with quantity greater than 1.

The first example was 'input: 2 books at 12.49' and 'output: 2 books: 24.98'. No changes were made to the name of the product (book)

The second example was 'input: 3 boxes of imported chocolates at 11.25' and 'output: 3 boxes of imported chocolates: 35.55'. The name of the product changed from ‘boxes of imported chocolates’ to ‘boxes of imported chocolates’.

Since they both behaved differently, I assumed the first input/output pair was correct and the second had a typo in the output.
