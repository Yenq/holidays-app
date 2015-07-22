[![Code Climate](https://codeclimate.com/github/footnoise/holidays-app/badges/gpa.svg)](https://codeclimate.com/github/footnoise/holidays-app)
[![Test Coverage](https://codeclimate.com/github/footnoise/holidays-app/badges/coverage.svg)](https://codeclimate.com/github/footnoise/holidays-app/coverage)

Holidays App
============
Holidays App is a standalone app that allows users to list their places via a
CLI.

Features
--------
* Every property has the following attributes
  * title
  * property type, which is one of
    * holiday home
    * apartment
    * private room
  * address
  * nightly rate in USD
  * max guests
  * email
  * phone number

Examples of usage
-----------------
    $ holidays list
    No properties found.

    $ holidays new
    Starting with new property ABC1DEF2.

    Title: Amazing room at Central Park
    Address: ^C

    $ holidays list
    No offers found.

    $ holidays continue ABC1DEF2
    Continuing with ABC1DEF2

    Address: 355 5th Ave, New York
    Nightly rate in USD: 45.99
    Max guests: Two

    Error: must be a number

    Max guests: 2
    ^C

    $ holidays continue ABC1DEF2
    Continuing with ABC1DEF2

    Email: support@centralpark.com
    Phone number: +1 555 5555

    Great job! Listing ABC1DEF2 is complete!

    $ holidays list
    Found 1 offer.

    ABC1DEF2: Amazing Room at Central Park


    $ holidays view ABC1DEF2
    Listing ABC1DEF2 Details:
    Title: Amazing room at Central Park
    Address: 355 5th Ave, New York
    Nightly rate in USD: 45.99
    Max guests: 2
    Email: support@centralpark.com
    Phone number: +1 555 5555
