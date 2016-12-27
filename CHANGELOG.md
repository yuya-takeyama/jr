# Change Log

## [0.5.0] - 2016-12-28

### Changed

* Dropped support for Ruby 2.0 and 2.1, and support Ruby 2.3 and 2.4

### Removed

* `Kernel#itself` method as a core\_ext

## [0.4.0] - 2015-08-29

### Added

* `--unbuffered` option [#14](https://github.com/yuya-takeyama/jr/pull/14)

## [0.3.1] - 2015-08-29

### Fixed

* Any `Enumerable` object except for `Hash` is enumerated [#13](https://github.com/yuya-takeyama/jr/pull/13)

## [0.3.0] - 2015-08-28

### Added

* `--raw-input` option [#9](https://github.com/yuya-takeyama/jr/pull/9)
* `--from-file` option [#10](https://github.com/yuya-takeyama/jr/pull/10)
* `--null-input` option [#11](https://github.com/yuya-takeyama/jr/pull/11)
* Do indentation when filter is omitted [#12](https://github.com/yuya-takeyama/jr/pull/12)

## [0.2.0] - 2015-08-19

### Changed

* [BREAKING CHANGE] Now `-r` is alias for `--raw-output` and use `--require` to require library [#5](https://github.com/yuya-takeyama/jr/pull/5)
* Colorize output by default

### Added

* core\_ext modules for `Hash`, `Enumerable` and `Enumerator` [#3](https://github.com/yuya-takeyama/jr/pull/3) [#6](https://github.com/yuya-takeyama/jr/pull/6) [#7](https://github.com/yuya-takeyama/jr/pull/7)
* `--compact-output` option [#4](https://github.com/yuya-takeyama/jr/pull/4)
* `--color-output` option [#8](https://github.com/yuya-takeyama/jr/pull/8)
* `--monochrome-output` option [#8](https://github.com/yuya-takeyama/jr/pull/8)

## [0.1.0] - 2014-11-06

### Added

* Add `-r` option to require library

## [0.0.3] - 2014-11-05

### Fixed

* Handle SIGINT

## [0.0.2] - 2014-10-06

### Changed

* JSON Enumerator is returned as Enumerator::Lazy by default

### Fixed

* Add Kernel#itself method for Ruby 2.1 or earlier

## [0.0.1] - 2014-10-03

* Initial release
