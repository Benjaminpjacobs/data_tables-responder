# DataTables::Responder

## 0.5.0 _(Unreleased)_
- Added support for `UUID`
- Support (tests) for Rails 4.1 through 5.1
- Support (tests) for Ruby 2.3 - 2.4

## 0.4.2 _(June 27, 2017)_
- More standardized interface for modules
- Improved support for integers

## 0.4.1 _(April 11, 2017)_
- Fixes bug where `quick_count` was not loaded

## 0.4.0 _(April 11, 2017)_
- Fixes bug where table could be joined multiple times
- Improved search routine
- Fixes issue with deep/nested ordering (ordered on the top level class by mistake)
- `count_estimate` replaced with `quick_count` (includes a variant of `count_estimate`)

## 0.3.2 _(February 01, 2017)_
- Remove reliance on third-party "pagination"

## 0.3.1 _(January 31, 2017)_
- Improved determination of when to use `count_estimate` for large tables

## 0.3.0 _(January 31, 2017)_
- Significantly improves adapter injection to be less invasive
- BREAKING CHANGE: Multiple searches are combined as _AND_ instead of _OR_
- Introduces `count_estimate` for improved performance on counting large tables
- Fixes a bug where joining wasn’t persisting and the SQL ON condition was backwards

## 0.2.3 _(January 11, 2017)_
- Allow for dynamic nested relations with smart outer joins

## 0.2.2 _(January 09, 2017)_
- Handle column specific searching as well as "global" (default) searching
- Can search on integer columns

## 0.1.1 _(January 06, 2017)_
- Use "outer joins" for more lenient filtering

## 0.1.0 _(August 07, 2016)_
- Initial release with basic searching ability
- Mime::Type :dt Registration
