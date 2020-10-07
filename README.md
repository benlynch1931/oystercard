# Oystercard Weekly Challenge

### How to run:

Using RSpec:
```shell
rspec
```

Running via Terminal:
```shell
ruby ./lib/oystercard.rb
```

### Features
1. Easy change of minimum fare, starting balace and balance limit. No need to alter the tests for this.
2. Guard conditions to ensure sufficient funds before beginning journeys.


### User Stories and Domain Models Used:
```
In order to use public transport,
As a customer,
I want money on my card.
```
|Object|Message|
|----|----|
|Customer||
|card||


```
In order to keep using public transport,
As a customer,
I want to add money to my card
```
|Object|Message|
|----|----|
|Customer||
|card|top_up|


```
In order to protect my money,
As a customer,
I don't want to put too much money on my card.
```
|Object|Message|
|----|----|
|Customer||
|card|check limit|


```
In order to pay for my journey,
As a customer,
I need my fare deducted from my card.
```
|Object|Message|
|----|----|
|Customer||
|card|deduct|


```
In order to get through the barriers,
As a customer,
I need to touch in and out.
```
|Object|Message|
|----|----|
|Customer||
|card|touch_in|
|card|touch_out|


```
In order to pay for my journey,
as a customer,
I need to have the minimum amount for a single journey.
```
|Object|Message|
|----|----|
|Customer||
|card|has_minimum_amount?|


```
In order to pay for my journey,
As a customer,
I need to pay for my journey when it's complete.
```
|Object|Message|
|----|----|
|Customer||
|card|[deduct at end of journey]|


```
In order to pay for my journey,
as a customer,
I need to know where I've travelled from.
```
|Object|Message|
|----|----|
|Customer|travelled_from|


```
In order to know where I have been,
As a customer,
I want to see to all my previous trips.
```
|Object|Message|
|----|----|
|Customer|see_trips|


```
In order to know how far I have travelled,
As a customer,
I want to know what zone a station is in.
```
|Object|Message|
|----|----|
|Customer||
|station|which_zone|


```
In order to be charged correctly,
As a customer,
I need a penalty charge deducted if I fail to touch in or out.
```
|Object|Message|
|----|----|
|Customer||
|card|penalty if !(touch_in && touch_out)|


```
In order to be charged the correct amount,
As a customer,
I need to have the correct fare calculated.
```
|Object|Message|
|----|----|
|Customer||
|card|[calculate fare using station zones]|

