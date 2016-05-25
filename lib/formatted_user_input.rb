class FormattedUserInput
	DIGIT_AND_DOT = /^\d+\.\s+/
	NEWLINE = /\r?\n/
	PARAGRAPH_DIVIDER = /#{NEWLINE}(#{NEWLINE})+/

	def initialize(string)
		if string.html_safe?
			@string = string
		else
			@string = ERB::Util.h(string)
		end
	end

	def to_html
		parts.map { |part| wrap_part(part) }.join.html_safe
	end

  def self.format(string)
    new(string).to_html
  end

	def to_s
		@string
	end

	def parts
	  @string.split("\n\n")
	end

	def wrap_part(part)
		if part.start_with?('# ')
			part = normalize(part, 1)
			tag = "h1"
		elsif part.start_with?('## ')
			part = normalize(part, 2)
			tag = "h2"
		elsif part.start_with?('### ')
			part = normalize(part, 3)
			tag = "h3"
		elsif list?(part)
			part = part.split("\n").map { |line| wrap(normalize(line, 2), "li") }.join
			tag = "ul"
		elsif ordered_list?(part)
			part = part.split("\n").map { |line| wrap(line.sub(DIGIT_AND_DOT, ""), "li") }.join
			tag = "ol"
		else
			tag = "p"
		end
		wrap(part, tag)
	end

	def wrap(part, tag = "p")
		"<#{tag}>#{part}</#{tag}>"
	end

	def list?(string)
		string.split("\n").all? { |line| line.start_with?('- ') }
	end

	def ordered_list?(string)
		string.split("\n").all? { |line| line =~ DIGIT_AND_DOT }
	end

	def normalize(string, index = 0)
		string[index..-1].strip
	end
end
