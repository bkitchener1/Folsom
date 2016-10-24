require 'cucumber/core/gherkin/parser'
require 'cucumber/core/gherkin/document'
require 'cucumber/core/compiler'
require 'cucumber/core/test/runner'

module Cucumber
  module Core
    module Gherkin
      class Document
        def body=(value)
          @body = value
        end
      end
    end
  end

module Core

    def execute(gherkin_documents, report, filters = [])
      receiver = Test::Runner.new(report)
      compile gherkin_documents, receiver, filters
      self
    end

    def compile(gherkin_documents, last_receiver, filters = [])
      first_receiver = compose(filters, last_receiver)
      compiler = Compiler.new(first_receiver)
      parse gherkin_documents, compiler
      self
    end

    private

    def update_for_size_tag(body,tag)
      all_sizes = $sizes.dup
      all_sizes.delete(tag)
      text = body
      all_sizes.each { |size|
        text = text.gsub(size,"")
      }
      text = text.gsub("Feature:","Feature: #{tag} ")
      return text
      end


    def parse(gherkin_documents, compiler)
      parser = Core::Gherkin::Parser.new(compiler)
      gherkin_documents.each do |document|
        $sizes.each { |size|
          $current_size = size
          if document.body.include? size
            new_doc = document.dup
            new_doc.body = update_for_size_tag(document.body, size)
            parser.document new_doc
          end
        }
      end
      parser.done
      self
    end

    def compose(filters, last_receiver)
      filters.reverse.reduce(last_receiver) do |receiver, filter|
        filter.with_receiver(receiver)
      end
    end
  end
end
