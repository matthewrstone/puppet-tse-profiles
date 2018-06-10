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
    'structs',
    'workflow-api',
    'workflow-basic-steps',
    'workflow-cps',
    'workflow-durable-task-step',
    'workflow-scm-step',
    'workflow-step-api',
    'workflow-support',
    'git-client',
    'scm-api',
    'matrix-project',
    'mailer',
    'ssh-credentials',
    'script-security',
    'durable-task',
    'apache-httpcomponents-client-4-api',
    'jsch',
    'ace-editor',
    'jquery-detached',
    'display-url-api',
    'junit',
    'plain-credentials',
  ]


  include jenkins
  $plugins.each |$plugin| { jenkins::plugin { $plugin : } }
}
