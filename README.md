# Use slim to write your Javascript templates

This is a fork of the wonderful slim_assets (https://github.com/crowdint/slim_assets) to work with Rails 4 & Ruby 2.

Use this to write Backbone.js or AngularJS templates in Slim and let the Rails asset pipeline take over.

## Installing

Add this to your `Gemfile`

    gem 'slim_assets', github: 'jigyasam/slim_assets, branch: 'jigyasam/rail4'
    gem 'slim'

# Using slim for your Javascript templates

## Templates directory

You should locate your templates under `app/assets`; we suggest `app/assets/templates`. In your Javascript manifest file (for example `application.js`), use `require_tree`

    //= require_tree ../templates

## The template file

Inside your templates directory, add your template file. The file should be named as follows

    your_template_name.html.slim

The asset pipeline will then generate the actual Javascript asset

**Important!** The asset pipeline is not invoking a controller to generate the templates. If you are using existing view templates, you may have to edit templates to remove some references to controller helpers.

### Helpers

All the ActionView and route helpers are available in your template. Eg:

ul
  li = link_to "Home", home_path

### Angular template variables & directives work. Eg:

div.items data-ng-repeat="item in items" {{ item }}


# Original Credits

* Les Hill : @leshill
* Wes Gibbs : @wgibbs

This gem is heavily based on their [haml_assets gem](https://github.com/infbio/haml_assets)

# About the Author

[Crowd Interactive](http://www.crowdint.com) is a web design and development company that happens to work in Colima, Mexico.
We specialize in building and growing online retail stores. We don’t work with everyone – just companies we believe in. Call us today to see if there’s a fit.
Find more info [here](http://www.crowdint.com)!
