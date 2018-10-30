require 'redmine'

require_dependency 'redmine_replace_chinese_quote/my_hook'

Redmine::Plugin.register :redmine_replace_chinese_quote do
  name 'Redmine Replace Chinese Quote Mark'
  author 'windviki'
  description 'This plugins enables you to replace Chinese quote mark to English.'
  version '0.0.1'
  url 'http://github.com/windviki/redmine_replace_chinese_quote' if respond_to?(:url)
  author_url 'http://github.com/windviki'
  requires_redmine :version_or_higher => '0.9.0'
end