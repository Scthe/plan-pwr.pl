# Script version of 'Generator planu PWR': [plan-pwr.pl](http://plan-pwr.pl)

## Requirements

- ruby >= 2.0.0

## Usage

#### Get Your schedule file ( see below for screens)
1. Login to [Edukacja.CL](https://edukacja.pwr.wroc.pl/EdukacjaWeb/studia.do)
2. Go to **zapisy**
3. Click **Przełącz na &lt;Grupy zajęciowe do których słuchacz jest zapisany w semestrze&gt;**
4. Get the source of the page ( usually You have to click somewhere on the page with right mouse button and select *View page source*)
5. Save the source somewhere on Your hard drive

#### Execute script
1. ``` bundle install ```
1. ``` ruby main.rb FILE_WITH_YOUR_SCHEDULE > result_page.html```
f.e. ruby main.rb test_schedule.html > result_page.html
1. Open **result_page.html** in Your browser


![img_1]
*step 1

![img_2]
*step 2

![img_3]
*step 3


[img_1]: https://raw.github.com/Scthe/plan-pwr.pl/master/images/1.jpg
[img_2]: https://raw.github.com/Scthe/plan-pwr.pl/master/images/2.jpg
[img_3]: https://raw.github.com/Scthe/plan-pwr.pl/master/images/3.jpg
