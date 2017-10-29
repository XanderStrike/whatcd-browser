# what-browser

This is a barebones rails app for exploring the database of the late, great What.CD.

It is available here: http://whatbrowser.astandke.com

## Setup

You will need:

* A copy of the [What.CD 10-year anniversary mixtape](https://www.reddit.com/r/trackers/comments/7945de/whatcd_10year_anniversary_mixtape/)
* Ruby and Rails
* Mysql
* Probably linux or macos, I haven't tested for windows, you're on your own

Follow these steps:

0. Clone the repository
0. Create a database called `whatcd`
0. Load the mysql dumps provided by What.CD (i.e. `7z e -so torrents.sql.7z | mysql -uroot`)
0. `bundle install`
0. Run the server with `rails s` or `passenger start`

That should get you there. Note that you do not need to `rake db:migrate`, the database does not need to be modified for this tool.

## Hacking

You are encouraged to fork this project, host it yourself, and make changes all you wish. I ask that if you add functionality that others might find valuable, you open a Pull Request back here. The code is already in a bit of a... state. So don't worry too much about being pretty.

## License

MIT, see LICENSE.TXT
