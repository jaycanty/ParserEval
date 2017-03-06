# Parser Eval


## About

I was inspired by this [talk](https://realm.io/news/swift-summit-anthony-levings-json-type-safety/) and set out to create a JSON parser using an enum, [here](https://github.com/jaycanty/JJson).  

Then I grew curious and wanted to test my parser's performance versus my favorite parser, [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON).  The tests are quite naive, SwiftyJSON does a whole heck of a lot more than JJson.  

####Tests

- Initialization
- Iterating on an array and accessing objects data
- Iterating on an array and accessing objects partial data

#### Results

| Test                | JJson    |SwiftyJSON| Compare |
| -------------       |---------:| --------:|--------:|
| Intitialize         | 0.045    |  0.004   | -11X    |
| Access              | 0.006    |  0.166   | +27X    | 
| Init+Access         | 0.047    |  0.167   | +3.5X   |
| Init+Partial Access | 0.042    |  0.080   | +1.9X   |


From my tests. SwiftyJSON Constructor is much faster, but it seems once initialized, JJson will parse the results quicker and overall JJson is quicker.  When selecting partial data from the objects, SwiftyJSON gets closer to JJson.


## Installation

clone and run, pods checked in.






