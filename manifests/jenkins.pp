# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profiles::profile::jenkins
class profile::jenkins {
  $plugins = [
    'git',
    'Puppet Enterprise Pipeline',
  ]

  include jenkins
  $plugins.each |$plugin| { jenkins::plugin { $plugin : } }
}
