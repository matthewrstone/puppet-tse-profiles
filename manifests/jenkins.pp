# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profiles::profile::jenkins
class profile::jenkins {
  $plugins = [
    'git',
    'puppet-enterprise-pipeline',
  ]

  include jenkins
  $plugins.each |$plugin| { jenkins::plugin { $plugin : } }
}
