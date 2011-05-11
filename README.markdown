delayed_task
============

delayed_task allows you to run any rake task in the background using delayed_job. 


Install
-------

    # Gemfile
    gem 'delayed_task'

 
    # Rakefile (at the end)
    require 'tasks/delayed_tasks' 

Usage
-----

Add delayed: to the start of any rake task e.g.

    $ rake delayed:db:seed

rake db:seed will now be run in the background as a delayed_job