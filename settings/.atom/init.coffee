# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

# Workaround
# https://github.com/atom/atom-shell/issues/550#issuecomment-57195241
# process.env['PATH'] ='/Users/ylansegal/.rvm/gems/ruby-2.1.4@yeti/bin:/Users/ylansegal/.rvm/gems/ruby-2.1.4@global/bin:/Users/ylansegal/.rvm/rubies/ruby-2.1.4/bin:/Users/ylansegal/.rvm/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ylansegal/bin:/Users/ylansegal/ruby-dev-scripts:/usr/local/sbin:/usr/local/heroku/bin:/usr/local/share/npm/bin'
