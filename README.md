# Ruby on Rails Tutorial sample application

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
by [Michael Hartl](https://www.michaelhartl.com/).

See also the [6th edition README](https://github.com/learnenough/sample_app_6th_ed#readme).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems. You can clone the repo as follows:

```
$ git clone https://github.com/learnenough/rails_tutorial_sample_app_7th_ed 
$ cd rails_tutorial_sample_app_7th_ed/
```

To install the gems, you will need the same versions of Ruby and Bundler used to build the sample app, which you can find using the `cat` and `tail` commands as follows:

```
$ cat .ruby-version
<Ruby version number>
$ tail -n1 Gemfile.lock
   <Bundler version number>
```

Next, install the versions of `ruby` and the `bundler` gem from the above commands. The Ruby installation is system-dependent; on the cloud IDE recommended in the tutorial, it can be installed as follows:

```
$ rvm get stable
$ rvm install <Ruby version number>
$ rvm --default use <Ruby version number>
```

See the section [Up and running](https://www.learnenough.com/ruby-on-rails-7th-edition-tutorial#sec-up_and_running) for more details. Once Ruby is installed, the `bundler` gem can be installed using the `gem` command:

```
$ gem install bundler -v <version number>
```

Then the rest of the necessary gems can be installed with `bundle` (taking care to skip any production gems in the development environment):

```
$ bundle _<version number>_ config set --local without 'production'
$ bundle _<version number>_ install
```

Here you should replace `<version number>` with the actual version number. For example, if `<version number>` is `2.3.14`, then the commands should look like this:

```
$ gem install bundler -v 2.3.14
$ bundle _2.3.14_ config set --local without 'production'
$ bundle _2.3.14_ install
```

If you run into any trouble, you can remove `Gemfile.lock` and rebundle at any time:

```
$ rm -f Gemfile.lock
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:

```
$ rails db:seed
$ rails server
```

Follow the instructions in [Section 1.2.2 `rails server`](https://www.railstutorial.org/book#sec-rails_server) to view the app. You can then register a new user or log in as the sample administrative user with the email `example@railstutorial.org` and password `foobar`.

## Deploying

To deploy the sample app to production, you’ll need a Heroku account as discussed [Section 1.4 Deploying](https://www.railstutorial.org/book/beginning#sec-deploying).

The full production app includes several advanced features, including sending email with [SendGrid](https://sendgrid.com/) and storing uploaded images with [AWS S3](https://aws.amazon.com/s3/). As a result, deploying the full sample app can be rather challenging. The suggested method for testing a deployment is to use the branch for Chapter 10 (“Updating users”), which doesn’t require more advanced settings but still includes sample users.

To deploy this version of the app, you’ll need to create a new Heroku application, switch to the right branch, push up the source, run the migrations, and seed the database with sample users:

```
$ heroku create
$ git checkout updating-users
$ git push heroku updating-users:main
$ heroku run rails db:migrate
$ heroku run rails db:seed
```

Visiting the URL returned by the original `heroku create` should now show you the sample app running in production. As with the local version, you can then register a new user or log in as the sample administrative user with the email `example@railstutorial.org` and password `foobar`.

## Branches

The reference app repository includes a separate branch for each chapter in the tutorial (Chapters 3–14). To examine the code as it appears at the end of a particular chapter (with some slight variations, such as occasional exercise answers), simply check out the corresponding branch using `git checkout`:

```
$ git checkout <branch name>
```

A full list of branch names appears as follows (preceded the number of the corresponding chapter in the book):

```
 3. static-pages
 4. rails-flavored-ruby
 5. filling-in-layout
 6. modeling-users
 7. sign-up
 8. basic-login
 9. advanced-login
10. updating-users
11. account-activation
12. password-reset
13. user-microposts
14. following-users
```

For example, to check out the branch for Chapter 7, you would run this at the command line:

```
$ git checkout sign-up
```

## Help with the Rails Tutorial

Experience shows that comparing code with the reference app is often helpful for debugging errors and tracking down discrepancies. For additional assistance with any issues in the tutorial, please consult the [Rails Tutorial Help page](https://github.com/learnenough/rails_tutorial_sample_app_7th_ed/blob/main/HELP.md).

Suspected errors, typos, and bugs can be emailed to <michael@learnenough.com>. All such reports are gratefully received, but please double-check with the [online version of the tutorial](https://www.railstutorial.org/book) and this reference app before submitting.
