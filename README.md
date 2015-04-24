# Hashcloud

### What?
Have you ever looked at a trending topic on Twitter and thought, "What in the world are those crazy teens talking about now?" Well, with Hashcloud, you can search Twitter for that hashtag and generate a word map to chart the most popular words associated with that tag.

### Installation
1. Clone this repo.
2. `cp credentials_example.yml credentials.yml`
3. Edit `credentials.yml` to include your actual Twitter API credentials. You'll need to register with Twitter Developer to generate these.

### Usage
Run `ruby hashcloud.rb` and follow the prompts.

### Example
```
ruby hashcloud.rb
What hashtag would you like to analyze?
ReadyForHillary
How many tweets would you like to compile?
5000
Searching
Analyzing
{:money=>483, :foreign=>477, :return=>451, :raised=>443, :name=>443, :Add=>441, :Hillary=>438, :Clinton=>430, :I’m=>413, :"too:"=>413, :"nations."=>413, :"&amp;"=>184, :deleted=>178, :"Can't"=>164, :"I'm"=>164, :job=>163, :DNC=>161, :imagine=>161, :posting=>160, :"why."=>159, :dudebro=>159, :"tweet."=>159, :comms=>159, :own=>124, :"Hillary's"=>117, :America=>116, :"Doesn't"=>114, :CEO=>111, :Foundation=>111, :Enjoys=>110, :"money."=>110, :"salaries."=>110, :country=>109, :via=>108, :Uranium=>101, :as=>99, :across=>93, :miles=>91, :"clear,"=>91, :traveled=>91, :"45,000"=>91, :"you're"=>82, :years=>75, :run=>73, :"accomplishments."=>65, :six=>64, :vote=>63, :does=>61, :need=>59, :htt…=>58, :uranium=>57, :sticker=>57, :ready=>57, :bumper=>57, :campaign=>56, :Bill=>56, :Democrats=>55, :taking=>55, :did=>54, :right=>53, :storm=>53, :headed=>53, :CLINTON=>53, :area=>53, :"east."=>53, :spent=>52, :Cash=>52, :PRACTICES=>51, :Libya=>51, :EXPLANATION=>51, :candidate=>51, :"NAT'L"=>51, :EXPLAIN=>51, :ARCHIVES=>51, :EMAIL=>51, :WANTS=>51, :before=>50, :field=>47, :keeping=>47, :reminder=>46, :"-mao"=>46, :friendly=>45, :clear=>45, :were=>45, :trainwreck=>45, :Emails=>44, :candidat…=>44, :"THIS&gt;"=>44, :White=>44, :should=>43, :More=>43, :"hers."=>42, :stance=>42, :"57"=>42, :why=>42, :Episode=>42, :here!=>42, :"rights,"=>42, :listen=>42, :Sign=>41}
```

### Getting throttled?
The app will take a longer time to run when you tell it to compile more tweets. Generally speaking, I like to get around 5,000 at a time. It can go higher, sure, but Twitter started throttling me at around 10,000. Your mileage may vary.
