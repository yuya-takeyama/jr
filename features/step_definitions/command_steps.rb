When(/^I run `([^`]*)` in bash$/)do |cmd|
  cmd = "bash -c '%s'" % unescape_text(unescape_text(cmd))
  run_command_and_stop(cmd, exit_timeout: 5)
end
