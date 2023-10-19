# Receipt Printer

This is a Ruby application to print a basket receipt given an products list input.

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
