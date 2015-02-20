# Usage:
# ruby main.rb "my_raw_schedule_html_file.html"

require 'erb'

require_relative 'epure/config'
require_relative 'models/schedule'
require_relative 'models/entry'
require_relative 'epure/parser'
require_relative 'epure/generators/generator'
require_relative 'epure/generators/html'


def parse_schedule(path)
	raw = File.read(path)
	Epure::Parser.parse!(raw)
end

class ScheduleView
	attr_accessor :schedule, :generator
	
	@@template_path = "schedule_page_tmpl.erb"

	def initialize(schedule)
	@schedule = schedule
	@generator = Epure::Generators::HTML.new(@schedule)
	end

	def get_binding
		binding()
	end
	
	def template_path
		@@template_path
	end

end


def render(schedule, render_to_out)
	schV = ScheduleView.new(schedule)
	
	template = File.read(schV.template_path)
	renderer = ERB.new(template)
	output = renderer.result(schV.get_binding())
	if render_to_out
		puts output
	end
end


raw_schedule_html_file = ARGV[0]
dry_run = ARGV.include? "dry"

#schedule = parse_schedule "my.html"
schedule = parse_schedule raw_schedule_html_file
render( schedule, !dry_run)

