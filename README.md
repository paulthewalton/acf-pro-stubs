# ~~WordPress~~ Advanced Custom Fields PRO Stubs

**Just like [paulthewalton/acf-stubs](https://github.com/paulthewalton/acf-stubs), but for ACF Pro!**

[![Build Status](https://travis-ci.org/paulthewalton/acf-pro-stubs.svg?branch=master)](https://travis-ci.org/paulthewalton/acf-pro-stubs)

This package provides stub declarations for ~~Wordpress~~ [Advanced Custom Fields (ACF)](https://wordpress.org/plugins/advanced-custom-fields/) core functions, classes, interfaces, and global variables. These stubs can help plugin and theme developers leverage static analysis tools.

The stubs are generated directly from the [source](https://wpackagist.org/search?q=advanced-custom-fields&type=plugin&search=) using [giacocorsiglia/stubs-generator](https://github.com/GiacoCorsiglia/php-stubs-generator). Needless to say, this library repackages a subset of ~~WordPress~~ ACF code, which is the work of the ~~WordPress core~~ ACF developers. Granted, it's a useless subset without the real thing!

Many thanks to [GiacoCorsiglia](https://github.com/GiacoCorsiglia), who did all the hard work on [giacocorsiglia/wordpress-stubs](https://github.com/GiacoCorsiglia/wordpress-stubs), from which this is shamelessly ripped off.

## Installation

Require this package as a dev-dependency with [Composer](https://getcomposer.org):

```
composer require --dev paulthewalton/acf-pro-stubs
```

Alternatively, you may download `acf-pro-stubs.php` directly.

## Usage for Intellisense

From Wordpress Stubs:

> If your editor has trouble parsing all of WordPress, you may find the stubs useful for enabling code completion and related features. For example, [here](https://github.com/bmewburn/vscode-intelephense/issues/113) are instructions for usage with VSCode's [Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client) extension. (In my experience, however, Intelephense parses WordPress core just fine.)

## Versioning

This package is versioned to match the ACF version from which the stubs are generated. If any fixes to stubs are required, subsequent releases will be versioned as `ACF_VERSION.X`.

## Generating stubs for a different ACF version

Retrieving the source code for ACF Pro requires you to have a valid license key. You should be running PHP 7.1 or later to follow these steps, so any function definitions that are polyfills for older versions of PHP are excluded from the stubs. Additionally, the Stubs Generator package at least requires PHP 7.1.

1. Clone this repository and `cd` into it.
2. Set the environment variable `ACF_PRO_KEY` to your [ACF PRO key](https://www.advancedcustomfields.com/my-account/).

    Alternatively you can add an entry in a `.env` file:

    ```ini
    # .env (same directory as composer.json)
    ACF_PRO_KEY=Your-Key-Here
    ```

3. Update the version number in `composer.json` with your desired version:

    ### Choosing an older version

    If generating stubs for an older version of ACF Pro, you can just specify the lower version number in the dependancies array.

    ```json
    "advanced-custom-fields/advanced-custom-fields-pro": "X.X.X"
    ```

    ### Choosing a newer version
    
    To generate from a newer version of ACF Pro, you'll need to change the version in the package repository.
    
    ```json
    {
        "type": "package",
        "package": {
            "name": "advanced-custom-fields/advanced-custom-fields-pro",
            "version": "X.X.X",
            //...
        }
    }
    ```
    
4. Run `composer update`
5. Run `./generate.sh`

The `acf-pro-stubs.php` file should now be updated. Feel free to submit a Pull Request if you'd like to see a release for a newer version. If things have fallen behind, please generate stubs for each missing version in a distinct commit so we can have a continuous release history.
