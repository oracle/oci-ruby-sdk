# Oracle Cloud Infrastructure Ruby SDK Development

## Getting Started
The following instructions assume that you have [rbenv](https://github.com/rbenv/rbenv) and [ruby-build](https://github.com/rbenv/ruby-build) installed to help you manage Ruby
versions on your machine so that your system wide Ruby version remains untouched.

You can then install different Ruby versions and set them as the one to use for the SDK. For example, to use Ruby 2.5.0:

```
rbenv install 2.5.0
rbenv local 2.5.0
```

Now clone the repository to your machine:

```
git clone https://github.com/oracle/oci-ruby-sdk.git
cd oci-ruby-sdk
```

### SDK Dependencies
Assuming that you have a local Ruby set up via `rbenv`, run the following from the `oci-ruby-sdk` directory:

```
# Running these two commands is only required once per Ruby
# version environment
gem install bundler
rbenv rehash

# Run this each time you want to install or refresh your gems
bundle install
```
This will install all the dependencies of the SDK into your workspace.

## Verifying Code Style
[Rubocop](https://github.com/bbatsov/rubocop) is used for static code analysis.  You can verify by the following:

```
rake rubocop
```

## Generating Documentation
[Yard](https://yardoc.org/) is used for documentation. You can generate the HTML formatted documentation locally by the following:

```
rake doc
```

This will output the generated documentation to the `doc` directory.

## Generating the Gem
You can now build and install the gem:

```
gem build oci.gemspec
```
This produces a `oci-x.x.x.gem` file in the `oci-ruby-sdk` directory (e.g., `oci-2.1.1.gem`).

You can now install it:

```
# Replace the gem file with the one that was generated from the build
gem install --local oci-2.1.1.gem
```

