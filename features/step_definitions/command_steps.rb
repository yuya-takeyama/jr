When(/^I run `([^`]*)` in bash$/)do |cmd|
  cmd = "bash -c '%s'" % Aruba::Platform.unescape(cmd, aruba.config.keep_ansi)
  run_simple(cmd, false)
end
