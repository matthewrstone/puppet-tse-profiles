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
    'workflow-scm-step',
    'workflow-step-api',
    'structs',
    'workflow-api',
    'workflow-basic-steps',
    'workflow-cps',
    'workflow-durable-task-step',
    'git-client',
    'scm-api',
    'matrix-project',
    'mailer',
    'ssh-credentials'
  ]

  include jenkins
  $plugins.each |$plugin| { jenkins::plugin { $plugin : } }
}
