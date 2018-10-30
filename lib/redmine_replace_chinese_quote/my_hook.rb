module RedmineReplaceChineseQuote
  module Hooks
    class ControllerIssuesEditBeforeSaveHook < Redmine::Hook::ViewListener
      #:controller_issues_bulk_edit_before_save :params, :issue
      #:controller_journals_edit_post :params, :journal
      #:controller_issues_new_before_save :params, :issue
      #:controller_issues_edit_before_save :params, :issue, :time_entry, :journal
      # gsub(/(-》)/, '->')

      def controller_issues_new_before_save(context={})

        if context[:issue]
          context[:issue].subject = context[:issue].subject.gsub(/(“|”|‘|’)/, "\"")
          context[:issue].description = context[:issue].description.gsub(/(“|”|‘|’)/, "\"")
        end

        return ''
      end

      def controller_issues_edit_before_save(context={})

        if context[:issue]
          context[:issue].subject = context[:issue].subject.gsub(/(“|”|‘|’)/, "\"")
          context[:issue].description = context[:issue].description.gsub(/(“|”|‘|’)/, "\"")
        end
        if context[:journal]
          context[:journal].notes = context[:journal].notes.gsub(/(“|”|‘|’)/, "\"")
        end

        return ''
      end

      def controller_journals_edit_post(context={})

        if context[:journal]
          context[:journal].notes = context[:journal].notes.gsub(/(“|”|‘|’)/, "\"")
        end

        return ''
      end

      alias_method :controller_issues_bulk_edit_before_save, :controller_issues_new_before_save

    end

  end
end