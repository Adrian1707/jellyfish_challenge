
<img style="float: right;" src="https://github.com/zapnito/jellyfish-challenge/blob/master/jelly.png" align="right">

# jellyfish-challenge

My approach to this challenge was to create a set of interacting classes that allow a jellyfish to be moved by a remote in a tank.
Instantly I knew I'd have to write 3 classes, each with their own responsibility. The tank to hold the jellyfish, the remote to control the jellyfish, and the jellyfish itself.

I made it a habit of interrogating my classes and their methods regularly, asking them each time what their responsibility was. If I asked a method and its answer contained an 'and', I often refactored. If you look through my commit history some of the methods started out as monsters (the jellyfish 'move' method). A bulk of my time was spent refactoring in order to follow the Single Responsibility Principle.

I also used dependency injection throughout this task, and no class currently depends on another class. Every time a class needs to
interact with another it's done though dependency injection.

My main regret during this challenge was the absence of doubles and mocks in my spec files. I initially tested using doubles, then found my tests were failing, but my code was working when I ran manual feature tests in the console. I then decided to reference the classes
themselves and planned to introduce doubles/mocks towards the end. Given I wanted to get this in by the end of the week I ran out of time.

I continued refactoring my Jellyfish class and split it out to a mover class and a reporter class (it's not the responsibility of the jellyfish to report it's current location). Spec files were not made for these classes as they were already tested via the initial jellyfish class.

Overall I enjoyed this challenge as I learnt new things and found my mind being stretched. On looking at the task initially I was intimidated, but after careful planning I realised what I needed to do. I also realised my ability to isolate problems and narrow them down in order to arrive at solutions faster has improved immensely.

## Install

```
git clone https://github.com/Adrian1707/jellyfish-challenge
cd jellyfish-challenge
ruby reporter.rb
```

## Run Them Tests

```
bundle
rspec
```
## Sample

*Input*
````
53
11E RFRFRFRF
32N FRRFLLFFRRFLL
03W LLFFFLFLFL
```

*Output*
```
11E
33NLOST
23S
```
