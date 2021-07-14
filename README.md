# Future_Alert

A Flutter plugin for showing alert dialog integrated with async await.

## Usage

Just one line:

Example
```Example
FutureAlert.warning(context, "Warning!", "Wow that didn't go well");
```

Await Async
```Await Async
await FutureAlert.done(context, "Done", "This alert has shown correctly");
```

Question
```Question
bool result = FutureAlert.question(context, "What'd you say?", "Choose wisely");
```

The result will be `true/false`:

## Examples
 
 Home                   |  Done | Question
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://gitlab.com/Josg182/future_alerts/-/raw/master/lib/images/home.png" width="250" height="500">  |  <img src="https://gitlab.com/Josg182/future_alerts/-/raw/master/lib/images/done.png" width="250" height="500"> |  <img src="https://gitlab.com/Josg182/future_alerts/-/raw/master/lib/images/question.png" width="250" height="500"> 