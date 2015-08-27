When(/^I run `([^`]*)` in bash$/)do |cmd|
  cmd = "bash -c '%s'" % unescape_text(unescape_text(cmd))
  run_simple(cmd, false)
end
